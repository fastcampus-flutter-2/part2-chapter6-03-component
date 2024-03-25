import 'package:flutter/material.dart';
import 'package:tool_clind_component/component.dart';
import 'package:tool_clind_theme/theme.dart';

enum ClindNavigationType {
  home(title: '홈'),
  notification(title: '알림'),
  my(title: '마이페이지');

  final String title;

  const ClindNavigationType({
    required this.title,
  });
}

class ClindBottomNavigationItem {
  final ClindNavigationType type;

  const ClindBottomNavigationItem({
    required this.type,
  });

  factory ClindBottomNavigationItem.home() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.home,
    );
  }

  factory ClindBottomNavigationItem.notification() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.notification,
    );
  }

  factory ClindBottomNavigationItem.my() {
    return const ClindBottomNavigationItem(
      type: ClindNavigationType.my,
    );
  }
}

class ClindBottomNavigationBar extends StatelessWidget {
  final List<ClindBottomNavigationItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const ClindBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClindDivider.horizontal(),
        SizedBox(
          height: context.navigationBarThemeData.height + MediaQuery.viewPaddingOf(context).bottom,
          child: ColoredBox(
            color: context.colorScheme.darkBlack,
            child: Padding(
              padding: EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: MediaQuery.viewPaddingOf(context).bottom,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  items.length,
                  (index) {
                    final ClindBottomNavigationItem item = items[index];
                    final bool isSelected = index == currentIndex;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onTap.call(index),
                        behavior: HitTestBehavior.translucent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClindNavigationTypeIcon(
                              type: item.type,
                              isSelected: isSelected,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              item.type.title,
                              style: isSelected
                                  ? context.textTheme.default11Regular.copyWith(
                                      color: context.colorScheme.gray100,
                                    )
                                  : context.textTheme.default11Light.copyWith(
                                      color: context.colorScheme.gray200,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClindNavigationTypeIcon extends StatelessWidget {
  final ClindNavigationType type;
  final bool isSelected;

  const ClindNavigationTypeIcon({
    super.key,
    required this.type,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = context.colorScheme.white;

    if (isSelected) {
      return switch (type) {
        ClindNavigationType.home => ClindIcon.homeOn(color: color),
        ClindNavigationType.notification => ClindIcon.notificationsOn(color: color),
        ClindNavigationType.my => ClindIcon.personOn(color: color),
      };
    }

    return switch (type) {
      ClindNavigationType.home => ClindIcon.homeOff(color: color),
      ClindNavigationType.notification => ClindIcon.notificationsOff(color: color),
      ClindNavigationType.my => ClindIcon.personOff(color: color),
    };
  }
}