import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('ID Card',style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView.builder(itemCount: textController.length,itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
              ),
              child: ListTile(
                trailing: IconButton(onPressed: () {
                  setState(() {
                    textController.removeAt(index);
                  });
                },icon: const Icon(Icons.delete_forever_outlined,color: Colors.red,),),
                title: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        XFile? xFile=await imagePicker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          textController[index].imageFile=File(xFile!.path);
                        });
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: (textController[index].imageFile!=null)?FileImage(textController[index].imageFile!):null,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    textFormFieldWorking(textFind: 'G.R Id', controllerFind: textController[index].idnumber!, maxLengthFind: 4,keyboardTypeFind: TextInputType.number, validatorFind: (value) {

                    }),
                    const SizedBox(height: 10,),
                    textFormFieldWorking(textFind: 'Name',controllerFind: textController[index].name!,keyboardTypeFind: TextInputType.text,maxLengthFind: 20, validatorFind: (value) {

                    }),
                    const SizedBox(height: 10,),
                    textFormFieldWorking(textFind: 'Surname',controllerFind: textController[index].surname!, maxLengthFind: 20,keyboardTypeFind: TextInputType.text, validatorFind: (value) {

                    }),
                    const SizedBox(height: 10,),
                    textFormFieldWorking(textFind: 'Per%',controllerFind: textController[index].per!, maxLengthFind: 5, keyboardTypeFind: TextInputType.number, validatorFind: (value) {
                      if(value!.isEmpty)
                        {
                          return 'data';
                        }
                    }),
                    RadioListTile(value: 'Male', groupValue: textController[index].gender, onChanged: (value) {
                      setState(() {
                        textController[index].gender=value!;
                      });
                    },title: const Text('Male'),),
                    RadioListTile(value: 'Female', groupValue: textController[index].gender, onChanged: (value) {
                      setState(() {
                        textController[index].gender=value!;
                      });
                    },title: const Text('Female'),),
                    RadioListTile(value: 'Other', groupValue: textController[index].gender, onChanged: (value) {
                      setState(() {
                        textController[index].gender=value!;
                      });
                    },title: const Text('Other'),),
                  ],
                ),
              ),
            ),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            File? imageFile;
            TextEditingController idnumber=TextEditingController();
            TextEditingController name=TextEditingController();
            TextEditingController surname=TextEditingController();
            TextEditingController per=TextEditingController();
            String gender='Male';
            textController.add(FindController(idnumber: idnumber,name: name,per: per,surname: surname,gender: gender,imageFile: imageFile));
          });
        },
        child: const Icon(Icons.add_box_outlined,color: Colors.white,),
      ),
    );
  }

  TextFormField textFormFieldWorking({required String textFind,required TextEditingController controllerFind,required int maxLengthFind,required TextInputType keyboardTypeFind,required FormFieldValidator validatorFind}) {
    return TextFormField(
      controller: controllerFind,
                validator: validatorFind,
                maxLength: maxLengthFind,
                keyboardType: keyboardTypeFind,
                decoration: InputDecoration(
                  label: Text(textFind),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                ),
              );
  }
}
File? imageFile;
ImagePicker imagePicker=ImagePicker();
TextEditingController idnumber=TextEditingController();
TextEditingController name=TextEditingController();
TextEditingController surname=TextEditingController();
TextEditingController per=TextEditingController();
GlobalKey<FormState> formKey=GlobalKey();
String gender='Male';
List<FindController> textController=[];
class FindController{
  File? imageFile;
  TextEditingController? idnumber;
  TextEditingController? name;
  TextEditingController? surname;
  TextEditingController? per;
  String? gender;
  FindController({this.idnumber,this.name,this.per,this.surname,this.gender,this.imageFile});
}
