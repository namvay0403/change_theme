
import 'package:change_theme/utilities/const/assets.dart';
import 'package:change_theme/utilities/const/color.dart';
import 'package:flutter/material.dart';

class TempWidget extends StatefulWidget {
  const TempWidget({super.key});

  @override
  State<TempWidget> createState() => _TempWidgetState();
}

class _TempWidgetState extends State<TempWidget> {
  double switchWidth = 369.0;
  double switchHeight = 145.0;

  Duration animationDuration = const Duration(milliseconds: 2000);
  Duration animationBackground = const Duration(milliseconds: 1500);

  var isNight = false;

  void onTapSwitch() {
    setState(() {
      isNight = !isNight;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var isNight = MyInheritedWidget.of(context)!.isNight;
    return Scaffold(
      backgroundColor: AppColor.grey.withOpacity(0.9),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: switchHeight + 7,
              width: switchWidth + 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.white.withOpacity(0.4),
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: const Offset(1, 3),
                  ),
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: -10.5,
                    offset: const Offset(-1, -10),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: switchHeight,
                width: switchWidth,
                decoration: BoxDecoration(
                  color: isNight ? AppColor.black : AppColor.blue,
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
                      left: isNight ? switchWidth - 133 : 0,
                      child: SizedBox(
                        width: switchWidth,
                        height: 328,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            AnimatedOpacity(
                              duration: animationDuration,
                              curve: Curves.easeOutBack,
                              opacity: isNight ? 0 : 1,
                              child: Stack(
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 10,
                              ),
                              child: InkWell(
                                onTap: onTapSwitch,
                                borderRadius: BorderRadius.circular(100),
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
                    AnimatedPositioned(
                      duration: animationBackground,
                      curve: Curves.decelerate,
                      top: isNight ? 0 : -switchHeight,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: backgroundNight(),
                    ),
                    AnimatedOpacity(
                      duration: animationDuration,
                      curve: Curves.easeOutBack,
                      opacity: isNight ? 1 : 0,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: animationDuration,
                            curve: Curves.easeOutBack,
                            top: 0,
                            bottom: 0,
                            right: isNight ? -switchWidth + 248 : -40,
                            child: SizedBox(
                              width: switchWidth,
                              height: 328,
                              child: Stack(
                                alignment: Alignment.center,
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
                                      onTap: isNight ? onTapSwitch : null,
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        AppAsset.moon,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroundNight() {
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 40,
          child: Image.asset(
            AppAsset.stars,
            fit: BoxFit.fill,
          ),
        ),
      ],
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
