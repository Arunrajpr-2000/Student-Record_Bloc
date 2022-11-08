// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:student_database_bloc/application/student_crud_cubit/crud_cubit_cubit.dart';

import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';
import 'package:student_database_bloc/presentation/widgets/image_picker.dart';

class EditScreen extends StatelessWidget {
  // final List<StudentDb> list;
  final int index;
  final StudentDb student;
  EditScreen({
    Key? key,
    required this.index,
    required this.student,
  }) : super(key: key);

  //  StudentDb student = DBFunction.getStudent(index);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: student.name);
    TextEditingController ageController =
        TextEditingController(text: student.age.toString());
    TextEditingController placeController =
        TextEditingController(text: student.place);
    TextEditingController qualificationController =
        TextEditingController(text: student.qualification);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        elevation: 10,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (student.imagePath != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.file(
                      File(student.imagePath!),
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: 'Name',
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'Age',
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: placeController,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      labelText: "Place",
                      hintText: 'Place',
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: qualificationController,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      labelText: "Qualification",
                      hintText: 'Qualification',
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          ImagePickerWidget.getImage(
                              source: ImageSource.gallery);
                        },
                        //  getImage(source: ImageSource.gallery),
                        child: const Text('Select New Image')),
                    ElevatedButton(
                        onPressed: () {
                          ImagePickerWidget.getImage(
                              source: ImageSource.camera);
                        },
                        child: const Text('Take New Image')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      StudentDb student = StudentDb(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        place: placeController.text,
                        qualification: qualificationController.text,
                        imagePath: imagePath,
                      );
                      BlocProvider.of<CrudCubitCubit>(context)
                          .editStudentListUpdate(
                              DBFunction.getBox(), student, index);

                      Navigator.pop(context);
                    },
                    child: const Text('Submit changes'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
