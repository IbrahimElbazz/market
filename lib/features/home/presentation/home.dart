import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/custom_text_field.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/core/widgets/product_card.dart';
import 'package:market/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:market/features/home/presentation/logic/cubit/home_state.dart';
import 'package:market/features/home/presentation/widgets/list_category.dart';

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
              const CustomTextField(
                enable: false,
                hint: 'search now ',
                iconButton: Icon(
                  Icons.search,
                  color: Colors.black,
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
              BlocBuilder<HomeCubit, HomeState>(
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
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getProductResponse.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductCard(
                            dataProduct: getProductResponse[index],
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
