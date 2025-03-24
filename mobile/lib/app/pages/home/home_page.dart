import 'package:app/app/core/ui/styles/app_colors.dart';
import 'package:app/app/core/utils/app_routers.dart';
import 'package:app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/app_base_state.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends AppBaseState<HomePage, HomeController> {
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
    await controller.initApp();
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
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouters.cursoDetalhe);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                child: Image.network(
                                  item['image']!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  item['description']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: context.appColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
