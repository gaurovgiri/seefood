import 'package:app/features/home/data/images_data.dart';
import 'package:app/features/home/views/image_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodCarousel extends StatelessWidget {
  const FoodCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: true, autoPlay: true, height: 400),
        items: foodImages.map((image) => ImageCard(img: image)).toList());
  }
}
