import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_login/theme.dart';
import 'package:flutter_login/widgets.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'package:northern_border_university/view/screens/darwer_screens/about%20US.dart';
import 'package:northern_border_university/view/screens/darwer_screens/feedback_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/help_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/home_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/navigation_home_screen.dart';
import 'package:northern_border_university/view/screens/darwer_screens/profile.dart';
import 'package:northern_border_university/view/screens/main_screens/About%20the%20University/ContactUS.dart';
import 'package:northern_border_university/view/screens/main_screens/Administration/University%20President%20Office/Contact%20US.dart';
import 'package:northern_border_university/view/screens/main_screens/E-Services/EServices.dart';
import 'package:northern_border_university/view/screens/settings/settings.dart';
import 'package:northern_border_university/view/widgets/custom_drawer/drawer_user_controller.dart';
import 'package:northern_border_university/view/widgets/custom_drawer/home_drawer.dart';
import 'transition_route_observer.dart';
import 'widgets/fade_in.dart';
import 'widgets/animated_numeric_text.dart';
import 'widgets/round_button.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin, TransitionRouteAware {
  Future<bool> _goToLogin(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/auth')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  final routeObserver = TransitionRouteObserver<PageRoute?>();
  static const headerAniInterval = Interval(.1, .3, curve: Curves.easeOut);
  late Animation<double> _headerScaleAnimation;
  AnimationController? _loadingController;
  DrawerIndex? drawerIndex;
  Widget? screenView;

  @override
  void initState() {
    super.initState();
    drawerIndex = DrawerIndex.EServices;
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _headerScaleAnimation =
        Tween<double>(begin: .6, end: 1).animate(CurvedAnimation(
      parent: _loadingController!,
      curve: headerAniInterval,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute<dynamic>?);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _loadingController!.dispose();
    super.dispose();
  }

  @override
  void didPushAfterTransition() => _loadingController!.forward();

  AppBar _buildAppBar(ThemeData theme) {
    final signOutBtn = IconButton(
      icon: const Icon(FontAwesomeIcons.rightFromBracket),
      color: Color.fromARGB(160, 0, 0, 0),
      onPressed: () => _goToLogin(context),
    );
    final title = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'NBU',
            child: Icon(
              Icons.e_mobiledata,
              size: 35,
              color: AppTheme.lightGreen,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: HeroText(
              'SERVICES',
              tag: 'NBU-Logo',
              viewState: ViewState.shrunk,
              style: LoginThemeHelper.loginTextStyle?.copyWith(
                color: Color.fromARGB(160, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 7,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );

    return AppBar(
      leading: Container(),
      actions: <Widget>[
        FadeIn(
          controller: _loadingController,
          offset: .3,
          curve: headerAniInterval,
          fadeDirection: FadeDirection.endToStart,
          child: signOutBtn,
        ),
      ],
      title: title,
      backgroundColor: AppTheme.background,
      elevation: 0,
      // toolbarTextStyle: TextStle(),
      // textTheme: theme.accentTextTheme,
      // iconTheme: theme.accentIconTheme,
    );
  }

  Widget _buildHeader(ThemeData theme) {
    final primaryColor =
        Colors.primaries.where((c) => c == theme.primaryColor).first;
    final accentColor =
        Colors.primaries.where((c) => c == theme.colorScheme.secondary).first;
    final linearGradient = LinearGradient(colors: [
      primaryColor.shade800,
      primaryColor.shade200,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 418.0, 78.0));

    return ScaleTransition(
      scale: _headerScaleAnimation,
      child: FadeIn(
        controller: _loadingController,
        curve: headerAniInterval,
        fadeDirection: FadeDirection.bottomToTop,
        duration: Duration(seconds: 3),
        child: AnimatedNumericText(
          initialValue: 1,
          targetValue: 30,
          curve: const Interval(0, 1, curve: Curves.easeOut),
          controller: _loadingController!,
          text: 'Student Name',
        ),
      ),
    );
  }

  Widget _buildButton(
      {Widget? icon,
      String? label,
      required Interval interval,
      required Function callback}) {
    return RoundButton(
      icon: icon,
      label: label,
      loadingController: _loadingController,
      interval: Interval(
        interval.begin,
        interval.end,
        curve: const ElasticOutCurve(0.42),
      ),
      onPressed: () => callback(),
    );
  }

  Widget _buildDashboardGrid() {
    const step = 0.04;
    const aniInterval = 0.75;

    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 20,
      ),
      childAspectRatio: .9,
      // crossAxisSpacing: 5,
      crossAxisCount: 3,
      children: [
        _buildButton(
          icon: const Icon(
            FontAwesomeIcons.user,
          ),
          label: 'Profile',
          interval: const Interval(0, aniInterval),
          callback: () {
            Get.to(() => Profile());
          },
        ),
        _buildButton(
          icon: Container(
            // fix icon is not centered like others for some reasons
            padding: const EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.apps,
              size: 35,
            ),
          ),
          label: 'My Services',
          interval: const Interval(step, aniInterval + step),
          callback: () {
            Get.to(() => EServices());
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.home),
          label: 'E-Gate',
          interval: const Interval(step * 2, aniInterval + step * 2),
          callback: () {
            Get.to(() => NavigationHomeScreen());
          },
        ),
        _buildButton(
          icon: const Icon(
            Icons.report,
            size: 35,
          ),
          label: 'Report',
          interval: const Interval(0, aniInterval),
          callback: () {
            Get.to(() => ContactOurOffice());
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.phoneFlip),
          label: 'Contact US',
          interval: const Interval(step, aniInterval + step),
          callback: () {
            Get.to(() => ContactUS());
          },
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.clockRotateLeft),
          label: 'History',
          interval: const Interval(step * 2, aniInterval + step * 2),
          callback: () {},
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.ellipsis),
          label: 'Other',
          interval: const Interval(0, aniInterval),
          callback: () {},
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
          label: 'Search',
          interval: const Interval(step, aniInterval + step),
          callback: () {},
        ),
        _buildButton(
          icon: const Icon(FontAwesomeIcons.sliders, size: 20),
          label: 'Settings',
          interval: const Interval(step * 2, aniInterval + step * 2),
          callback: () {
            Get.to(() => Settings());
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => _goToLogin(context),
      child: SafeArea(
        child: Scaffold(
          //appBar: _buildAppBar(theme),
          body: dashboardBody(theme),
        ),
      ),
    );
  }

  Widget dashboardBody(ThemeData theme) => Container(
        width: double.infinity,
        height: double.infinity,
        color: AppTheme.background,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: _buildAppBar(theme),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Expanded(
                  flex: 2,
                  child: _buildHeader(theme),
                ),
                Expanded(
                  flex: 8,
                  child: ShaderMask(
                    // blendMode: BlendMode.srcOver,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                        colors: <Color>[
                          AppTheme.lightGreen.withOpacity(0.7),
                          AppTheme.lightGreen,
                          AppTheme.lightGreen,
                          AppTheme.lightGreen.withOpacity(0.7),
                          // Colors.red,
                          // Colors.yellow,
                        ],
                      ).createShader(bounds);
                    },
                    child: _buildDashboardGrid(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
