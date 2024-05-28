import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final imagePickerUtils =  ImagePickerUtils();

  ImagePickerBloc(imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCaptureImageEvent>(_captureImageFromCamera);
  }

  void _captureImageFromCamera(CameraCaptureImageEvent event,Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.cameraImagePicker();
    emit(state.copyWith(file: file));
  }

}
