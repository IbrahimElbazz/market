import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/views/home/ui/widgets/category_card.dart';
import 'package:market/views/home/ui/widgets/list_category.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const GapH(height: 20),
              const CustomTextField(
                enable: false,
                hint: 'search now ',
                iconButton: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              const GapH(height: 20),
              SizedBox(
                width: 300.w,
                child: Image.asset('assets/images/3858422.jpg'),
              ),
              Row(
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const GapH(height: 10),
              const ListCategory(),
              const GapH(height: 10),
              const CategoryCard()
            ],
          ),
        ),
      ),
    );
  }
}
