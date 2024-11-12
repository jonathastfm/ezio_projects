import 'package:com_ezio_osrpjas/pages/Login_Page.dart';
import 'package:com_ezio_osrpjas/pages/menu/Menu_Page.dart';
import 'package:com_ezio_osrpjas/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    Authservice auth = Provider.of<Authservice>(context);
    if (auth.isLoading) {
      return loading();
    }
    else if (auth.user == null) {
      return LoginPage();
    }
    else {
      return MenuPage();
    }
    
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}