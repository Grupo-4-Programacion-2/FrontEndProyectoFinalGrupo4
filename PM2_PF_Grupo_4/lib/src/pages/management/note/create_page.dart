import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/note/create_controller.dart';


class CreatePage extends StatelessWidget {

  CreateController controller = Get.put(CreateController());

  DateTime? selectedDate;
  TimeOfDay? selectedTime;


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      controller.setDate(picked); // Ajusta esta función según tus necesidades
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      controller.setTime(picked, context); // Ajusta esta función según tus necesidades
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( // POSICIONAR ELEMENTOS UNO ENCIMA DEL OTRO
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context)
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
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.24, left: 50, right: 50),
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
            _textFieldBirthdate(context),
            _textFieldTime(context),
            _textFieldLat(),
            _textFieldLgn(),
            _textFieldDescription(),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: TextField(
        controller: controller.descripcionController,
        keyboardType: TextInputType.text,
        maxLines: 5,
        decoration: InputDecoration(
            hintText: 'DESCRIPCION',
            prefixIcon: Container(
                margin: EdgeInsets.only(bottom: 0),
                child: Icon(Icons.description))
        ),
      ),
    );
  }

  Widget _textFieldLat() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: TextField(
        controller: controller.latController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: 'Latitude (Opcional)',
            prefixIcon: Container(
                child: Icon(Icons.maps_ugc))
        ),
      ),
    );
  }

  Widget _textFieldLgn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: TextField(
        controller: controller.lgnController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: 'Longitude (Opcional)',
            prefixIcon: Container(
                child: Icon(Icons.maps_ugc))
        ),
      ),
    );
  }

  Widget _textFieldTime(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
      child: TextField(
        style: TextStyle(
          color: Colors.black
        ),
        controller: controller.timeController,
        readOnly: true,
        onTap: () => _selectTime(context),
        decoration: InputDecoration(
          hintText: 'Hora',
          prefixIcon: Icon(Icons.access_time)
        ),
      ),
    );
  }


  Widget _textFieldBirthdate(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
      child: TextField(
        controller: controller.birthdateController,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          hintText: 'Fecha',
          prefixIcon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
            onTap: () => controller.showAlertDialog(context),
            child: GetBuilder<CreateController> (
              builder: (value) => CircleAvatar(
                backgroundImage: controller.imageFile != null
                    ? FileImage(controller.imageFile!)
                    : AssetImage('assets/img/user_profile.png') as ImageProvider,
                radius: 60,
                backgroundColor: Colors.white,
              ),
            )
        ),
      ),
    );
  }


  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: ElevatedButton(
          onPressed: ()  {
            controller.registerRemember(context);
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)
          ),
          child: Text(
            'CREAR NOTA',
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 30),
      child: Text(
        'CREAR NOTA DE TEXTO',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

}
