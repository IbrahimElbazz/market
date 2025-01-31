import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          return Column(
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
          );
        },
      ),
    );
  }
}

List listCategory = [
  {
    'name': 'Sports',
    'icon': Icons.sports,
  },
  {
    'name': 'Collections',
    'icon': Icons.collections,
  },
  {
    'name': 'Books',
    'icon': Icons.book,
  },
  {
    'name': 'Games',
    'icon': Icons.games,
  },
  {
    'name': 'Sports',
    'icon': Icons.sports,
  },
  {
    'name': 'Collections',
    'icon': Icons.collections,
  },
  {
    'name': 'Books',
    'icon': Icons.book,
  },
  {
    'name': 'Games',
    'icon': Icons.games,
  },
];
