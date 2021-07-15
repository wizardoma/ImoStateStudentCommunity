import 'package:app/presentation/auth/auth_screen.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/widgets/post_view_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> appRoutes = {
  HomeScreen.routeName: (_) => HomeScreen(),
  AuthScreen.routeName: (_) => AuthScreen(),
  PostViewScreen.routeName: (_) => PostViewScreen()
};
