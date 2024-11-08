import 'package:auto_route/auto_route.dart';
import '../Screens/welcome_screen.dart';
import '../Screens/input_screen.dart';
import '../Screens/satellite_info_screen.dart';
import '../Screens/satellite_orbit_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WelcomeRoute.page, initial: true),
    AutoRoute(page: InputRoute.page),
    AutoRoute(page: SatelliteInfoRoute.page),
    AutoRoute(page: SatelliteOrbitRoute.page),
  ];
}