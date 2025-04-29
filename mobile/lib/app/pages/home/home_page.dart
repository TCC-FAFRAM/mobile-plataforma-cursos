import 'dart:async';

import 'package:app/app/core/ui/helpers/app_size_extensions.dart';
import 'package:app/app/core/ui/styles/app_colors.dart';
import 'package:app/app/core/utils/app_routers.dart';
import 'package:app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/app_base_state.dart';
import 'home_state.dart';
import 'widgets/card_curso.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AppBaseState<HomePage, HomeController> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> items = [
    {
      'image':
          'https://downloadcursos.top/wp-content/uploads/2023/10/fertilidades-do-solo.png.webp',
      'description': 'AgricOnline Academy'
    },
  ];

  @override
  void onReady() async {
    super.onReady();
    controller.initApp();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {}
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent, // Define como transparente
          elevation: 0, // Remove a sombra
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.logout();
                Navigator.popAndPushNamed(context, AppRouters.splash);
              },
              icon: Icon(Icons.exit_to_app,
                  color: context.appColors
                      .primary // Mantém o ícone branco para visibilidade
                  ),
            ),
          ],
          title: BlocBuilder<HomeController, HomeState>(
            builder: (context, state) {
              return Text(
                state.name ?? '',
                style: TextStyle(
                  color: context.appColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ); // Suponha que o estado tenha um atributo userName
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 251, 252, 252),
                Color.fromARGB(255, 192, 211, 208),
                Color(0XFF8EC0B6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Pesquisar',
                    labelStyle: TextStyle(color: Colors.grey[700]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) async {
                    controller.pesquisar = value;
                    Timer(const Duration(seconds: 2), () async {
                      await controller.getCursos(true);
                    });
                  },
                ),
                BlocConsumer<HomeController, HomeState>(
                  listener: (context, state) {
                    state.status.matchAny(
                      any: () {
                        hideLoader();
                      },
                      loading: () {
                        showLoader(null);
                      },
                      error: () {
                        hideLoader();
                        showError(state.message ?? 'Erro não informado');
                      },
                    );
                  },
                  buildWhen: (previous, current) => current.status.matchAny(
                    any: () => false,
                    initial: () => true,
                    loaded: () => true,
                  ),
                  builder: (context, state) {
                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        controller: _scrollController,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return CardCurso(
                            item: state.items[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
