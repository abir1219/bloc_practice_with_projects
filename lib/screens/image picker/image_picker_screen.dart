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
          return Center(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<ImagePickerBloc>()
                                      .add(CameraCaptureImageEvent());
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.camera,
                                  size: 60,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<ImagePickerBloc>()
                                      .add(GalleryCaptureImageEvent());
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.image,
                                  size: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      // color: Colors.red,
                      child: state.file != null
                          ? Image.file(
                              File(
                                state.file!.path.toString(),
                              ),
                            )
                          : const Center(child: Text("Click here to capture image"),));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
