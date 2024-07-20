import 'package:change_theme/utilities/const/assets.dart';
import 'package:change_theme/utilities/const/color.dart';
import 'package:flutter/material.dart';

class NightWidget extends StatefulWidget {
  const NightWidget({super.key});

  @override
  State<NightWidget> createState() => _NightWidgetState();
}

class _NightWidgetState extends State<NightWidget> {
  double switchWidth = 369.0;
  double switchHeight = 145.0;

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
                decoration: const BoxDecoration(
                  color: AppColor.black,
                ),
                child: Stack(
                  children: [
                    backgroundNight(),
                    Stack(
                      children: [
                        SizedBox(
                          width: switchWidth,
                          height: 328,
                          child: Stack(
                            alignment: Alignment.centerRight,
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
                                  onTap: () {},
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
}
