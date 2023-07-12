import 'package:flutter/material.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/presentation/auth/widgets/widgets.dart';
import 'package:task/presentation/profile/profile_screen.dart';
import 'package:task/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameCntr = TextEditingController();
  TextEditingController pswCntr = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  ValueNotifier<bool> isHide = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: fkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(100),
                const Text(
                  "Welcome To",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "WhatsAppShop",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 84, 167, 86),
                      fontWeight: FontWeight.bold),
                ),
                spaceHeight(70),
                AuthWidget().field(
                    cntr: nameCntr,
                    txt: "Enter Email/ Mobile Number",
                    ic: null),
                spaceHeight(10),
                AuthWidget()
                    .field(cntr: pswCntr, txt: "Enter Password", ic: null),
                spaceHeight(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoadError) {
                          errorToast(context, error: state.error);
                        }

                        if (state is AuthLoaded) {
                          errorToast(context,
                              error:
                                  "welcome back ${state.credentials.userName}");
                          navigatorKey.currentState!.push(MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(credentials: state.credentials),
                          ));
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return AuthWidget().verifyButton(context);
                        }

                        return AuthWidget().loginButton(context,
                            onPressed: () async {
                          if (fkey.currentState!.validate()) {
                            context.read<AuthCubit>().signIn(
                                name: nameCntr.text.trim(),
                                password: pswCntr.text.toString());
                          }
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Forgot Password"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have an Account?",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.green),
                      child: const Text("REGISTER"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
