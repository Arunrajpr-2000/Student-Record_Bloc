import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';

class ViewScreen extends StatelessWidget {
  final int index;

  const ViewScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentDb student = DBFunction.getStudent(index);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green.shade100,
                child: student.imagePath == null
                    ? ClipOval(
                        child: Image.asset(
                          'assets/117-1176594_student-learning-education-college-student-vector-png-transparent.png',
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image.file(
                          File(student.imagePath!),
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )),
            const SizedBox(height: 10),
            Text(
              'Name : ${student.name}',
              style: const TextStyle(color: Colors.red, fontSize: 35),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Place : ${student.place}',
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ('Age : ${student.age}'),
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              ('Qualification : ${student.qualification}'),
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
