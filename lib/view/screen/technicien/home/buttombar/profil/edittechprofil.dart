import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widget/boutton.dart';

class EditTechProfil extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar : AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back , color: Colors.black),
    onPressed: () {
      Get.back(); 
    },
  ),
  centerTitle: true,
  title: Text('Trouver un expert' , style: TextStyle(color: Colors.black , fontFamily: "Comfortaa" , fontWeight: FontWeight.bold , fontSize: 18),),
  elevation: 0,
  backgroundColor: Colors.white.withAlpha(0),
),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset('assets/images/profil.png', height: 100, width: 100,),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3),
      ),
    ],),
              child: Column(children: [
                  _buildEditableField(
              'Nom d\'utilisateur',
              'RahmaJbeli',
              _usernameController,
            ),
            SizedBox(height: 20),
            _buildEditableField(
              'Adresse e-mail',
              'RahmaJbeli@gmail.com',
              _emailController,
            ),
            SizedBox(height: 20),
            _buildEditableField(
              'Mot de passe',
              '••••••••••••',
              _passwordController,
              obscureText: true,
            ),
            _buildEditableField(
              'Numero de  telephone',
              '123456789',
              _telController,
            ),
              ]),
            ),
            SizedBox(height: 20),
            Center(
              child: Boutton(
                color: Color.fromARGB(255, 255, 203, 30),
                text: "Sauvegarder",
                onPressed: (){
                    // Sauvegarder les modifications
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String tel = _telController.text;

                  // Faire quelque chose avec les données saisies ici...
                },
              ),
            )
           
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(
    String label,
    String value,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontFamily: "Comfortaa"
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(text: value ),
                  readOnly: true,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: value,
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.defaultDialog(
                    title: '  Modifier $label  ',
                    content: Container(
                      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: controller,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              labelText: 'Ancien $label',
                            ),
                          ),
                          TextFormField(
                            controller: controller,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              labelText: 'Nouveau $label',
                            ),
                          ),
                        ],
                      ),
                    ),
                    confirm:Boutton(
                      text: "Sauvegarder", 
                    color: Color.fromARGB(255, 255, 203, 30),
                    onPressed: () {
                        Get.back();
                      },
                    ),
                    
                    cancel: Boutton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Annuler',
                      color: Color.fromARGB(255, 255, 203, 30),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      
    );
  }
}
