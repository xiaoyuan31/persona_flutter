import 'package:flutter/material.dart';
import '../components/stat_bar.dart';
import '../models/persona.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonaDetailScreen extends StatelessWidget {
  final Persona persona;
  const PersonaDetailScreen({super.key, required this.persona});

  // Helper for affinities
  Widget affinityRow(String title, List<String> values, Color color) {
    if (values.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          children: values
              .map((e) => Chip(
            label: Text(e),
            backgroundColor: color.withOpacity(0.2),
            labelStyle: TextStyle(color: color, fontSize: 12),
            visualDensity: VisualDensity.compact,
          ))
              .toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(persona.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image with Red-Black Gradient
            Stack(
              children: [
                Hero(
                  tag: 'persona_${persona.id}',
                  child: Image.network(
                    persona.image,
                    width: double.infinity,
                    height: 260,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 260,
                        color: Colors.grey.shade900,
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.white, size: 40),
                        ),
                      );
                    },
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.red.shade900.withOpacity(0.4),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    persona.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      persona.arcana,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Level
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Level ${persona.level}',
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            // Stats Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Stats",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  StatBar(label: "Strength", value: persona.strength),
                  StatBar(label: "Magic", value: persona.magic),
                  StatBar(label: "Endurance", value: persona.endurance),
                  StatBar(label: "Agility", value: persona.agility),
                  StatBar(label: "Luck", value: persona.luck),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Affinities Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Affinities",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  affinityRow("Weak", persona.weak, Colors.blue.shade400),
                  affinityRow("Resists", persona.resists, Colors.green.shade400),
                  affinityRow("Reflects", persona.reflects, Colors.orange.shade400),
                  affinityRow("Absorbs", persona.absorbs, Colors.purple.shade400),
                  affinityRow("Nullifies", persona.nullifies, Colors.grey.shade400),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    persona.description,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // View Full Image Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse(persona.image);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Cannot open image")),
                    );
                  }
                },
                icon: const Icon(Icons.open_in_new),
                label: const Text("View Full Image"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}