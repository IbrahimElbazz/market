import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/data/models/get_product_response.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ProductCard(
                        dataProduct: GetProductResponse(),
                      ),
                      const GapH(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
