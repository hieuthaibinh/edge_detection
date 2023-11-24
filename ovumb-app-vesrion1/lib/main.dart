import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ovumb_app_version1/data/local_data/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/blog/blog_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/cart/cart_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/choan/choan_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/main/main_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/milk/milk_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/store/store_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/test/test_bloc.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/logo_screen.dart';
import 'package:flutter_ovumb_app_version1/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  //await Firebase.initializeApp();
  await SharedPreferencesService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (BuildContext context) => MainBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider<TestBloc>(
          create: (BuildContext context) => TestBloc(),
        ),
        BlocProvider<MilkBloc>(
          create: (BuildContext context) => MilkBloc(),
        ),
        BlocProvider<ChoAnBloc>(
          create: (BuildContext context) => ChoAnBloc(),
        ),
        BlocProvider<BlogBloc>(
          create: (BuildContext context) => BlogBloc(),
        ),
        BlocProvider<StoreBloc>(
          create: (BuildContext context) => StoreBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: MyApp(),
      // child: DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(), // Wrap your app
      // ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('vi', ''),
      ],
      title: 'OvumB',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorSchemeSeed: Colors.transparent,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: LogoScreen(),
    );
  }
}
