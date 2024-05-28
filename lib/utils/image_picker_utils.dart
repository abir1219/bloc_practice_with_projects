import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{
  late final ImagePicker? _imagePicker;

  Future<XFile?> cameraImagePicker() async{
    XFile? file = await _imagePicker!.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryImagePicker() async{
    XFile? file = await _imagePicker!.pickImage(source: ImageSource.gallery);
    return file;
  }

}