import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/app_base_state.dart';
import '../../core/utils/app_routers.dart';

import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppBaseState<LoginPage, LoginController> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    //controller.login(_emailController.text, _passwordController.text);
    Navigator.popAndPushNamed(context, AppRouters.home);
  }

  @override
  void onReady() async {
    await controller.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginController, LoginState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(null),
              loaded: () => hideLoader(),
              sucess: () {
                hideLoader();
                showSuccess(state.message ?? 'Sucesso não informado');
              },
              warning: () {
                hideLoader();
                showInfo(state.message ?? 'Aviso não informado');
              },
              error: () {
                hideLoader();
                showError(state.message ?? 'Erro não informado');
              },
              typeUser: () {
                if (state.user == 'ADMIN') {
                  showSuccess('Bem vindo/a }');
                  Navigator.popAndPushNamed(context, AppRouters.home);
                } else {
                  showSuccess('Bem vindo/a ');
                  Navigator.popAndPushNamed(context, AppRouters.home);
                }
              });
        },
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Imagem de fundo borrada
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                      sigmaX: 10, sigmaY: 15), // Grau de desfoque
                  child: Image.asset(
                    'assets/images/black.jpeg', // Caminho da imagem
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Conteúdo sobreposto
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        height: 150,
                        width: 150,
                      ),
                      Text(
                        'Bem-vindo de volta!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Faça login para continuar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      _buildTextField(_emailController, 'E-mail', Icons.email),
                      _buildTextField(_passwordController, 'Senha', Icons.lock,
                          obscureText: true),
                      _buildLoginButton(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouters.register);
                        },
                        child: Text(
                          'Não tem uma conta? Cadastre-se',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          'Entrar',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
