import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBordingCard extends StatelessWidget {
  String title;
  String msz;
  String gif;
  OnBordingCard({super.key,required this.title,required this.msz,required this.gif});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Lottie.asset(
                      gif,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.6,
                      repeat: true, // set true if you want the animation to repeat
                      reverse: false, // set true if you want the animation to play in reverse
                    ),
                  
                    Text(
                   title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      msz,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87
              
                      ),
                    )
                  ],
                ),
              );
  }
}
