import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:northern_border_university/controller/themes/app_theme.dart';

class Appbar extends StatefulWidget {
  const Appbar({
    required this.title,
    this.icon = Icons.dashboard,
    required this.onIconPressed,
    required this.onSearch,
    this.search = false,
    this.searchController,
    this.view = true,
  });
  final IconData icon;
  final String title;
  final TextEditingController? searchController;
  final Function onIconPressed, onSearch;
  final bool search, view;
  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
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
                    color: AppTheme.darkerText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              widget.view
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: SizedBox(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
                            child: Icon(
                              widget.icon,
                              color: AppTheme.grey,
                            ),
                            onTap: () {
                              widget.onIconPressed();
                            },
                          ),
                        ),
                      ),
                    )
                  : Container(),
              widget.search
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: AnimSearchBar(
                        width: MediaQuery.of(context).size.width -
                            AppBar().preferredSize.height,
                        color: AppTheme.background,
                        prefixIcon: Icon(
                          FontAwesomeIcons.search,
                          size: 18,
                        ),
                        textController:
                            widget.searchController ?? TextEditingController(),
                        onSuffixTap: () {
                          widget.searchController?.clear();
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
