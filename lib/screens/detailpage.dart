import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_app/components/list.dart';
import 'package:student_data_app/models/model.dart';

import '../components/global.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController gridController = TextEditingController();
  TextEditingController stdController = TextEditingController();
  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> pickImage({required ImageSource source}) async {
    XFile? xFile = await imgPicker.pickImage(
      source: source,
    );

    if (xFile != null) {
      image = File(xFile.path);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            "Detail Page",
            style: GoogleFonts.ibarraRealNova(
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 75.w,
                    backgroundImage: (image != null)
                        ? FileImage(image!)
                        : const NetworkImage(
                                "https://i.pinimg.com/236x/ec/b3/32/ecb3320a4cb66ecdd9dd903f1fd6a5d8.jpg")
                            as ImageProvider,
                  ),
                  FloatingActionButton.small(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Select Your Photo"),
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                          ),
                          backgroundColor: Colors.white,
                          content: Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(
                                    source: ImageSource.camera,
                                  ).then(
                                    (val) {
                                      Navigator.pop(context);
                                    },
                                  );
                                  setState(() {});
                                },
                                label: Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                                icon: const Icon(Icons.camera),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await pickImage(source: ImageSource.gallery)
                                      .then(
                                    (val) => Navigator.pop(context),
                                  );
                                  setState(() {});
                                },
                                label: Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                                icon: const Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                controller: nameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "name",
                  labelStyle: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                controller: stdController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Enter Your Standard",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Std",
                  labelStyle: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                controller: gridController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Enter Your Grid",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "GRID",
                  labelStyle: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  String name = nameController.text;
                  int grid = int.parse(gridController.text);
                  int std = int.parse(stdController.text);

                  StudentModel stud = StudentModel(
                    image: image as File,
                    name: name,
                    std: std,
                    grid: grid,
                  );

                  student.add(stud);
                  setState(() {});
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
