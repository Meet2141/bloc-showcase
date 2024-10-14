import 'package:bloc_showcase/src/constants/route_constants.dart';
import 'package:bloc_showcase/src/views/error/error_screen.dart';
import 'package:bloc_showcase/src/views/splash/splash_screen.dart';
import 'package:bloc_showcase/src/views/task/task_screen.dart';
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
        name: RouteConstants.task,
        path: '/task',
        builder: (context, state) => const TaskScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
