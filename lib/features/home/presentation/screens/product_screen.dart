// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:market/core/widgets/product_card.dart';
// import 'package:market/features/home/logic/cubit/home_cubit.dart';
// import 'package:market/features/product_details/presentation/screens/product_details.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen(
//       {super.key, required this.productList, required this.category});
//   final List productList;
//   final String category;

//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   void initState() {
//     context.read<HomeCubit>().getProducts(widget.category);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('product name '),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: widget.productList.length,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return ProductDetails(
//                             data: widget.productList[index],
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   child: ProductCard(
//                     dataProduct: widget.productList[index],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
