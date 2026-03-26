import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_flutter/components/persona_card.dart';
import 'package:persona_flutter/screens/persona_detail_screen.dart';
import 'package:persona_flutter/services/api_service.dart';

import '../models/persona.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Persona>> futurePersonas;

  @override
  void initState() {
    super.initState();
    futurePersonas = ApiService().fetchPersona();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persona Compendium')),
      body: FutureBuilder<List<Persona>>(
        future: futurePersonas,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final personas = snapshot.data!;
              return ListView.builder(
                  itemCount: personas.length,
                  itemBuilder: (context, index) {
                    final persona = personas[index];
                    return PersonaCard(persona: persona, onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PersonaDetailScreen(persona: persona)));
                    },
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'),);
            } else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}
