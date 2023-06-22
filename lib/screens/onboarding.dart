import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:noto/screens/home.dart';

class NotoScreenOnboarding extends StatelessWidget
{
  NotoScreenOnboarding({ super.key });

  final List<PageViewModel> _pageViewModels = [
    PageViewModel(
      title: '',
      body: 'Our straightforward interface makes it easier than ever to navigate, manage, and of course, read your favourite e-books.',
      image: Image.asset(
        'assets/img/branding/id.png',
        width: 256,
        height: 256,
        cacheHeight: 256,
        cacheWidth: 256,
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