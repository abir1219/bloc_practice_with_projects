import 'package:bloc_practice/screens/counter/counter_screen.dart';
import 'package:bloc_practice/screens/favourite/favourite_screen.dart';
import 'package:bloc_practice/screens/image%20picker/image_picker_screen.dart';
import 'package:bloc_practice/screens/switch_example/switch_example_screen.dart';
import 'package:bloc_practice/screens/todo/todo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Column(
        // shrinkWrap: true,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
            context,
            "Counter Example",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CounterScreen(),
              ),
            ),
          ),
          customButton(
            context,
            "Switch Example",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SwitchExampleScreen(),
              ),
            ),
          ),
          customButton(
            context,
            "Image Picker Example",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ImagePickerScreen(),
              ),
            ),
          ),
          customButton(
            context,
            "Todo Example",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ToDoScreen(),
              ),
            ),
          ),
          customButton(
            context,
            "Favourite Example",
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavouriteScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customButton(BuildContext context, String name, void Function() func) {
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blue),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
