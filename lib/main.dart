import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                appBarTheme: const AppBarTheme(
                    backwardsCompatibility: true,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.black)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20,
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: const Color(0xFF333739),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                appBarTheme: const AppBarTheme(
                    backwardsCompatibility: true,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Color(0xFF333739),
                        statusBarIconBrightness: Brightness.light),
                    backgroundColor: Color(0xFF333739),
                    elevation: 0,
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.white)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20,
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: Color(0xFF333739),
                    unselectedItemColor: Colors.grey
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
