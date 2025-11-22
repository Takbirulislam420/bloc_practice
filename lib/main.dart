import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/counter/counter_bloc.dart';
import 'package:practice_with_bloc/bloc/image/imagepicker_bloc.dart';
import 'package:practice_with_bloc/bloc/switch/switch_bloc.dart';
import 'package:practice_with_bloc/features/image_picker/image_picker_screen.dart';
import 'package:practice_with_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagepickerBloc(ImagePickerUtils())),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
