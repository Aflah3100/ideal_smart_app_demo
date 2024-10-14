import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ideal_smart_app_demo/utils/app_colors.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class ImageBannersSlider extends StatefulWidget {
  const ImageBannersSlider({super.key});

  @override
  State<ImageBannersSlider> createState() => _ImageBannersSliderState();
}

class _ImageBannersSliderState extends State<ImageBannersSlider> {
  List<Widget> getImageBanners(BuildContext context) {
    final List<Widget> imageBanners = [
      Image(
        width: MediaQuery.sizeOf(context).width * 0.8,
        image: const AssetImage(Assets.idealMartBanner1),
        fit: BoxFit.fill,
      ),
      Image(
        width: MediaQuery.sizeOf(context).width * 0.8,
        image: const AssetImage(Assets.idealMartBanner2),
        fit: BoxFit.fill,
      ),
      Image(
        width: MediaQuery.sizeOf(context).width * 0.8,
        image: const AssetImage(Assets.idealMartBanner3),
        fit: BoxFit.fill,
      ),
      Image(
        width: MediaQuery.sizeOf(context).width * 0.8,
        image: const AssetImage(Assets.idealMartBanner4),
        fit: BoxFit.fill,
      ),
    ];

    return imageBanners;
  }

  int bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: getImageBanners(context)
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: e,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2,
              aspectRatio: 16 / 9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  bannerIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
              height: 10,
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  getImageBanners(context).length,
                  (index) {
                    return Row(
                      children: [
                        AnimatedContainer(
                          width: (bannerIndex == index) ? 30 : 10,
                          height: 8,
                          curve: Curves.easeIn,
                          decoration: BoxDecoration(
                              color: (bannerIndex == index)
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          duration: const Duration(milliseconds: 500),
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ],
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
