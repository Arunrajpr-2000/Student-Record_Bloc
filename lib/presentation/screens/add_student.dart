import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database_bloc/application/student_crud_cubit/crud_cubit_cubit.dart';
import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';
import 'package:student_database_bloc/presentation/widgets/image_picker.dart';

class AddScreen extends StatelessWidget {
  AddScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Student'),
      ),
      body: BlocBuilder<CrudCubitCubit, CrudCubitState>(
        builder: (context, state) {
          return Form(
            // key: widget.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  //if (imagePath == null)
                  imagePath == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/117-1176594_student-learning-education-college-student-vector-png-transparent.png',
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.file(
                            File(imagePath!),
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ImagePickerWidget.getImage(source: ImageSource.gallery);
                      },
                      child: const Text('Select Image')),
                  ElevatedButton(
                      onPressed: () {
                        ImagePickerWidget.getImage(source: ImageSource.camera);
                      },
                      child: const Text('Take an Image')),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      style: const TextStyle(fontSize: 16),
                      controller: nameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Name',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Age',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: placeController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'Place',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: qualificationController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'qualification',
                    ),
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
                            .addStudentListUpdate(DBFunction.getBox(), student);
                        Navigator.pop(context);
                      },
                      child: const Text('SAVE'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
