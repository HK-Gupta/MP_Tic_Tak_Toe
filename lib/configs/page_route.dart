
 import 'package:get/get_navigation/get_navigation.dart';
import 'package:mp_tic_tac_toe/pages/lobby_page/lobby_page.dart';
import 'package:mp_tic_tac_toe/pages/room_page/room_page.dart';

var pages = [
   GetPage(name: "/room", page: () => RoomPage()),
  GetPage(name: "/lobby", page: () => LobbyPage()),
 ];