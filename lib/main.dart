import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_database_bloc/application/SearchBloc/searchbloc_bloc.dart';
import 'package:student_database_bloc/application/searchIcon/search_icon_cubit.dart';
import 'package:student_database_bloc/application/student_crud_cubit/crud_cubit_cubit.dart';
import 'package:student_database_bloc/db/db_function.dart';
import 'package:student_database_bloc/db/model/student_db.dart';
import 'package:student_database_bloc/presentation/screens/home_screen.dart';

import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentDbAdapter());
  await Hive.openBox<StudentDb>(KBoxKey);
  runApp(MyApp(
    searchbloc: SearchBlocBloc(),
  ));
}

class MyApp extends StatelessWidget {
  final SearchBlocBloc searchbloc;
  const MyApp({Key? key, required this.searchbloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CrudCubitCubit(
              list: DBFunction.getStudentList(), searchBloc: searchbloc),
        ),
        BlocProvider(create: (context) => searchbloc),
        BlocProvider(create: (context) => SearchIconCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Bloc',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
