
 import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/pages/auth_page.dart';
import 'package:mp_tic_tac_toe/pages/multiplayer.dart';
import 'package:mp_tic_tac_toe/pages/single_player.dart';
import 'package:mp_tic_tac_toe/pages/home_page.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page.dart';
import 'package:mp_tic_tac_toe/pages/room_page.dart';
import 'package:mp_tic_tac_toe/pages/splash_screen.dart';
import 'package:mp_tic_tac_toe/pages/update_profile.dart';
import 'package:mp_tic_tac_toe/pages/welcome_page.dart';

var pages = [
  GetPage(name: "/room", page: () => RoomPage()),
  GetPage(name: "/auth", page: () => AuthPage()),
  GetPage(name: "/home", page: () => HomePage()),
  GetPage(name: "/splash", page: () => SplashScreen()),
  GetPage(name: "/update", page: () => UpdateProfile()),
  GetPage(name: "/welcome", page: () => WelcomePage()),
  GetPage(name: "/single_player", page: () => SinglePlayer()),

];