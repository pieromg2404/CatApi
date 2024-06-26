import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:flutter_application_1/data/bloc/Cat_Bloc.dart';
import 'package:flutter_application_1/data/model/CatBreed.dart';
import 'package:flutter_application_1/data/repository/CatRepository.dart';
import 'package:flutter_application_1/data/screen/HomeDatailScreen.dart';
import 'package:flutter_application_1/data/screen/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocMaster extends StatefulWidget {
  const BlocMaster({super.key});

  @override
  State<BlocMaster> createState() => _BlocMasterState();
}

class _BlocMasterState extends State<BlocMaster> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CatBloc>(
            create: (BuildContext context) =>
                CatBloc(repository: CatRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Cat Breeds App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
          routes: {
            '/home': (context) => HomeScreen(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/homedetail') {
              final CatBreed catBreed = settings.arguments as CatBreed;
              return MaterialPageRoute(
                builder: (context) {
                  return HomeDetailScreen(catBreed: catBreed);
                },
              );
            }
            return null;
          },
        ));
  }
}
