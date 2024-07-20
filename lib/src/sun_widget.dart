import 'package:change_theme/src/inherited_widget.dart';
import 'package:change_theme/src/night_widget.dart';
import 'package:change_theme/utilities/const/assets.dart';
import 'package:change_theme/utilities/const/color.dart';
import 'package:flutter/material.dart';

class SunWidget extends StatefulWidget {
  const SunWidget({super.key});

  @override
  State<SunWidget> createState() => _SunWidgetState();
}

class _SunWidgetState extends State<SunWidget> {
  double switchWidth = 369.0;
  double switchHeight = 145.0;

  Duration animationDuration = const Duration(milliseconds: 3000);
  Duration animationBackground = const Duration(milliseconds: 2000);

  void onTapSwitch() {
    setState(() {
      MyInheritedWidget.of(context)!.isNight =
          !MyInheritedWidget.of(context)!.isNight;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isNight = MyInheritedWidget.of(context)!.isNight;
    return AnimatedOpacity(
      duration: animationDuration,
      opacity: isNight ? 0 : 1,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: switchHeight,
            width: switchWidth,
            decoration: const BoxDecoration(
              color: AppColor.blue,
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: animationBackground,
                  curve: Curves.decelerate,
                  top: isNight ? switchHeight : 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: backgroundSun(),
                ),
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: Curves.easeOutBack,
                  top: 0,
                  bottom: 0,
                  left: isNight ? switchWidth - 145 : 0,
                  child: SizedBox(
                    width: switchWidth,
                    height: 328,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          top: -92,
                          bottom: -92,
                          child: Container(
                            height: 240,
                            width: 240,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -57,
                          bottom: -57,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          bottom: -20,
                          child: Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          child: InkWell(
                            onTap: onTapSwitch,
                            child: Image.asset(
                              AppAsset.sun,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget backgroundSun() {
    return Stack(
      children: [
        Positioned(
          top: 2,
          right: 6,
          child: Image.asset(
            AppAsset.cloud_backs,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: switchHeight,
          width: switchWidth,
          child: Image.asset(AppAsset.cloud, fit: BoxFit.fill),
        ),
      ],
    );
  }
}
