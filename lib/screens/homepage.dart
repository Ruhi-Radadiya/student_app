import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_data_app/components/list.dart';

import '../routes/routes.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Homepage",
            style: GoogleFonts.ibarraRealNova(
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              splashColor: Colors.white38,
              tileColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: FileImage(student[index].image),
              ),
              title: Text(
                student[index].name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                student[index].std.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Edit"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      labelText: "name",
                                      labelStyle: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextField(
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Standard",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      labelText: "Std",
                                      labelStyle: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  TextField(
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Grid",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      labelText: "GRID",
                                      labelStyle: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Upgrade")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel")),
                              ],
                            );
                          });
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        student.removeAt(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: student.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.detailpage).then(
            (value) => setState(() {}),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
