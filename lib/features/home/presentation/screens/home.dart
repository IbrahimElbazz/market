import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/di/dependency_injection.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/home/logic/cubit/home_state.dart';
import 'package:market/features/home/presentation/widgets/list_category.dart';
import 'package:market/features/product_details/presentation/screens/product_details.dart';
import 'package:market/features/search/presentation/screens/search_delegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              const GapH(height: 20),
              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: SearchDelegateScreen(),
                  );
                },
                child: const CustomTextField(
                  enable: false,
                  hint: 'search now',
                  iconButton: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
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
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    successDeleteFavorite: () {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(child: Text('deleted favorite')),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    successAddFavorite: () {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(child: Text('added favorite')),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  );
                },
                listenWhen: (previous, current) {
                  return current is ErrorAddFavorite ||
                      current is SuccessAddFavorite ||
                      current is loadingAddFavorite ||
                      current is ErrorDeleteFavorite ||
                      current is SuccessDeleteFavorite ||
                      current is loadingDeleteFavorite;
                },
                buildWhen: (previous, current) {
                  return current is ErrorGetProduct ||
                      current is SuccessGetProduct ||
                      current is loadingGetProduct;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loadingGetProduct: () {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    },
                    errorGetProduct: (errorMessage) {
                      return Text(errorMessage);
                    },
                    successGetProduct: (getProductResponse) {
                      return getProductResponse.isEmpty
                          ? SizedBox(
                              height: 100.h,
                              child: Center(
                                child: Text(
                                  'not fount product !!!',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: getProductResponse.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProductDetails(
                                            data: getProductResponse[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  icon: BlocBuilder<HomeCubit, HomeState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        onPressed: () {
                                          if (context
                                              .read<HomeCubit>()
                                              .checkFavorite(
                                                  getProductResponse[index]
                                                      .productId
                                                      .toString())) {
                                            context
                                                .read<HomeCubit>()
                                                .deleteFavorite(
                                                  getProductResponse[index]
                                                      .productId
                                                      .toString(),
                                                );
                                          } else {
                                            context
                                                .read<HomeCubit>()
                                                .addFavorite(
                                                  getProductResponse[index]
                                                      .productId
                                                      .toString(),
                                                );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: context
                                                  .read<HomeCubit>()
                                                  .checkFavorite(
                                                    getProductResponse[index]
                                                        .productId
                                                        .toString(),
                                                  )
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                  dataProduct: getProductResponse[index],
                                ),
                              ),
                            );
                    },
                  );
                },
              ),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) {
                  return current is ErrorGetCategory ||
                      current is SuccessGetCategory ||
                      current is loadingGetCategory;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loadingGetCategory: () {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    },
                    errorGetCategory: (errorMessage) {
                      return Text(errorMessage);
                    },
                    successGetCategory: (getProductResponse) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getProductResponse.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductDetails(
                                      data: getProductResponse[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: ProductCard(
                              dataProduct: getProductResponse[index],
                            ),
                          ),
                        ),
                      );
                    },
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
