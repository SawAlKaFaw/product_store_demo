import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_demo/model/product.dart';

class DetailsProduct extends StatelessWidget {
  final Product product;

  const DetailsProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      placeholder: (_,__)=>const Center(child: CircularProgressIndicator(),),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text(
                "Id : ${product.id.toString()}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("Title : ${product.title}",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Text("Description : ${product.description}",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Text("Price : ${product.price.toString()}",
                  style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
