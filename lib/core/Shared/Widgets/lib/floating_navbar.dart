library floating_navbar;

import 'package:crypto_app/core/Shared/Widgets/floatingNavigationBar/floating_navbar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class FloatingNavBar extends StatefulWidget {
  /// FloatingNavBar
  ///
  /// [FloatingNavbar] Base class for the bottom navigation bar

  /// The current page index
  int index;

  /// The items to be displayed on the navbar
  List<FloatingNavBarItem> items;

  /// The color of the navbar card
  Color color;

  /// The color of unselected page icons
  Color unselectedIconColor;

  /// The color of selected page icons
  Color selectedIconColor;

  /// The horizontal padding between the navbar card and the page
  double horizontalPadding;

  /// Allow haptic feedback on page change
  bool hapticFeedback;

  /// The border radius of the navbar card
  double borderRadius;

  /// The width of the navbar card
  double? cardWidth;

  /// Make use of titles/labels instead of the dot indicator
  bool showTitle;

  bool resizeToAvoidBottomInset;

  FloatingNavBar({
    Key? key,
    this.index = 0,
    this.borderRadius = 15.0,
    this.cardWidth,
    this.showTitle = false,
    this.selectedIconColor = Colors.white,
    this.unselectedIconColor = Colors.white,
    this.resizeToAvoidBottomInset = false,
    required this.horizontalPadding,
    required this.items,
    required this.color,
    required this.hapticFeedback,
  })  : assert(items.length > 1),
        assert(items.length <= 5);

  @override
  _FloatingNavBarState createState() {
    return _FloatingNavBarState();
  }
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  PageController _pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: widget.items.map((item) => item.page).toList(),
              onPageChanged: (index) => this._changePage(index),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: widget.horizontalPadding,
                ),
                child: Container(
                  height: 70,
                  width: widget.cardWidth ?? MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                      ),
                      BoxShadow(
                        color: Colors.transparent,
                        spreadRadius: -5.0,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Card(
                    color: widget.color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          _widgetsBuilder(widget.items, widget.hapticFeedback),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [_floatingNavBarItem] will build and return a [FloatingNavBar] item widget
  Widget _floatingNavBarItem(
      FloatingNavBarItem item, int index, bool hapticFeedback) {
    // If showTitle is set to true then no [FloatingNavBarItem] can have no title
    if (widget.showTitle && item.title.isEmpty) {
      throw Exception(
          'Show title set to true: Missing FloatingNavBarItem title!');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // If haptic feedback is set to true then use mediumImpact on FloatingNavBarItem tap
            if (hapticFeedback == true) {
              HapticFeedback.mediumImpact();
            }
            _changePage(index);
          },
          child: Container(
            padding: EdgeInsets.all(6),
            width: 50,
            child: item.useImageIcon
                ? item.icon
                : Icon(
                    item.iconData,
                    color: widget.index == index
                        ? widget.selectedIconColor
                        : widget.unselectedIconColor,
                  ),
          ),
        ),
        widget.showTitle
            ? AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                child: widget.index == index
                    ? Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 15,
                          color: widget.index == index
                              ? widget.selectedIconColor
                              : Colors.transparent,
                        ),
                      )
                    : SizedBox.shrink(),
              )
            : Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.index == index
                      ? widget.selectedIconColor
                      : Colors.transparent,
                ),
              ),
      ],
    );
  }

  /// [_widgetsBuilder] adds widgets from [_floatingNavBarItem] into a List<Widget> and returns the list
  List<Widget> _widgetsBuilder(
      List<FloatingNavBarItem> items, bool hapticFeedback) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = this._floatingNavBarItem(items[i], i, hapticFeedback);
      _floatingNavBarItems.add(item);
    }
    return _floatingNavBarItems;
  }

  /// [_changePage] changes selected page index so as to change the page being currently viewed by the user
  _changePage(index) {
    _pageController.jumpToPage(index);
    setState(() {
      widget.index = index;
    });
  }
}