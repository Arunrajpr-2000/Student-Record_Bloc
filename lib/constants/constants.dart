// import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:student_database_bloc/db/model/student_db.dart';

const KBoxKey = 'studentbox';

final box = Hive.box<StudentDb>(KBoxKey);
