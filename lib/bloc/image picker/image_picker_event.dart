part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent extends Equatable {}

final class CameraCaptureImageEvent extends ImagePickerEvent {
  @override
  List<Object?> get props => [];
}

final class GalleryCaptureImageEvent extends ImagePickerEvent {
  @override
  List<Object?> get props => [];
}
