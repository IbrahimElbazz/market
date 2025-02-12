import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:market/features/product_details/logic/cubit/product_details_state.dart';
import 'package:market/features/product_details/presentation/widgets/comment_card.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key, required this.productId});
  final String productId;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    context
        .read<ProductDetailsCubit>()
        .getComments(productId: widget.productId);

    super.initState();
  }

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
        title: const Text(
          "comments",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: Container(
              width: 380.w,
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen: (previous, current) {
                  return current is SuccessGetComments ||
                      current is ErrorGetComments ||
                      current is LoadingGetComments;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Container();
                    },
                    successGetComments: (getCommentsResponse) {
                      return ListView.builder(
                        itemCount: getCommentsResponse.isNotEmpty
                            ? getCommentsResponse.length
                            : 1,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return getCommentsResponse.isNotEmpty
                              ? CommentCard(
                                  name: getCommentsResponse[index].user_name ??
                                      "",
                                  comment:
                                      getCommentsResponse[index].comment ?? "",
                                  replay:
                                      getCommentsResponse[index].replay ?? "",
                                )
                              : const Text('No comment');
                        },
                      );
                    },
                    loadingGetComments: () {
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
                    errorGetComments: (errorMessage) {
                      return Text(errorMessage);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
