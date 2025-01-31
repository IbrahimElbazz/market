import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/widgets/gap.dart';
import 'package:market/features/auth/get_user_data/logic/cubit/get_user_data_cubit.dart';
import 'package:market/features/auth/get_user_data/logic/cubit/get_user_data_state.dart';
import 'package:market/features/auth/logout/logic/cubit/logout_cubit.dart';
import 'package:market/features/auth/logout/presentation/screens/logout.dart';
import 'package:market/features/edit_profile/ui/screens/edit_profile.dart';
import 'package:market/features/my_order/ui/screens/my_order.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
      ],
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GetUserDataCubit, GetUserDataState>(
                buildWhen: (previous, current) {
                  return current is getUserDataLoading ||
                      current is GetUserDataError ||
                      current is GetUserDataSuccess;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    getUserDataLoading: () {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    },
                    getUserDataSuccess: () {
                      final cub =
                          context.read<GetUserDataCubit>().userDataModel;
                      return Container(
                        width: 380.w,
                        height: 450.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              const GapH(height: 50),
                              const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 40,
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const GapH(
                                height: 15,
                              ),
                              Text(
                                cub!.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                ),
                              ),
                              const GapH(
                                height: 5,
                              ),
                              Text(
                                cub.email,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                              const GapH(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const EditProfile();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const GapH(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const MyOrder();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'My order',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const GapH(
                                height: 15,
                              ),
                              const logout(),
                            ],
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
