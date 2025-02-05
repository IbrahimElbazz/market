import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/presentation/data/models/get_product_response.dart';

class MyOrder extends StatelessWidget {
  MyOrder({super.key});
  final GetProductResponse _response = GetProductResponse();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'My Order',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    dataProduct: _response,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
