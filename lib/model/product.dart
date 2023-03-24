import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:yursayur/model/tag.dart ';

part 'product.g.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((product) => Product.popularProductFromJson(product)));

List<Product> productListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((product) => Product.productFromJson(product)));

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final List<Tag> tags;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.tags});

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['product']['data']['attributes']['name'],
      description: data['attributes']['product']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['product']['data']
              ['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: []);

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['name'],
        description: data['attributes']['description'],
        images: List<String>.from(data['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
        tags: List<Tag>.from(
            data['attributes']['tags']['data'].map((val) => Tag.fromJson(val))),
      );
}
