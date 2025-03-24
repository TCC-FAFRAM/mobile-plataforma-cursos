import 'package:app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/ui/base_state/app_base_state.dart';
import 'aula_controller.dart';

class AulaPage extends StatefulWidget {
  const AulaPage({super.key});

  @override
  _AulaPageState createState() => _AulaPageState();
}

class _AulaPageState extends AppBaseState<AulaPage, AulaController> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = ['otXtXbqp7fY', 'hEgWSWrurUE'];

  final List<Map<String, dynamic>> _lessons = [
    {'title': 'Introdução', 'duration': '5:30', 'watched': true},
    {
      'title': 'Configuração do Ambiente',
      'duration': '12:45',
      'watched': false
    },
    {'title': 'Primeiros Passos', 'duration': '8:15', 'watched': false},
    {'title': 'Componentes e Props', 'duration': '10:30', 'watched': false},
    {'title': 'Gerenciamento de Estado', 'duration': '15:20', 'watched': false},
    {'title': 'Primeiros Passos', 'duration': '8:15', 'watched': false},
    {'title': 'Componentes e Props', 'duration': '10:30', 'watched': false},
    {'title': 'Gerenciamento de Estado', 'duration': '15:20', 'watched': false},
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: context.appColors.primary,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {},
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: Text('Aula - Introdução',
              style: TextStyle(
                  color: context.appColors.primary,
                  fontWeight: FontWeight.bold)),
          actions: [],
          backgroundColor: context.appColors.white,
        ),
        body: Column(
          children: [
            // Vídeo com botão de voltar, com tamanho aumentado
            player,
            Padding(
                padding: EdgeInsets.all(15),
                child: Text(_videoMetaData.title,
                    style: TextStyle(
                        fontSize: 20, color: context.appColors.primary))),
            // Lista de aulas
            Expanded(
              child: ListView.separated(
                itemCount: _lessons.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final lesson = _lessons[index];
                  return ListTile(
                    leading: lesson['watched']
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.play_circle_outline,
                            color: Colors.grey),
                    title: Text(lesson['title']),
                    trailing: Text(lesson['duration']),
                    onTap: () {
                      _showSnackBar('Aula: ${lesson['title']}');
                      // Implemente a lógica para trocar o vídeo ou atualizar o estado da aula, se necessário
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
