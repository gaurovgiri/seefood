class ImageModel {
  late String foodName;
  late String imagePath;

  ImageModel(String foodName) {
    this.foodName = capitalize(foodName);
    this.imagePath = "assets/foods/" + foodName + ".jpeg";
  }

  String capitalize(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str[0].toUpperCase() + str.substring(1);
  }
}
