import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/product_details/presentation/screens/product_details.dart';

class SearchDelegateScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final productList = context.read<HomeCubit>().productList;
    final result = productList
        .where((element) =>
            element.productName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: result.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetails(
                      data: result[index],
                    );
                  },
                ),
              );
            },
            child: ProductCard(
              dataProduct: GetProductResponse(
                imageUrl: result[index].imageUrl,
                productName: result[index].productName,
                salary: result[index].salary,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
