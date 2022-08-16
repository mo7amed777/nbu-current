import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:flutter/material.dart';
import 'package:northern_border_university/controller/app_theme.dart';

class Appbar extends StatefulWidget {
  const Appbar({
    required this.title,
    this.icon,
    this.onIconPressed,
    this.onSearch,
    this.search,
  });
  final IconData? icon;
  final IconData? search;
  final String title;
  final Function? onIconPressed;
  final Function? onSearch;

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 16, right: 4.0),
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              widget.icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: SizedBox(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        child: Material(
                          color: AppTheme.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
                            child: Icon(
                              widget.icon,
                              color: AppTheme.green,
                            ),
                            onTap: () {
                              widget.onIconPressed!();
                            },
                          ),
                        ),
                      ),
                    )
                  : Container(),
              widget.search != null
                  ? SearchBarAnimation(
                      durationInMilliSeconds: 300,
                      isSearchBoxOnRightSide: true,
                      enableKeyboardFocus: true,
                      hintText: 'Search...',
                      onChanged: (val) => widget.onSearch!(val),
                      searchBoxWidth: widget.icon == null
                          ? MediaQuery.of(context).size.width - 2
                          : MediaQuery.of(context).size.width - 50,
                      isOriginalAnimation: false,
                      textEditingController: _textEditingController,
                      buttonBorderColour: AppTheme.green,
                      buttonIcon: widget.search,
                      onFieldSubmitted: (String value) {
                        debugPrint('onFieldSubmitted value $value');
                      },
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
