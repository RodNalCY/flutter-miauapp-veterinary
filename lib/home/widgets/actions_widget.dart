import 'package:flutter/material.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({super.key});

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Column(
            children: [
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              Text(
                "Notificación",
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.white,
              ),
              Text(
                "Compartir",
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Column(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Text(
                "Buscar",
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
