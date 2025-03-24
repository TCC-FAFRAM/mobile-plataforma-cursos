import 'dart:ui';

import 'package:app/app/pages/create/create_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/app_base_state.dart';
import '../../core/utils/app_routers.dart';

import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends AppBaseState<CreatePage, CreateController> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();

  void _register() {
    if (_formKey.currentState!.validate()) {
      controller.create(_emailController.text, _passwordController.text,
          _firstNameController.text, _lastNameController.text);
    }
  }

  @override
  void onReady() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateController, CreateState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(null),
              loaded: () => hideLoader(),
              sucess: () {
                hideLoader();
                showSuccess(state.message ?? 'Cadastro realizado com sucesso!');
                Navigator.pop(context);
              },
              warning: () {
                hideLoader();
                showInfo(state.message ?? 'Aviso não informado');
              },
              error: () {
                hideLoader();
                showError(state.message ?? 'Erro no cadastro');
              });
        },
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Imagem de fundo borrada
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                  child: Image.asset(
                    'assets/images/black.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Logo.png',
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Criar Conta',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(_firstNameController, 'Primeiro Nome',
                              Icons.person),
                          const SizedBox(height: 10),
                          _buildTextField(
                              _lastNameController, 'Sobrenome', Icons.person),
                          const SizedBox(height: 10),
                          _buildTextField(
                              _emailController, 'E-mail', Icons.email,
                              email: true),
                          const SizedBox(height: 10),
                          _buildPasswordField(
                              _passwordController, 'Senha', true),
                          const SizedBox(height: 10),
                          _buildPasswordField(_confirmPasswordController,
                              'Confirmar Senha', false),
                          const SizedBox(height: 20),
                          _buildRegisterButton(),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Já possui uma conta? Faça login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
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
      {bool email = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        if (email && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'E-mail inválido';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller, String label, bool isPasswordField) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordField ? _obscurePassword : _obscureConfirmPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.lock, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordField
                ? (_obscurePassword ? Icons.visibility_off : Icons.visibility)
                : (_obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility),
            color: Colors.white70,
          ),
          onPressed: () {
            setState(() {
              if (isPasswordField) {
                _obscurePassword = !_obscurePassword;
              } else {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              }
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Digite uma senha';
        }
        if (isPasswordField && value.length < 6) {
          return 'A senha deve ter pelo menos 6 caracteres';
        }
        if (!isPasswordField && value != _passwordController.text) {
          return 'As senhas não coincidem';
        }
        return null;
      },
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _register,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          'Criar Conta',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
