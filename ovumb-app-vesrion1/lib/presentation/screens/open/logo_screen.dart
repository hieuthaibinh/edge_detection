import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ovumb_app_version1/data/enum/age_enum.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_bloc.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_event.dart';
import 'package:flutter_ovumb_app_version1/logic/bloc/login/auth_state.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/choose_home_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/home/main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/loading/loading_logo.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/open/welcome_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase2/phase2_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/phase3/home3.dart';
import 'package:flutter_ovumb_app_version1/presentation/screens/question/question_main_screen.dart';
import 'package:flutter_ovumb_app_version1/presentation/utils/palette.dart';
import 'package:flutter_ovumb_app_version1/presentation/widgets/dialog/error_dialog.dart';

class LogoScreen extends StatefulWidget {
  static const routeName = 'logo-screen';
  const LogoScreen({
    super.key,
  });

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  bool checkFirst = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!checkFirst) {
      context.read<AuthBloc>().add(AuthEventCheckLogin());
      checkFirst = true;
    }
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateLoading && state.isLoading == true) {
          LoadingLogo().show(context: context);
        } else {
          LoadingLogo().hide();
        }
        if (state is AuthStateLoginFailure) {
          showErrorDialog(context, state.error!);
        } else if (state is AuthStateRegisterFailure) {
          showErrorDialog(context, state.error);
        } else if (state is AuthStateResetPaswordFailure) {
          showErrorDialog(context, state.error);
        } else if (state is AuthStateLogout) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushNamed(context, WelcomeScreen.routeName);
          });
        } else if (state is AuthStateLogged) {
          if (state.phase == 1 || state.phase == 2 || state.phase == 5) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainScreen.routeName,
              (route) => false,
              arguments: {
                'nguoiDung': state.nguoiDung,
                'tbnkn': null,
              },
            );
          } else if (state.phase == 3) {
            print(state.phase);
            Navigator.pushReplacementNamed(
              context,
              Phase2Screen.routeName,
              arguments: {
                'nguoiDung': state.nguoiDung,
                'phase': state.phase,
              },
            );
          } else if (state.phase == 4) {
            Navigator.pushReplacementNamed(
              context,
              Home3.routeName,
            );
          }
        } else if (state is AuthStateLoggedNotInfor) {
          if (state.phase != null) {
            Navigator.pushNamed(
              context,
              QuestionMainScreen.routeName,
              arguments: state.phase,
            );
          } else {
            if (state.ageEnum == AgeEnum.teenage) {
              Navigator.pushNamed(
                context,
                QuestionMainScreen.routeName,
                arguments: 5,
              );
            } else {
              Navigator.pushNamed(
                context,
                ChooseHomeScreen.routeName,
              );
            }
          }
        }
      },
      builder: (context, state) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
          child: Container(
            decoration: BoxDecoration(
              gradient: Palette.background,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/icons/logo_icon.png',
                    scale: 3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
