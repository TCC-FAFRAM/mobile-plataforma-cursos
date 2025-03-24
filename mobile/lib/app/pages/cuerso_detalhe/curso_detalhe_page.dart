import 'package:app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/ui/base_state/app_base_state.dart';

import '../../core/utils/app_routers.dart';
import 'curso_detalhe_controller.dart';

class CursoDetalhePage extends StatefulWidget {
  const CursoDetalhePage({super.key});

  @override
  _CursoDetalhePageState createState() => _CursoDetalhePageState();
}

class _CursoDetalhePageState
    extends AppBaseState<CursoDetalhePage, CursoDetalheController> {
  DateTime selectedDate = DateTime.now();
  late List<DateTime> daysInMonth;

  final List<Map<String, String>> lessons = [
    {
      'title': 'Equilíbrio Nutricional',
      'duration': '01:39:04',
      'youtube': 'otXtXbqp7fY'
    },
    {
      'title': 'Detalhes que Fazem a Diferença',
      'duration': '01:39:04',
      'youtube': 'otXtXbqp7fY'
    },
    {
      'title': 'Adubação com boro e sessão de Perguntas',
      'duration': '01:39:04',
      'youtube': 'otXtXbqp7fY'
    },
    {
      'title': 'Imersão em Fertilidade dos Solos',
      'duration': '01:39:04',
      'youtube': 'otXtXbqp7fY'
    },
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Image.network(
                  'https://downloadcursos.top/wp-content/uploads/2023/10/fertilidades-do-solo.png.webp',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                const Text(
                  'Fertilidade dos Solos e manejo de adubação',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Luiz',
                  style: TextStyle(color: Colors.grey),
                ),

                const Text(
                  'Técnicos, agrônomos, estudantes e pessoas ligadas ao meio rural, como: produtores e familiares, trabalhadores e profissionais do setor rural, parceiros e prestadores de serviço que tenham interesse em adotar  as melhores práticas agrícolas.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54),
                ),

                const Text(
                  'Aulas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 350,
                  child: SingleChildScrollView(
                      // Adicionado para permitir rolagem da tela
                      child: ListView.builder(
                    shrinkWrap:
                        true, // Garante que o ListView não ocupe espaço infinito
                    physics:
                        const NeverScrollableScrollPhysics(), // Desativa a rolagem do ListView para evitar conflitos
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      final lesson = lessons[index];
                      return Opacity(
                        opacity: lesson['title'] == 'Prototypingt' ? 0.5 : 1.0,
                        child: _lessonTile(
                            context, lesson['title']!, lesson['duration']!),
                      );
                    },
                  )),
                ),
                // Espaço extra antes do botão
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 380,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.curso);
          },
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Iniciar',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _lessonTile(BuildContext context, String title, String duration) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, AppRouters.curso);
    },
    child: Container(
      margin:
          const EdgeInsets.symmetric(vertical: 5), // Espaçamento entre os itens
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // Borda arredondada
        border: Border.all(color: Colors.grey[300]!), // Cor da borda
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2), // Sombra leve abaixo
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              12), // Garante borda arredondada no ListTile
        ),
        leading: const Icon(Icons.play_circle_fill, color: Colors.green),
        title: Text(title),
        trailing: Text(duration, style: TextStyle(color: Colors.grey[600])),
      ),
    ),
  );
}
