import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/form_validation/bloc/my_form_bloc.dart';
import 'package:flutter_bloc_state_management/form_validation/views/form_validation_page.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (_) => MyFormBloc(),
          child: const MyForm(),
        ),
      ),
    );
  }
}
