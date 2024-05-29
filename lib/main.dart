import 'package:bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:bloc_practice/bloc/switch/switch_bloc.dart';
import 'package:bloc_practice/bloc/todo/todo_bloc.dart';
import 'package:bloc_practice/repository/favourite_item_repository.dart';
import 'package:bloc_practice/screens/counter/counter_screen.dart';
import 'package:bloc_practice/screens/favourite/favourite_screen.dart';
import 'package:bloc_practice/screens/image%20picker/image_picker_screen.dart';
import 'package:bloc_practice/screens/switch_example/switch_example_screen.dart';
import 'package:bloc_practice/screens/todo/todo_screen.dart';
import 'package:bloc_practice/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/favourite/favourite_bloc.dart';
import 'bloc/image picker/image_picker_bloc.dart';
import 'home_screen.dart';

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
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(FavouriteItemRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CounterScreen(),
        // home: const SwitchExampleScreen(),
        // home: const ImagePickerScreen(),
        // home: const ToDoScreen(),
        // home: const FavouriteScreen(),
        home: const HomeScreen(),
      ),
    );
  }
}