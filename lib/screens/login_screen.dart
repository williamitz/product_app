import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:product_app/providers/login_provider.dart';

import 'package:product_app/widgets/widgets.dart';
import 'package:product_app/ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgound(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ChangeNotifierProvider(
                        create: (_) => LoginProvider(),
                        child:  _LoginForm())
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Crear una nueva cuenta',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//

class _LoginForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginProvider>(context);

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
          key: loginProv.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authDecoration(
                    hintText: 'joe@gmail.com',
                    labelText: 'Correo electrónico',
                    prefixIcon: Icons.alternate_email),
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '') ? null : 'Email inválido';
                },
                onChanged: (value) => loginProv.email = value,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.authDecoration(
                      hintText: '****',
                      labelText: 'Password',
                      prefixIcon: Icons.lock_outline),
                  onChanged: (value) => loginProv.password = value,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Password requerido';
                    }

                    if (value != null && value.length < 6) {
                      return 'Mínimo 6 caracteres';
                    }

                    return null;
                  }),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 10),
                    child: Text(
                      loginProv.saving ? 'Ingresando...' : 'Ingresar',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  elevation: 0,
                  color: Colors.deepPurple,
                  onPressed: loginProv.saving
                      ? null
                      :  ()async {
                          // TODO: login submit

                          if (!loginProv.isValidFrm()) return;

                          loginProv.saving = true;

                          await Future.delayed(const Duration(seconds: 2));
                          loginProv.saving = false;

                        }),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
