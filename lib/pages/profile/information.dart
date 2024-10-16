import 'package:flutter/material.dart';
import 'package:odc_formation/pages/widget/text_field.dart';

import '../widget/Button.dart';

class InformationPerso extends StatefulWidget {
  const InformationPerso({super.key});

  @override
  State<InformationPerso> createState() => _InformationPersoState();
}

class _InformationPersoState extends State<InformationPerso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color:Colors.orange),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Informations",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const TextFieldInpute(
                  hintText: "Nom Complet",
                  icon: Icons.abc_outlined
              ),

              const TextFieldInpute(
                  hintText: "Email",
                  icon: Icons.email
              ),

              const TextFieldInpute(
                  hintText: "Addresse",
                  icon: Icons.location_on
              ),

              const TextFieldInpute(
                  hintText: "Telephone",
                  icon: Icons.phone
              ),


              // Bouton de déconnexion
              Mybutton(onTab: (){}, text: "Modifier")
            ],
          ),
        ),
      ),
    );
  }
}
