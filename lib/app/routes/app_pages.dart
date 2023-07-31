import 'package:bizani_learning/app/modules/Dashboard/views/pageSupport/call_view.dart';
import 'package:bizani_learning/app/modules/Dashboard/views/pageSupport/chat_view.dart';
import 'package:bizani_learning/app/modules/Dashboard/views/pageSupport/incall_view.dart';
import 'package:bizani_learning/app/modules/Dashboard/views/pageSupport/support_view.dart';
import 'package:bizani_learning/app/modules/Explore/views/pageExplore/coursesDetail_view.dart';
import 'package:bizani_learning/app/modules/Explore/views/pageExplore/coursesInfo_view.dart';
import 'package:get/get.dart';

import '../modules/Certificate/bindings/certificate_binding.dart';
import '../modules/Certificate/views/certificate_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Explore/bindings/explore_binding.dart';
import '../modules/Explore/views/explore_view.dart';
import '../modules/Explore/views/pageExplore/careerDetail_view.dart';
import '../modules/Explore/views/pageExplore/careerInfo_view.dart';
import '../modules/Explore/views/pageExplore/career_view.dart';
import '../modules/Explore/views/pageExplore/courses_view.dart';
import '../modules/Learn/bindings/learn_binding.dart';
import '../modules/Learn/views/learn_view.dart';
import '../modules/choice_recomendation/bindings/choice_recomendation1_binding.dart';
import '../modules/choice_recomendation/bindings/choice_recomendation2_binding.dart';
import '../modules/choice_recomendation/bindings/choice_recomendation3_binding.dart';
import '../modules/choice_recomendation/bindings/choice_recomendation4_binding.dart';
import '../modules/choice_recomendation/bindings/choice_recomendation5_binding.dart';
import '../modules/choice_recomendation/views/choice_recomendation_view1.dart';
import '../modules/choice_recomendation/views/choice_recomendation_view2.dart';
import '../modules/choice_recomendation/views/choice_recomendation_view3.dart';
import '../modules/choice_recomendation/views/choice_recomendation_view4.dart';
import '../modules/choice_recomendation/views/choice_recomendation_view5.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/introduction/bindings/introduction_binding.dart';
import '../modules/introduction/views/introduction_view.dart';
import '../modules/introduction2/bindings/introduction2_binding.dart';
import '../modules/introduction2/views/introduction2_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/recomended/bindings/recomended_binding.dart';
import '../modules/recomended/views/recomended_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/termcondition/bindings/termcondition_binding.dart';
import '../modules/termcondition/views/termcondition_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const SPLASHSCREEN = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.INTRODUCTION,
        page: () => const IntroductionView(),
        binding: IntroductionBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.INTRODUCTION2,
        page: () => const Introduction2View(),
        binding: Introduction2Binding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.DAFTAR,
        page: () => const DaftarView(),
        binding: DaftarBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.TERMCONDITION,
        page: () => const TermconditionView(),
        binding: TermconditionBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.RECOMENDED,
        page: () => const RecomendedView(),
        binding: RecomendedBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.CHOICE_RECOMENDATION1,
      page: () => const ChoiceRecomendationView1(),
      binding: ChoiceRecomendation1Binding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHOICE_RECOMENDATION2,
      page: () => const ChoiceRecomendationView2(),
      binding: ChoiceRecomendation2Binding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHOICE_RECOMENDATION3,
      page: () => const ChoiceRecomendationView3(),
      binding: ChoiceRecomendation3Binding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHOICE_RECOMENDATION4,
      page: () => const ChoiceRecomendationView4(),
      binding: ChoiceRecomendation4Binding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHOICE_RECOMENDATION5,
      page: () => const ChoiceRecomendationView5(),
      binding: ChoiceRecomendation5Binding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECAREER,
      page: () => const CareerView(),
      binding: ExploreCareerBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECAREER_DETAIL,
      page: () => CareerDetailView(),
      binding: ExploreCareerBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECAREER_INFO,
      page: () => CreerInfoView(),
      binding: ExploreCareerBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECOURSES,
      page: () => const CoursesView(),
      binding: ExploreCoursesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECOURSES_DETAIL,
      page: () => CoursesDetailView(),
      binding: ExploreCoursesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EXPLORECOURSES_INFO,
      page: () => const CoursesInfoView(),
      binding: ExploreCoursesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LEARN,
      page: () => LearnView(),
      binding: LearnBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CERTIFICATE,
      page: () => const CertificateView(),
      binding: CertificateBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SPLASH_SCREEN,
        page: () => const SplashScreenView(),
        binding: SplashScreenBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SUPPORT,
        page: () => const SupportView(),
        binding: SupportBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SUPPORT_CALL,
        page: () => const CallView(),
        binding: SupportBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SUPPORT_INCALL,
        page: () => const InCallView(),
        binding: SupportBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: _Paths.SUPPORT_CHAT,
        page: () => const ChatView(),
        binding: SupportBinding(),
        transition: Transition.noTransition),
  ];
}
