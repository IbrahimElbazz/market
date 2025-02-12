import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/cached_network_image.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/features/home/data/models/get_product_response.dart';
import 'package:market/features/product_details/data/models/rates/add_rate_request_model.dart';
import 'package:market/features/product_details/data/models/rates/update_rate_request_model.dart';
import 'package:market/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:market/features/product_details/logic/cubit/product_details_state.dart';
import 'package:market/features/product_details/presentation/screens/comments_screen.dart';
import 'package:market/features/product_details/presentation/widgets/comment_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.data});
  final GetProductResponse data;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    context
        .read<ProductDetailsCubit>()
        .getProductDetailsRate(widget.data.productId.toString());

    super.initState();
  }

  TextEditingController addCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "${widget.data.productName}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Container(
              width: 380.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    errorAddRate: (errorMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text(errorMessage),
                          ),
                        ),
                      );
                    },
                    successAddRate: () {
                      context.read<ProductDetailsCubit>().getProductDetailsRate(
                          widget.data.productId.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text('add rate done'),
                          ),
                        ),
                      );
                    },
                    errorUpdateRate: (errorMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text(errorMessage),
                          ),
                        ),
                      );
                    },
                    successUpdateRate: () {
                      context.read<ProductDetailsCubit>().getProductDetailsRate(
                          widget.data.productId.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text('update rate done'),
                          ),
                        ),
                      );
                    },
                    loadingAddComments: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.blue,
                          ));
                        },
                      );
                    },
                    successAddComments: () {
                      Navigator.pop(context);
                      addCommentController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text('add comment success'),
                          ),
                        ),
                      );
                    },
                    errorAddComments: (errorMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Center(
                            child: Text(errorMessage),
                          ),
                        ),
                      );
                    },
                  );
                },
                listenWhen: (previous, current) {
                  return current is ErrorAddRate ||
                      current is LoadingAddRate ||
                      current is SuccessAddRate ||
                      current is SuccessUpdateRate ||
                      current is ErrorUpdateRate ||
                      current is LoadingUpdateRate ||
                      current is LoadingAddComments ||
                      current is SuccessAddComments ||
                      current is ErrorAddComments;
                },
                buildWhen: (previous, current) {
                  return current is LoadingGetProductDetailsRate ||
                      current is SuccessGetProductDetailsRate ||
                      current is ErrorGetProductDetailsRate ||
                      current is SuccessUpdateRate ||
                      current is ErrorUpdateRate ||
                      current is LoadingUpdateRate;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    successGetProductDetailsRate: (productDetails) {
                      var cub = context.read<ProductDetailsCubit>();
                      return Column(
                        children: [
                          const GapH(height: 50),
                          CachedImage(
                            imageUrl: "${widget.data.imageUrl}",
                          ),
                          const GapH(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${widget.data.productName}",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.data.salary} EL",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const GapH(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cub.avgRate.toString().substring(0, 3),
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const GapW(width: 5),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const GapH(height: 30),
                          Row(
                            children: [
                              const GapW(width: 20),
                              Text(
                                'rete :',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const GapH(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                initialRating: cub.avgUserRate,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  if (cub.avgUserRate == 0) {
                                    context
                                        .read<ProductDetailsCubit>()
                                        .addRate(AddRateRequestModel(
                                          rate: rating.toInt(),
                                          forProductId: widget.data.productId,
                                          forUserId: Supabase.instance.client
                                              .auth.currentUser!.id,
                                        ));
                                  } else {
                                    context
                                        .read<ProductDetailsCubit>()
                                        .updateRate(
                                          UpdateRateRequestModel(
                                            rate: rating.toInt(),
                                          ),
                                          Supabase.instance.client.auth
                                              .currentUser!.id,
                                          widget.data.productId.toString(),
                                        );
                                  }
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0.w,
                              vertical: 22.h,
                            ),
                            child: CustomTextField(
                              controller: addCommentController,
                              hint: 'Type your feed back',
                              iconButton: IconButton(
                                onPressed: () {
                                  cub.addComment(
                                    productId: widget.data.productId.toString(),
                                    comment: addCommentController.text,
                                  );
                                },
                                icon: const Icon(Icons.send),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const GapW(width: 20),
                              Text(
                                'comments :',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const GapH(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return CommentsScreen(
                                    productId: widget.data.productId.toString(),
                                  );
                                },
                              ));
                            },
                            child: Container(
                              width: 300.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.blue.withOpacity(0.5),
                              ),
                              child: Center(
                                child: Text(
                                  'Comments Page',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const GapH(
                            height: 40,
                          ),
                        ],
                      );
                    },
                    loadingGetProductDetailsRate: () {
                      return Container(
                        width: 380.w,
                        height: 600.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      );
                    },
                    errorGetProductDetailsRate: (errorMessage) {
                      return Container(
                          width: 380.w,
                          height: 600.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(child: Text(errorMessage)));
                    },
                  );
                },
              ),
            ),
          ),
        )),
      ),
    );
  }
}
