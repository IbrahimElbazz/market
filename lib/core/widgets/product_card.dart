import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/views/product_details/ui/screens/order_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OrderDetails();
                },
              ),
            );
          },
          child: Container(
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
                Image.network(
                  width: 300,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXappsZyHph8O7O45kgi1tFZeFaGZ13phc6g&s",
                ),
                // CachedNetworkImage(
                //   imageUrl:
                //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXappsZyHph8O7O45kgi1tFZeFaGZ13phc6g&s",
                //   imageBuilder: (context, imageProvider) => Container(
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: imageProvider,
                //         fit: BoxFit.cover,
                //         colorFilter: const ColorFilter.mode(
                //           Colors.red,
                //           BlendMode.colorBurn,
                //         ),
                //       ),
                //     ),
                //   ),
                //   placeholder: (context, url) =>
                //       const CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
                const GapH(height: 10),
                Row(
                  children: [
                    const GapW(width: 30),
                    Text(
                      'Dior',
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
                      '250 EG',
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
        ),
      ],
    );
  }
}
