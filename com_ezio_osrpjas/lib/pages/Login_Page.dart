import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Ficha.dart';
import 'package:com_ezio_osrpjas/pages/menu/Menu_Page.dart'; // Add this line
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
      titulo = 'Login';
      actionButton = 'Login';
      toggleButton = 'Criar Conta';
    } else {
      titulo = 'Criar Conta';
      actionButton = 'Criar Conta';
      toggleButton = 'Já tenho uma conta';
    }

    });
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          titulo,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email é obrigatório';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Senha é obrigatória';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (isLogin) {
                                // Login
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MenuPage()),
                                );
                              } else {
                                // Criar Conta
                                
                              }
                            }
                          },
                          child: Text(actionButton),
                        ),
                      ],
                  )),
                  
                  )
              ),
            )
          ;
  }
}

