import 'package:e_commerce_app/Get%20folder/onboardingGet.dart';
import 'package:e_commerce_app/Screen/Boarding%20Screen/onBoardingCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller:Controller.pageController,
            onPageChanged: (index) {
             Controller.updatePageIndicator(index);
            },
            children: [
              OnBordingCard(
                title: " Choose Your Product",
                msz:
                    "Welcome to a world of Limit less Choices - Your Perfect Product Awaits!",
                gif: 'assets/Gif/Animation2.json',
              ),
              OnBordingCard(
                title: " Select Payment Method",
                msz:
                    "For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!",
                gif: 'assets/Gif/Animation3.json',
              ),
              OnBordingCard(
                title: " Deliver At Your Door Step",
                msz:
                    "From Our Doorstep to Yours- Swift,Secure, and Contactless Delivery!",
                gif: 'assets/Gif/Animation1.json',
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.050,
            right: 10,
            child: TextButton(
              onPressed: () {
               Controller.skipPage();
              },
              child: Text(
                'skip',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 10,
            child: SmoothPageIndicator(
              count: 3,
              controller: Controller.pageController,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.green,
                dotHeight: 6,
              ),
            ),
          ),
          Positioned(
              right: 24,
              bottom: 25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.black),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onPressed: () {
                 Controller.nextPage(context);
                },
              ))
        ],
      ),
    );
  }
}
