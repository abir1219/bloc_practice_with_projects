import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/image picker/image_picker_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Picker"),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return state.file == null
              ? Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera,
                      size: 60,
                    ),
                    onPressed: () {
                      context.read<ImagePickerBloc>().add(CameraCaptureImageEvent());
                    },
                  ),
                )
              : Image.file(File(state.file!.path.toString(),),);
        },
      ),
    );
  }
}
