class ImageModel {
  String foodName;
  String imagePath;
  bool fromAssets;

  ImageModel({required String foodName, String? imagePath})
      : this.foodName = capitalize(foodName),
        this.imagePath = imagePath ?? "assets/foods/$foodName.jpeg",
        this.fromAssets = imagePath == null;

  static String capitalize(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str[0].toUpperCase() + str.substring(1);
  }
}
