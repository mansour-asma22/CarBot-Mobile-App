import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karhabti_pfe/view/screen/technicien/home/rendezvoustech.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/boutton.dart';

class AddEventPage extends StatelessWidget {
  final EventController _eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          'Ajouter un rendez-vous',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset("assets/images/image22.png"),
                Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 10),                                  
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 33, 32, 30)),
                  ),
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(14) ) ,
                      hintText: '  Titre..',
                      hintStyle: TextStyle(color: ColorApp.hinttext ,  fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 15,),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 10),                 
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 33, 32, 30)),
                  ),
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(14) ) ,
                  contentPadding: EdgeInsets.only(bottom: 250 ),
                      hintText: '  Description..',
                      hintStyle: TextStyle(color: ColorApp.hinttext ,  fontFamily: "Comfortaa",
            fontWeight: FontWeight.bold,
            fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Boutton(
                  onPressed: (){ _eventController.addEvent(
                      Event(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        date: _eventController.selectedDate.value,
                        //lahne tekhdem l'enregistrement
                      ),
                    );
                    Get.back(); }, 
                    color: ColorApp.primaryColor,
                     text: "Ajouter" ),
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}