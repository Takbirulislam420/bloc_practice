import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/counter/counter_bloc.dart';
import 'package:practice_with_bloc/bloc/favorite/favorite_bloc.dart';
import 'package:practice_with_bloc/bloc/image/imagepicker_bloc.dart';
import 'package:practice_with_bloc/bloc/switch/switch_bloc.dart';
import 'package:practice_with_bloc/bloc/todo/to_do_bloc.dart';
import 'package:practice_with_bloc/features/favorite/favorite_app_screen.dart';
import 'package:practice_with_bloc/features/to_do_list/to_do_list_screen.dart';
import 'package:practice_with_bloc/repository/favorite_repository.dart';
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
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavoriteBloc(FavoriteRepository())),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const FavoriteAppScreen(),
      ),
    );
  }
}
