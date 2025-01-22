import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330.h,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image(
            image: const NetworkImage(
                'https://shop.diorbeauty.hk/cdn/shop/products/C099700102_1_750x.jpg?v=1703665779'),
            width: 300.w,
          ),
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
    );
  }
}
