import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_demo/bloc/product_bloc.dart';

import '../widgets/display_products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Shop Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is PostInitialState) {
                    return  const Center(child:  SizedBox(
                      height: 100,
                      width: 100,
                        child: CircularProgressIndicator()));
                  } else if (state is LoadedPostSuccessState) {
                    ///Display All Products in Home Screen
                    return  DisplayProductsWidget(state: LoadedPostSuccessState(state.products),);
                  } else {
                    return Container(color: Colors.red);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
