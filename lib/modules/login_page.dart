import 'package:fbaseapp/modules/login_controller.dart';
import 'package:fbaseapp/shared/components/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height * 0.4,
                child: Image.asset("assets/images/angular.png"),
              ),
              Container(
                height: size.height * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(
                      builder: (_) => TextFormFieldWidget(
                        hint: 'Usuário',
                        onChanged: (String value) {
                          controller.email = value;
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Observer(
                      builder: (_) => TextFormFieldWidget(
                        hint: 'Senha',
                        isPassword: true,
                        onChanged: (String value) {
                          controller.password = value;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Observer(
                      builder: (_) => ElevatedButton(
                        onPressed:
                            controller.email == "" || controller.password == ""
                                ? null
                                : () {
                                    controller.signin(context);
                                  },
                        style: ButtonStyle(
                          backgroundColor: controller.email == "" ||
                                  controller.password == ""
                              ? MaterialStateProperty.all<Color>(
                                  Colors.grey[300]!,
                                )
                              : MaterialStateProperty.all<Color>(
                                  Color(0xFFC27810),
                                ),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(size.width, 45),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: controller.isBusy
                            ? Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(height: 40)
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFFEB7F1A),
                Color(0xFF663405),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
