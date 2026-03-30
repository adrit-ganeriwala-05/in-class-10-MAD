import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class SuccessScreen extends StatefulWidget {
  final String userName;
  final String avatar;

  const SuccessScreen({
    super.key,
    required this.userName,
    required this.avatar,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Confetti — blast for 3 seconds on arrival
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();

    // Scale-up animation for the avatar
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );
    _scaleController.forward();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E8FF),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Confetti cannon at top-center
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2, // straight down
            numberOfParticles: 40,
            gravity: 0.2,
            emissionFrequency: 0.05,
            colors: const [
              Color(0xFF6B21A8),
              Color(0xFF9333EA),
              Color(0xFFC084FC),
              Colors.pink,
              Colors.yellow,
              Colors.teal,
            ],
          ),

          // Main content
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated avatar
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Text(
                        widget.avatar,
                        style: const TextStyle(fontSize: 90),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Personalized welcome message
                    Text(
                      'Welcome,',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple.shade400,
                      ),
                    ),
                    Text(
                      '${widget.userName}! 🎉',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B21A8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Your account has been successfully created.\nYour adventure begins now!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 48),

                    // Replay confetti button
                    OutlinedButton.icon(
                      onPressed: () => _confettiController.play(),
                      icon: const Text('🎊', style: TextStyle(fontSize: 18)),
                      label: const Text('Celebrate Again!'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6B21A8),
                        side: const BorderSide(color: Color(0xFF6B21A8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Go back to welcome
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Pop all routes back to WelcomeScreen
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6B21A8),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Back to Home',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}