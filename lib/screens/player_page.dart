import 'package:flutter/material.dart';

// Assuming we may want to pass specific episode data later, but for now
// we will hardcode a nice example.

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double _currentSliderValue = 0.3;
  bool _isPlaying = false;

  // Format duration into mm:ss
  String _formatDuration(double value) {
    final int totalSeconds = (value * 3000)
        .toInt(); // Assuming 3000s total duration
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 32),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Minimize Player',
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
            tooltip: 'More Options',
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/podcast_cover.png', fit: BoxFit.cover),

          // Gradient Overlay (Scrim)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.primary.withValues(alpha: 0.3),
                  colorScheme.primary.withValues(alpha: 0.0),
                  colorScheme.primary.withValues(alpha: 0.6),
                  colorScheme.primary.withValues(alpha: 0.95),
                ],
                stops: const [0.0, 0.4, 0.7, 1.0],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Push content to the bottom
                  const Spacer(),

                  // Title & Artist
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THE CREATIVE MIND',
                              style: textTheme.displaySmall?.copyWith(
                                height: 1.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Design Matters',
                              style: textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border_rounded),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Progress Bar
                  Slider(
                    value: _currentSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),

                  // Time Labels
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(_currentSliderValue),
                          style: textTheme.bodySmall,
                        ),
                        Text(
                          _formatDuration(1.0), // Total duration
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Main Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shuffle_rounded),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous_rounded, size: 36),
                        onPressed: () {},
                      ),

                      // Play/Pause Button
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: colorScheme.surface, // Use theme surface color
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            _isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 40,
                            color: colorScheme.onSurface, // Icon matches text
                          ),
                          onPressed: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                            });
                          },
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.skip_next_rounded, size: 36),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.repeat_rounded),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 48), // Bottom safe area breathing room
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
