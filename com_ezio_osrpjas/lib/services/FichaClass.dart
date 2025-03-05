import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class FichaDnd{
  String nome;
  String classe;
  String subclasse;
  List<String> multiclasse;
  List<String> pericias;
  String raca;
  int nivel;
  int pontosDeVida;
  int pontosDeVidaMaximos;
  int forca;
  int destreza;
  int constituicao;
  int inteligencia;
  int sabedoria;
  int carisma;
  List<String> habilidades;
  List<String> equipamentos;
  List<String> magias;

  FichaDnd(
    {
    required this.nome,
    required this.classe,
    required this.subclasse,
    required this.multiclasse,
    required this.pericias,
    required this.raca,
    required this.nivel,
    required this.pontosDeVida,
    required this.pontosDeVidaMaximos,
    required this.forca,
    required this.destreza,
    required this.constituicao,
    required this.inteligencia,
    required this.sabedoria,
    required this.carisma,
    required this.habilidades,
    required this.equipamentos,
    required this.magias,
    }
  );

  

  Future<void> uploadToFirestore() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;


    String uid = user!.uid;
      
    
    try {
      CollectionReference fichas = firestore.collection('Users').doc(uid).collection('');

      await fichas.add({
      'nome': nome,
      'classe': classe,
      'subclasse': subclasse,
      'multiclasse': multiclasse,
      'pericias': pericias,
      'raca': raca,
      'nivel': nivel,
      'pontosDeVida': pontosDeVida,
      'pontosDeVidaMaximos': pontosDeVidaMaximos,
      'forca': forca,
      'destreza': destreza,
      'constituicao': constituicao,
      'inteligencia': inteligencia,
      'sabedoria': sabedoria,
      'carisma': carisma,
      'habilidades': habilidades,
      'equipamentos': equipamentos,
      'magias': magias,
      });
    } catch (e) {
      print('Failed to upload ficha: $e');
    }

    
  }
}