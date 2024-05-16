import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool isVisibleObsecure = false;

  void _submittedForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Formulario Enviado Exitosamente"),
        ),
      );
    }
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return ("Ingresa tu nombre");
    } else if (RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return ("Ingresar un nombre valido sin numeros o caracteres espeviales");
    }
    return null;
  }

  String? validatePassword(String? value, String? text) {
    if (value!.isEmpty) {
      return ("Ingresa tu contraseña");
    } else if (value.length < 6) {
      return ("ingresa una contraseña de al menos 6 caracteres o mas");
    } else if (RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
      return ("Favor de ingresar una contraseña valida");
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return ("Favor de ingresar un correo electronico");
    } else if (RegExp(r"^[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+\[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return ("Favor de ingresar un correo electronico valido");
    }
    return null;
  }

  String? confirmValidatePassword(String? value, String? text) {
    if (value!.isEmpty) {
      return ("Favor de confirmar la contraseña");
    } else if (value != text) {
      return ("La contraseña no coincide");
    }
    return validatePassword(value, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/img1.png"),
                          height: 130,
                        ),
                        Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Crear \nCuenta Nueva",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4d99bc),
                                    height: 1),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                validator: (value) => validateName(value),
                                controller: _nameController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: "Nombre"),
                              ),
                              TextFormField(
                                validator: (value) => validateEmail(value),
                                controller: _emailController,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: "Correo Electronico"),
                              ),
                              TextFormField(
                                validator: (value) => validatePassword(
                                    value, _passwordController.text),
                                controller: _passwordController,
                                autocorrect: false,
                                enableSuggestions: false,
                                obscureText: isVisibleObsecure,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisibleObsecure =
                                                !isVisibleObsecure;
                                          });
                                        },
                                        icon: isVisibleObsecure
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                    prefixIcon: Icon(Icons.password),
                                    hintText: "Contraseña"),
                              ),
                              TextFormField(
                                controller: _confirmController,
                                autocorrect: false,
                                enableSuggestions: false,
                                obscureText: isVisibleObsecure,
                                validator: (value) => confirmValidatePassword(
                                    value, _passwordController.text),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.password_outlined),
                                    hintText: "Confirmar Contraseña"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff4d99bc),
                                      minimumSize: Size(400, 50)),
                                  onPressed: () {
                                    _submittedForm();
                                  },
                                  child: Text(
                                    "Crear",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )))),
    );
  }
}
