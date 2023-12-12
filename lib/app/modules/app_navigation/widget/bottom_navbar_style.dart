import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    Key? key,
    required this.items,
    this.selectedIndex,
    this.onItemSelected,
  }) : super(key: key);

  final int? selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int>? onItemSelected;

  Widget _buildItem(
      {required PersistentBottomNavBarItem item, required bool isSelected}) {
    return Container(
      color: const Color(CVCarColors.primaryColor),
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary ?? item.activeColorPrimary)
                      : item.inactiveColorPrimary ?? item.activeColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title ?? '',
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(CVCarColors.primaryColor),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  if (onItemSelected != null) {
                    onItemSelected!(index);
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  child: _buildItem(
                    item: item,
                    isSelected: selectedIndex == index,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
