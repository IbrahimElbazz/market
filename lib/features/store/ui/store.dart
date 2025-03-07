import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/home/logic/cubit/home_state.dart';
import 'package:market/features/product_details/presentation/screens/product_details.dart';
import 'package:market/features/search/presentation/screens/search_delegate.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    context.read<HomeCubit>().getPurchase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                  hint: 'search now ',
                  iconButton: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
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
                      current is loadingDeleteFavorite ||
                      current is loadingGetPurchase ||
                      current is SuccessGetPurchase ||
                      current is ErrorGetPurchase;
                },
                buildWhen: (previous, current) {
                  return current is loadingGetPurchase ||
                      current is SuccessGetPurchase ||
                      current is ErrorGetPurchase;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loadingGetPurchase: () {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    },
                    errorGetPurchase: (errorMessage) {
                      return Text(errorMessage);
                    },
                    successGetPurchase: (data) {
                      return data.isEmpty
                          ? SizedBox(
                              height: 100.h,
                              child: Center(
                                child: Text(
                                  'not fount Purchase !!!',
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
                              itemCount: data.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProductDetails(
                                            data: data[index].productes!,
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
                                              .checkFavorite(data[index]
                                                  .productes!
                                                  .productId
                                                  .toString())) {
                                            context
                                                .read<HomeCubit>()
                                                .deleteFavorite(
                                                  data[index]
                                                      .productes!
                                                      .productId
                                                      .toString(),
                                                );
                                          } else {
                                            context
                                                .read<HomeCubit>()
                                                .addFavorite(
                                                  data[index]
                                                      .productes!
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
                                                    data[index]
                                                        .productes!
                                                        .productId
                                                        .toString(),
                                                  )
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                  dataProduct: data[index].productes!,
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
