import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_labs/utils/context.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.homeTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.tr.homeFittedBoxExamplesTitle),
            subtitle: Text(context.tr.homeFittedBoxExamplesSubtitle),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/fittedBoxExamples');
            },
          ),
          const SizedBox(height: 20),
          const BitcoinLoadingIndicator(),
        ],
      ),
    );
  }
}

class BitcoinLoadingIndicator extends StatefulWidget {
  const BitcoinLoadingIndicator({super.key});

  @override
  State<BitcoinLoadingIndicator> createState() =>
      _BitcoinLoadingIndicatorState();
}

class _BitcoinLoadingIndicatorState extends State<BitcoinLoadingIndicator>
    with TickerProviderStateMixin {
  double _animationSpeed = 1.0;
  String _selectedAnimation = 'Scale';
  final List<String> _animationOptions = [
    'Scale',
    'Opacity',
    'Slide',
    'Rotation',
    'Color',
    'Flip',
    'Bounce',
    'Fade In/Out',
    'Zoom In/Out',
    'Shake',
    'Blur',
    'Size Change',
  ];

  late AnimationController _controllerLetter;
  late AnimationController _controllerProgress;

  @override
  void initState() {
    super.initState();
    _controllerLetter = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _controllerProgress = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  void _updateAnimationSpeed(double speed) {
    setState(() {
      _animationSpeed = speed;

      // Atualiza a velocidade do AnimationController da letra.
      _controllerLetter.duration = Duration(seconds: (3 / speed).round());
      _controllerLetter.repeat();

      // Atualiza a velocidade do AnimationController do progresso.
      _controllerProgress.duration = Duration(seconds: (3 / speed).round());
      _controllerProgress.repeat();
    });
  }

  @override
  void dispose() {
    _controllerLetter.dispose();
    _controllerProgress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _animationOptions
              .map((option) => ChoiceChip(
                    label: Text(option),
                    selected: _selectedAnimation == option,
                    onSelected: (selected) {
                      setState(() {
                        _selectedAnimation = option;
                      });
                    },
                    selectedColor: Colors.orange[800],
                    labelStyle: TextStyle(
                      color: _selectedAnimation == option
                          ? Colors.white
                          : Colors.black,
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        Slider(
          value: _animationSpeed,
          onChanged: _updateAnimationSpeed,
          min: 0.1,
          max: 3.0,
          divisions: 29,
          label: 'Speed: ${_animationSpeed.toStringAsFixed(1)}x',
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: AnimatedBuilder(
                animation: _controllerProgress,
                builder: (context, child) {
                  return CircularProgressIndicator(
                    strokeWidth: 5,
                    value: _controllerProgress.value,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orange.shade800),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _controllerLetter,
              builder: (context, child) {
                switch (_selectedAnimation) {
                  case 'Scale':
                    return Transform.scale(
                      scale: _controllerLetter.value,
                      child: child,
                    );
                  case 'Opacity':
                    return Opacity(
                      opacity: _controllerLetter.value,
                      child: child,
                    );
                  case 'Slide':
                    return Transform.translate(
                      offset: Offset(100 * (1 - _controllerLetter.value), 0),
                      child: child,
                    );
                  case 'Rotation':
                    return Transform.rotate(
                      angle: _controllerLetter.value * 2 * 3.141592653589793,
                      child: child,
                    );
                  case 'Color':
                    final colorTween = TweenSequence<Color?>(
                      [
                        TweenSequenceItem(
                          tween: ColorTween(
                            begin: Colors.black,
                            end: Colors.blue,
                          ),
                          weight: 1.0,
                        ),
                        TweenSequenceItem(
                          tween: ColorTween(
                            begin: Colors.blue,
                            end: Colors.green,
                          ),
                          weight: 1.0,
                        ),
                        TweenSequenceItem(
                          tween: ColorTween(
                            begin: Colors.green,
                            end: Colors.yellow,
                          ),
                          weight: 1.0,
                        ),
                        TweenSequenceItem(
                          tween: ColorTween(
                            begin: Colors.yellow,
                            end: Colors.orange,
                          ),
                          weight: 1.0,
                        ),
                        TweenSequenceItem(
                          tween: ColorTween(
                            begin: Colors.orange,
                            end: Colors.deepOrange,
                          ),
                          weight: 1.0,
                        ),
                      ],
                    );
                    return Text(
                      '₿',
                      style: TextStyle(
                        fontSize: 80,
                        color: colorTween.evaluate(_controllerLetter),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  case 'Flip':
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(
                          _controllerLetter.value * 3.141592653589793),
                      child: child,
                    );
                  case 'Bounce':
                    return Transform.translate(
                      offset: Offset(0, -30 * (1 - _controllerLetter.value)),
                      child: child,
                    );
                  case 'Fade In/Out':
                    return Opacity(
                      opacity: (_controllerLetter.value * 2).clamp(0.0, 1.0),
                      child: child,
                    );
                  case 'Zoom In/Out':
                    return Transform.scale(
                      scale: 0.5 + _controllerLetter.value,
                      child: child,
                    );
                  case 'Shake':
                    return Transform.translate(
                      offset: Offset(
                          10 *
                              (1 - _controllerLetter.value) *
                              (0.5 - _controllerLetter.value),
                          0),
                      child: child,
                    );
                  case 'Blur':
                    return ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10 * (1 - _controllerLetter.value),
                            sigmaY: 10 * (1 - _controllerLetter.value)),
                        child: child,
                      ),
                    );
                  case 'Size Change':
                    return Transform.scale(
                      scale: 0.8 + 0.2 * _controllerLetter.value,
                      child: child,
                    );
                  default:
                    return child!;
                }
              },
              child: Text(
                '₿',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
