import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_demo/ui/screens/details_product.dart';

import '../../bloc/product_bloc.dart';

class DisplayProductsWidget extends StatelessWidget {
  final LoadedPostSuccessState state;

  const DisplayProductsWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //scrollDirection: Axis.horizontal,
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsProduct(product: state.products[index])));
            },
            child: Card(
              elevation: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Container(
                      height: 170,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CachedNetworkImage(
                              placeholder: (_, __) => const Center(
                                  child: CircularProgressIndicator()),
                              fit: BoxFit.fill,
                              imageUrl: state.products[index].image,
                            ),
                          ))),
                  Text(state.products[index].price.toString())
                ],
              ),
            ),
          );
        });
  }
}
