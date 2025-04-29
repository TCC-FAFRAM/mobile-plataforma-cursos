import 'package:app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_routers.dart';
import '../../../entities/models/curso.model.dart';

class CardCurso extends StatefulWidget {
  final CursoModel item;
  const CardCurso({super.key, required this.item});

  @override
  State<CardCurso> createState() => _CardCursoState();
}

class _CardCursoState extends State<CardCurso> {
  @override
  Widget build(BuildContext context) {
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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                widget.item.imagem,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.item.titulo,
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
  }
}
