import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {

  //RestaurantCategoriesCreateController controller = Get.put(RestaurantCategoriesCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewCategory(context),
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.deepPurpleAccent,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.29, left: 50, right: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0, 0.75)
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  // Widget _textFieldDescription() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  //     child: TextField(
  //       //controller: controller.descriptionController,
  //       keyboardType: TextInputType.text,
  //       maxLines: 5,
  //       decoration: InputDecoration(
  //           hintText: 'AUDIO',
  //           prefixIcon: Container(
  //               margin: EdgeInsets.only(bottom: 70),
  //               child: Icon(Icons.description))
  //
  //       ),
  //     ),
  //   );
  // }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: ElevatedButton(
          onPressed: ()  {
            //controller.createCategory();
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)
          ),
          child: Text(
            'GRABAR AUDIO',
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
    );
  }

  Widget _textNewCategory(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Icon(Icons.multitrack_audio_outlined, size: 120, color: Colors.white,),
              Text(
                'NUEVO AUDIO',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
      child: Text(
        'CREAR GRABACION DE AUDIO',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

}
