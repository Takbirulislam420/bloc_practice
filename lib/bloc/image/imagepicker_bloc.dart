import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_with_bloc/utils/image_picker_utils.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImagepickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagepickerBloc(this.imagePickerUtils) : super(const ImagepickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  // Capture image from camera
  Future<void> _cameraCapture(
    CameraCapture event,
    Emitter<ImagepickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  // Pick image from gallery
  Future<void> _galleryImagePicker(
    GalleryImagePicker event,
    Emitter<ImagepickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}
