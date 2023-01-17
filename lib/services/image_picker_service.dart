import 'package:image_picker/image_picker.dart';

class PickerService {
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>?> pickImages() async {
    final images = await _picker.pickMultiImage();
    return images;
  }
}
