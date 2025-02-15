import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/favorite/logic/cubit/fav_cubit.dart';
import 'package:market/features/favorite/logic/cubit/fav_state.dart';
import 'package:market/features/home/logic/cubit/home_cubit.dart';
import 'package:market/features/home/logic/cubit/home_state.dart';
import 'package:market/features/product_details/presentation/screens/product_details.dart';

class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  void initState() {
    context.read<FavCubit>().getFavorite();
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
              Text(
                'Your Favorite products',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const GapH(height: 10),
              BlocBuilder<FavCubit, FavState>(
                buildWhen: (previous, current) {
                  return current is ErrorGetVaf ||
                      current is LoadingGetVaf ||
                      current is SuccessGetVaf;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loadingGetVaf: () {
                      return SizedBox(
                        height: 350.h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      );
                    },
                    errorGetVaf: (errorMessage) {
                      return Text(errorMessage);
                    },
                    successGetVaf: (getProductResponse) {
                      return getProductResponse.isEmpty
                          ? SizedBox(
                              height: 350.h,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'not found favorite...!',
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
                                            data: getProductResponse[index]
                                                .productes,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  icon: BlocConsumer<HomeCubit, HomeState>(
                                    listener: (context, state) {
                                      state.maybeWhen(
                                        orElse: () {},
                                        successDeleteFavorite: () {
                                          context
                                              .read<FavCubit>()
                                              .getFavorite();
                                          return ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Center(
                                                  child:
                                                      Text('deleted favorite')),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        successAddFavorite: () {
                                          context
                                              .read<FavCubit>()
                                              .getFavorite();
                                          return ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Center(
                                                  child:
                                                      Text('added favorite')),
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
                                    builder: (context, state) {
                                      return IconButton(
                                        onPressed: () {
                                          if (context
                                              .read<HomeCubit>()
                                              .checkFavorite(
                                                  getProductResponse[index]
                                                      .productes
                                                      .productId
                                                      .toString())) {
                                            context
                                                .read<HomeCubit>()
                                                .deleteFavorite(
                                                  getProductResponse[index]
                                                      .productes
                                                      .productId
                                                      .toString(),
                                                );
                                          } else {
                                            context
                                                .read<HomeCubit>()
                                                .addFavorite(
                                                  getProductResponse[index]
                                                      .productes
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
                                                        .productes
                                                        .productId
                                                        .toString(),
                                                  )
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                  dataProduct:
                                      getProductResponse[index].productes,
                                ),
                              ),
                            );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
