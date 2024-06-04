import 'package:bloc_showcase/src/constants/route_constants.dart';
import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:bloc_showcase/src/views/add_update_detail/add_update_detail_screen.dart';
import 'package:bloc_showcase/src/views/error/error_screen.dart';
import 'package:bloc_showcase/src/views/home/home_screen.dart';
import 'package:bloc_showcase/src/views/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RoutingConfig {
  GoRouter routingConfig = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RouteConstants.home,
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: RouteConstants.addUpdateDetail,
        path: '/add_update_detail',
        builder: (context, state) {
          ResHomeModel model = state.extra as ResHomeModel;
          return AddUpdateDetailScreen(model: model);
        },
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
