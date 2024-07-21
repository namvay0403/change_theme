import 'package:change_theme/utilities/const/assets.dart';
import 'package:change_theme/utilities/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SunWidget extends StatefulWidget {
  const SunWidget({super.key});

  @override
  State<SunWidget> createState() => _SunWidgetState();
}

class _SunWidgetState extends State<SunWidget> {
  double switchWidth = 369.0; // Width of the switch
  double switchHeight = 145.0; // Height of the switch

  Duration animationDuration =
      const Duration(milliseconds: 2000); // Duration of the animation
  Duration animationBackground = const Duration(
      milliseconds: 1500); // Duration of the background animation

  var isNight = false; // Check if it is night or not

  void onTapSwitch() {
    setState(() {
      isNight = !isNight;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    /**
                     * Background Sun
                     */
                    AnimatedPositioned(
                      duration: animationBackground,
                      curve: Curves.easeOutBack,
                      top: isNight ? switchHeight : 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: backgroundSun(),
                    ),
                    /**
                     * Sun
                     * Hiệu ứng chuyển cảnh cho Sun
                     */
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
                            /**
                             * Hiệu ứng làm mờ khi chuyển cảnh từ Sun sang Moon
                             */
                            AnimatedOpacity(
                              duration: animationDuration,
                              curve: Curves.easeOutBack,
                              opacity: isNight ? 0 : 1,
                              child: Stack(
                                children: [
                                  /**
                                   * Các vòng tròn bao quanh Sun
                                   */
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
                            /**
                             * Sun icon
                             */
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
                    /**
                     * Background Night
                     * Hiệu ứng chuyển cảnh cho Background
                     */
                    AnimatedPositioned(
                      duration: animationBackground,
                      curve: Curves.easeOutBack,
                      top: isNight ? 0 : -switchHeight,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: backgroundNight(),
                    ),
                    /**
                     * Moon
                     * Hiệu ứng chuyển cảnh cho Moon
                     */
                    AnimatedPositioned(
                      duration: animationDuration,
                      curve: Curves.easeOutBack,
                      top: 0,
                      bottom: 0,
                      right: !isNight ? 40 : 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        opacity: isNight ? 1 : 0,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: switchWidth,
                              height: 328,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  /**
                                   * Các vòng tròn quanh Moon
                                   */
                                  isNight
                                      ? Positioned(
                                          top: -92,
                                          bottom: -92,
                                          child: Container(
                                            height: 240,
                                            width: 240,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.white
                                                  .withOpacity(0.1),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  isNight
                                      ? Positioned(
                                          top: -57,
                                          bottom: -57,
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.white
                                                  .withOpacity(0.1),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  isNight
                                      ? Positioned(
                                          top: -20,
                                          bottom: -20,
                                          child: Container(
                                            height: 160,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.white
                                                  .withOpacity(0.1),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  /**
                                   * Moon icon
                                   */
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
                          ],
                        ),
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

  // Background Sun
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

  // Background Moon
  Widget backgroundSun() {
    return Stack(
      children: [
        Positioned.fill(
          top: 2,
          right: 6,
          child: Image.asset(
            AppAsset.cloud_backs,
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: SizedBox(
            height: switchHeight,
            width: switchWidth,
            child: Image.asset(AppAsset.cloud, fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
