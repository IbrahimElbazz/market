import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/cached_network_image.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/features/home/data/models/get_product_response.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.dataProduct,
  });
  final GetProductResponse dataProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 330.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              CachedImage(
                imageUrl: dataProduct.imageUrl ?? "",
              ),
              const GapH(height: 10),
              Row(
                children: [
                  const GapW(width: 30),
                  Text(
                    dataProduct.productName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),
                  const GapW(width: 30),
                ],
              ),
              const GapH(height: 10),
              Row(
                children: [
                  const GapW(width: 30),
                  Text(
                    "${dataProduct.salary} LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  const GapW(width: 10),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
