import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, required this.name, required this.pressNotificationIcon});
  final String name;
  final VoidCallback pressNotificationIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: pressNotificationIcon,
            icon: CircleAvatar(
              radius: 24,
              backgroundColor: ColorsManager.moreLighterGray,
              child: SvgPicture.asset('assets/svgs/notification.svg'),
            )),
      ],
    );
  }
}
