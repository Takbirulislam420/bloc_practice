import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> galleryCapture() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
