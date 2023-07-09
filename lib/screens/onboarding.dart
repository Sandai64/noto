import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:noto/screens/home.dart';

class NotoScreenOnboarding extends StatelessWidget
{
  NotoScreenOnboarding({ super.key });

  final List<PageViewModel> _pageViewModels = [
    PageViewModel(
      titleWidget: Column(
        children: [
          const Text(
            'Welcome to Noto',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
          kDebugMode
          ? Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: Border.all(
                    color: Colors.black,
                    width: 8.0,
                  )
                ),
                child: const Text(
                  'DEVELOPMENT BUILD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amberAccent
                  ),
                ),
              )
            )
          )
          : Container()
        ]
      ),
      body: 'Our straightforward interface makes it easier than ever to navigate, manage, and read your favourite e-books.',
      image: Image.asset(
        'assets/img/branding/id.png',
        width: 128,
        height: 128,
      ),
    )
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: _pageViewModels,
          curve: Curves.easeInOut,
          onDone: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const NotoScreenHome()), (route) => false),
          done: const Text('Get started'),
          next: const Text('Next'),
        )
      )
    );
  }
}