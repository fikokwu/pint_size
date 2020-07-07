import 'package:flutter/material.dart';
import 'package:pint_size/screens/dashboard_screen.dart';
import 'package:pint_size/screens/login_screen.dart';
import 'package:pint_size/utilities/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User> (context);
    print(user);

    if (user == null){
      return LoginScreen();

    }else{
      return DashboardScreen();
    }

    
   

    
}

}