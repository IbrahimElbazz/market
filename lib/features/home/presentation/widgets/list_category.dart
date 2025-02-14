import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/home/presentation/screens/product_screen.dart';

class ListCategory extends StatelessWidget {
  const ListCategory({
    super.key,
  });

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
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return ProductScreen(
              //       productList: context.read<HomeCubit>().categoryList,
              //       category: listCategory[index]["name"],
              //     );
              //   },
              // ));
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    listCategory[index]['icon'],
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${listCategory[index]['name']}',
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
    'name': 'Collections',
    'icon': Icons.collections,
  },
  {
    'name': 'Books',
    'icon': Icons.book,
  },
];
