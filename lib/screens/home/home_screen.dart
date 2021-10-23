import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_trakker/bloc/blocs.dart';
import 'package:weather_trakker/cubit/cubit.dart';
import 'package:weather_trakker/screens/home/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home';
  static Route route() => MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: HomeScreen.id));
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<FavoritesCubit>().fetch();
      context.read<ForecastBloc>().add(ForecastGeneralEvent());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: const SpeedDialWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.withOpacity(0.8),
                    Colors.blue.withOpacity(0.6),
                    Colors.blue.withOpacity(0.5),
                    Colors.blue.withOpacity(0.4),
                    Colors.blue.withOpacity(0.2),
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 240,
                        child: NowCastWidget(title: '2-hour Nowcast'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 10, bottom: 10),
                        child: Divider(height: 0.5, color: Colors.blueAccent),
                      ),
                      const SizedBox(
                        height: 310,
                        width: double.infinity,
                        child: TodaycastList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
