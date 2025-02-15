import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/home/presentation/screens/product_screen.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({
    super.key,
  });

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: listCategory.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                active = index;
              });

              listCategory[index]['name'] == 'All'
                  ? context.read<HomeCubit>().getProducts()
                  : context.read<HomeCubit>().getCategory(
                        listCategory[index]['name'],
                      );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: active == index
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    listCategory[index]['icon'],
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${listCategory[index]['name']}',
                  style: TextStyle(
                    color: active == index ? Colors.blue : Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List listCategory = [
  {
    'name': 'All',
    'icon': Icons.shopping_bag_rounded,
  },
  {
    'name': 'Home appliances',
    'icon': Icons.collections,
  },
  {
    'name': 'Books',
    'icon': Icons.book,
  },
];
