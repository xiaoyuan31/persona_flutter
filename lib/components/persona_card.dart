import 'package:flutter/material.dart';
import '../models/persona.dart';
import 'stat_bar.dart';

class PersonaCard extends StatelessWidget {
  final Persona persona;
  final VoidCallback? onTap;

  const PersonaCard({super.key, required this.persona, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF1A1A1A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE60012), width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name + Arcana
            Row(
              children: [
                Expanded(
                  child: Text(
                    persona.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE60012),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    persona.arcana,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Lv ${persona.level}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('STR:${persona.strength}', style: const TextStyle(color: Colors.white)),
                Text('MAG:${persona.magic}', style: const TextStyle(color: Colors.white)),
                Text('END:${persona.endurance}', style: const TextStyle(color: Colors.white)),
                Text('AGI:${persona.agility}', style: const TextStyle(color: Colors.white)),
                Text('LCK:${persona.luck}', style: const TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 6),
            // Affinities
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                if (persona.weak.isNotEmpty)
                  Chip(
                    label: Text('Weak: ${persona.weak.join(", ")}'),
                    backgroundColor: Colors.blue.shade700.withOpacity(0.2),
                    labelStyle: const TextStyle(color: Colors.blue),
                  ),
                if (persona.resists.isNotEmpty)
                  Chip(
                    label: Text('Resists: ${persona.resists.join(", ")}'),
                    backgroundColor: Colors.green.shade700.withOpacity(0.2),
                    labelStyle: const TextStyle(color: Colors.green),
                  ),
                if (persona.reflects.isNotEmpty)
                  Chip(
                    label: Text('Reflects: ${persona.reflects.join(", ")}'),
                    backgroundColor: Colors.orange.shade700.withOpacity(0.2),
                    labelStyle: const TextStyle(color: Colors.orange),
                  ),
                if (persona.absorbs.isNotEmpty)
                  Chip(
                    label: Text('Absorbs: ${persona.absorbs.join(", ")}'),
                    backgroundColor: Colors.purple.shade700.withOpacity(0.2),
                    labelStyle: const TextStyle(color: Colors.purple),
                  ),
                if (persona.nullifies.isNotEmpty)
                  Chip(
                    label: Text('Nullifies: ${persona.nullifies.join(", ")}'),
                    backgroundColor: Colors.grey.shade700.withOpacity(0.2),
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}