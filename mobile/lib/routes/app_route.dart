import 'package:go_router/go_router.dart';
import 'package:mobile/routes/app_route_name.dart';
import 'package:mobile/routes/app_route_page.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRouteName.getStartRoute,
  routes: routePage
      .map((route) => GoRoute(
            path: route.route,
            builder: (context, state) => route.page,
          ))
      .toList(),
);
