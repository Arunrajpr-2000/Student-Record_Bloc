import 'package:image_picker/image_picker.dart';

XFile? image;
String? imagePath;

class ImagePickerWidget {
  static getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      // setState(() {
      //   imagePath = (image!.path);
      // });
      imagePath = (image!.path);
    } else {
      return null;
    }
  }
}
