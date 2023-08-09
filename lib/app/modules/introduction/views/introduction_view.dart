import 'package:bizani_learning/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  static const bodyStyle = TextStyle(
      fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.white);

  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyTextStyle: bodyStyle,
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: primaryColor,
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName, [double width = 350]) {
    return CircleAvatar(
      backgroundColor: warningColor,
      radius: 150,
      child: Image.asset('assets/images/introductions/$assetName.png',
          width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return IntroductionScreen(
      key: controller.introKey,
      globalBackgroundColor: primaryColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 4000,
      pages: [
        PageViewModel(
          title: "Hasilkan di Bizani",
          body:
              "Hasilkan uang dengan berbagi tautan ke kursus Bizani dengan siapa saja, kapan saja.",
          image: _buildImage('1'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Kurikulum terperbaharui",
          body:
              "Bizani menjadi yang selalu ter up to date dalam pembaharuan kurikulum setiap bidang kursus yang disediakan.",
          image: _buildImage('2'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Terus terhubung dengan para professional",
          body:
              "Anda dapat terus terhubung dengan para internasional disetiap bidang yang anda minati.",
          image: _buildImage('3'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Belajar darimana saja",
          body:
              "Anda dapat membaca tiap materi dimana saja, dan berhenti kapan saja serta melanjutkanya kapan saja.",
          image: _buildImage('1'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Sertifikasi",
          body:
              "Dapatkan sertifikasi yang sudah diakui lembaga internasional dari kami dengan mengikuti program-program kami.",
          image: _buildImage('1'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 3,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
      ],
      onDone: () => controller.onIntroEnd(context),
      //onSkip: () => controller.onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward, color: Colors.white),
      done: const Text('Lanjutkan',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
