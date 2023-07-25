import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatland Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Player player;
  late List<Shape> shapes;

  @override
  void initState() {
    super.initState();
    player = Player(Offset(0, 0));
    shapes = [
      Shape(Offset(150, 150), Colors.red),
      Shape(Offset(300, 150), Colors.blue),
      Shape(Offset(450, 150), Colors.green),
      Shape(Offset(150, 300), Colors.yellow),
      Shape(Offset(300, 300), Colors.orange),
      Shape(Offset(450, 300), Colors.purple),
      Shape(Offset(150, 450), Colors.teal),
      Shape(Offset(300, 450), Colors.pink),
      Shape(Offset(450, 450), Colors.cyan),
    ];

    // Set up key event listener
    RawKeyboard.instance.addListener(_handleKeyEvent);
  }

  @override
  void dispose() {
    // Remove key event listener
    RawKeyboard.instance.removeListener(_handleKeyEvent);
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final key = event.logicalKey;
      if (key == LogicalKeyboardKey.keyW) {
        setState(() {
          player.moveUp();
          _checkCollisions();
        });
      } else if (key == LogicalKeyboardKey.keyA) {
        setState(() {
          player.moveLeft();
          _checkCollisions();
        });
      } else if (key == LogicalKeyboardKey.keyS) {
        setState(() {
          player.moveDown();
          _checkCollisions();
        });
      } else if (key == LogicalKeyboardKey.keyD) {
        setState(() {
          player.moveRight();
          _checkCollisions();
        });
      }
    }
  }

  void _checkCollisions() {
    for (final shape in shapes) {
      if (shape.checkCollision(player.position)) {
        shape.onCollision();
      } else {
        shape.onNoCollision();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flatland Game'),
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: CustomPaint(
              painter: GamePainter(player, shapes),
              size: MediaQuery.of(context).size,
            ),
          );
        },
      ),
    );
  }
}

class GamePainter extends CustomPainter {
  final Player player;
  final List<Shape> shapes;

  GamePainter(this.player, this.shapes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final shape in shapes) {
      shape.draw(canvas);
    }
    player.draw(canvas);
  }

  @override
  bool shouldRepaint(GamePainter oldDelegate) => true;
}

abstract class GameObject {
  void draw(Canvas canvas);
}

class Player extends GameObject {
  static const double size = 50.0;
  static const double speed = 10.0;

  Offset position;

  Player(this.position);

  void moveUp() {
    position = Offset(position.dx, position.dy - speed);
  }

  void moveDown() {
    position = Offset(position.dx, position.dy + speed);
  }

  void moveLeft() {
    position = Offset(position.dx - speed, position.dy);
  }

  void moveRight() {
    position = Offset(position.dx + speed, position.dy);
  }

  @override
  void draw(Canvas canvas) {
    final paint = Paint()..color = Colors.green;
    final path = Path();
    path.moveTo(position.dx, position.dy - size / 2);
    path.lineTo(position.dx - size / 2, position.dy + size / 2);
    path.lineTo(position.dx + size / 2, position.dy + size / 2);
    path.close();
    canvas.drawPath(path, paint);
  }
}

class Shape extends GameObject {
  static const double size = 100.0;

  Offset position;
  Color color;

  Shape(this.position, this.color);

  bool checkCollision(Offset playerPosition) {
    final playerRect = Rect.fromCenter(
        center: playerPosition, width: Player.size, height: Player.size);
    final shapeRect =
        Rect.fromCenter(center: position, width: size, height: size);
    return playerRect.overlaps(shapeRect);
  }

  void onCollision() {
    color = const Color.fromARGB(255, 134, 55, 49);
  }

  void onNoCollision() {
    color = Colors.green;
  }

  @override
  void draw(Canvas canvas) {
    final paint = Paint()..color = color;
    final rect = Rect.fromCenter(center: position, width: size, height: size);
    canvas.drawRect(rect, paint);
  }
}
