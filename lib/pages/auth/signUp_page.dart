import 'package:flutter/material.dart';
import 'package:odc_formation/pages/auth/login_page.dart';

import '../widget/Button.dart';
import '../widget/text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                width: double.infinity,
                height: height / 2.8,
                child: Image.asset("assets/images/Signup.png"),),
              /*const TextFieldInpute(
                  // textEditingController: nameController,
                  hintText: "Entrer your name",
                  icon: Icons.person
              ),

              const TextFieldInpute(
                  // textEditingController: emailController,
                  hintText: "Entrer yo ur email",
                  icon: Icons.email
              ),
              const TextFieldInpute(
                  // textEditingController: passwordController,
                  hintText: "Entrer your password",
                  isPass: true,
                  icon: Icons.lock
              ),
*/
              Mybutton(text: "S'inscrire", onTap: () {  },),
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Vous avez déjà un compte ? ",style: TextStyle(fontSize: 16),),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Connexion",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 16
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
