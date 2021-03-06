import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/helpers/helpers.dart';
import 'package:weather_trakker/repositories/repositories.dart';
import 'package:weather_trakker/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final repo = WeatherRepository();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => repo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  NowcastBloc(repo: repo)..add(NowcastFetchEvent())),
          BlocProvider(create: (context) => FavoritesCubit(repo: repo)),
          BlocProvider(
              create: (context) =>
                  ForecastBloc(repo: repo)..add(ForecastGeneralEvent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather Trakker',
          theme: ThemeData(
            textTheme: GoogleFonts.oxygenTextTheme(),
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.lightBlue,
          ),
          onGenerateRoute: CustomRoute.onGenerateRoute,
          initialRoute: SplashScreen.id,
        ),
      ),
    );
  }
}
