import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/data/models/get_product_response.dart';

class Store extends StatelessWidget {
  Store({super.key});
  final GetProductResponse _response = GetProductResponse();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              const GapH(height: 20),
              const CustomTextField(
                enable: false,
                hint: 'search now ',
                iconButton: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              const GapH(height: 20),
              Row(
                children: [
                  Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const GapH(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
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
