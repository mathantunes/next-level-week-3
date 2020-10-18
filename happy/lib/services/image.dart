import 'package:image_picker_web/image_picker_web.dart';

class _ImagePicker {
  Future<MediaInfo> pickImage() async {
    return await ImagePickerWeb.getImageInfo;
  }
}

var imagePicker = _ImagePicker();
