// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/HomeCubit.dart';
import '../../Cubit/home_states.dart';
import '../utils/app_colors.dart';


class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child:BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context,HomeStates state){},
        builder: (BuildContext context,HomeStates state){
          var cubit=HomeCubit.get(context);
          return  Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
              // color: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                // backgroundColor: AppColors.white,
                type: BottomNavigationBarType.fixed,

                unselectedItemColor: AppColors.gray,
                selectedItemColor:  AppColors.gray,
                // activeColor: AppColors.amber,
                onTap: (index){
                  cubit.changeIndex(index);
                }, items:cubit.screenItems
            ),
          );
        },
      ),
    );
  }
}
