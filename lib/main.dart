import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_demo/bloc/product_bloc.dart';
import 'package:online_shop_demo/service/api_service.dart';

import 'ui/screens/all_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc(apiService: ApiService())..add(LoadedPostSuccessEvent()),
        child: const HomeScreen(),
      ),

    );
  }
}