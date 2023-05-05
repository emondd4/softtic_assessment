import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:softtic_assessment/constant/routeConstant.dart';
import 'package:softtic_assessment/screens/AddProductScreen.dart';
import 'package:softtic_assessment/screens/homeScreen.dart';
import 'package:softtic_assessment/screens/loginScreen.dart';

import '../screens/binding/addProductBinding.dart';
import '../screens/binding/homeBinding.dart';
import '../screens/binding/loginBinding.dart';
import '../screens/binding/profileBinding.dart';
import '../screens/profileScreen.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeScreen,
      page: () => const HomePage(),
      binding: HomeScreenBinding()),
  GetPage(
      name: RouteConstant.homeScreen,
      page: () => const LoginPage(),
      binding: LoginScreenBinding()),
  GetPage(
      name: RouteConstant.profileScreen,
      page: () => const ProfilePage(),
      binding: ProfileScreenBinding()),
  GetPage(
      name: RouteConstant.addProductScreen,
      page: () => const AddProductPage(),
      binding: AddProductBinding()),
];
