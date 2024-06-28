
 import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/pages/auth/auth_page.dart';
import 'package:mp_tic_tac_toe/pages/game_page/game_page.dart';
import 'package:mp_tic_tac_toe/pages/game_page/single_player.dart';
import 'package:mp_tic_tac_toe/pages/home_page/home_page.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page/lobby_page.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';
import 'package:mp_tic_tac_toe/pages/splash/splash_screen.dart';
import 'package:mp_tic_tac_toe/pages/update_profile/update_profile.dart';
import 'package:mp_tic_tac_toe/pages/welcome_page/welcome_page.dart';

var pages = [
  GetPage(name: "/room", page: () => RoomPage()),
  GetPage(name: "/lobby", page: () => LobbyPage()),
  GetPage(name: "/auth", page: () => AuthPage()),
  GetPage(name: "/home", page: () => HomePage()),
  GetPage(name: "/splash", page: () => SplashScreen()),
  GetPage(name: "/game", page: () => GamePage()),
  GetPage(name: "/update", page: () => UpdateProfile()),
  GetPage(name: "/welcome", page: () => WelcomePage()),
  GetPage(name: "/single_player", page: () => SinglePlayer()),

];