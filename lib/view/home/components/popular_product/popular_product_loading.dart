import 'package:flutter/material.dart';
import 'package:yursayur/view/home/components/popular_product/popular_product_loading_card.dart';

class PopularProductLoading extends StatelessWidget {
  const PopularProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const PopularProductLoadingCard(),
      ),
    );
  }
}