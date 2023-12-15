import 'package:dio/dio.dart';

class FoodAPIRequest {
  static Future<String> postFoodRecognitionRequest(String imagePath) async {
    const url = "http://192.168.1.11:8000/recognize/";
    final dio = Dio();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagePath),
      "content-type": "image"
    });

    final response = await dio.post(url, data: formData);

    if (response.statusCode == 200) {
      print(response.data);
      return response.data["food"];
    } else {
      throw Exception("Failed to load food recognition");
    }
  }
}
