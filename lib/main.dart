import 'package:flutter/material.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/presentation/auth/login_screen.dart';
import 'package:task/presentation/spalsh/splash_screen.dart';
import 'package:task/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// bloc observe state change
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthREpository(),
        ),
        RepositoryProvider(
          create: (context) => ApiRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthCubit(authREpository: context.read<AuthREpository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Shop ',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            primaryColor: Colors.black,
            useMaterial3: true,
          ),
          home: const SPlashScreen(),
        ),
      ),
    );
  }
}
