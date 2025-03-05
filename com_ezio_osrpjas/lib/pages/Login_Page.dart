import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_ezio_osrpjas/pages/Ficha/Ficha.dart';
import 'package:com_ezio_osrpjas/pages/menu/Menu_Page.dart'; // Add this line
import 'package:com_ezio_osrpjas/services/AuthService.dart'; // Ensure this line is correct

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
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

  bool loading = false;

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

  login() async {
    setState(() {
      loading = true;
    });
    
    try{      
      await context
          .read< AuthService >()
          .login(emailController.text, passwordController.text);

      setState(() {
              loading = false;
            });

    } on AuthException catch(e) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message)
        ),
      );

      setState(() {
        loading = false;
      });

    }
  }

  registrar(){
    setState(() {
        loading = true;
      });
    try{
      
      context
          .read< AuthService >()
          .registrar(emailController.text, passwordController.text);

      setState(() {
              loading = false;
            });
      
    } on AuthException catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
          backgroundColor: Colors.red,
        ),
      );
        }
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
                        //campo email
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
                        //campo senha
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
                            else if (value.length < 6) {
                              return 'Senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        //botão de ação
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: (loading)? [
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ] :
                              
                              [
                                Text(actionButton),
                              ],
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (isLogin) {
                                  // Login
                                  login();

                                } else {
                                  // Criar Conta
                                  registrar();
                                }
                              }
                            },
                            
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setFormAction(!isLogin);
                          },
                          child: Text(toggleButton),
                        ),
                      
                      ],
                  )),
                  
                  )
              ),
            )
          ;
  }
}

