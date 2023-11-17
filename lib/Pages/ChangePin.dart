import 'package:flutter/material.dart';
import 'package:abank_project/Pages/MyAccount.dart';
import 'package:flutter/services.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF363636),        
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Change Pin"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAccount(),
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(15)),
              height: 150,
              width: 200,
              margin: EdgeInsets.only(top: 50, bottom: 45),
              padding: EdgeInsets.all(20),
              child: Image.asset('lib/icons/lock.png'),
            ),
            buildTextField(
              controller: _currentPasswordController,
              labelText: "Current Pin",
            ),
            SizedBox(height: 20,),
            buildTextField(
              controller: _newPasswordController,
              labelText: "New Pin",
            ),
            SizedBox(height: 20,),
            buildTextField(
              controller: _confirmPasswordController,
              labelText: "Confirm Pin",
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: MaterialButton(
                    color: const Color.fromARGB(255, 70, 172, 254),
                    onPressed: () {
                      // Implementasi logika untuk tombol Save
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 20,color:Colors.black),
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 1, color: Colors.black)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    color: Color(0xFFD9D9D9),
                    onPressed: () {
                      // Menghapus teks pada semua TextField
                      _currentPasswordController.clear();
                      _newPasswordController.clear();
                      _confirmPasswordController.clear();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 45, left: 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 1, color: Colors.black)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField({required TextEditingController controller, required String labelText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFD9D9D9),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          labelText: labelText,
        ),
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
