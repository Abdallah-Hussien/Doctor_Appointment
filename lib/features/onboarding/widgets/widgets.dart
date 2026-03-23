import 'package:doc_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helper/spacing.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assetName'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [.14, .4],
            ),
          ),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            'Best Doctor\n Appointment App',
            style: TextStyles.font32BlueBold.copyWith(height: 1.2),
          ),
        ),
      ],
    );
  }
}

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/logo.svg'),
        horizontalSpace(5),
        Text(
          'DocDoc',
          style: TextStyles.font24BlackBold,
        )
      ],
    );
  }
}
