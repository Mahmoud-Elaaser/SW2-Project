
import 'package:e_markting/features/dashboard/controller/dashboard_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          DashboardCubit cubit = context.read<DashboardCubit>();
          return Scaffold(
    appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 157, 51, 79),
  actions: [ 
    IconButton(
      onPressed: () {
        Navigator.pushNamed(context, 'new_product');
       },
       icon: const Icon(CupertinoIcons.plus),
        ),
       ],
      ),

             
            body: PageView(
              
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              
              children: const [
                
                ProductPage(),
                FavoritePage(),
                UserPage(),
                CartPage()
              //  Text('cart'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color.fromARGB(255, 9, 2, 90),
              backgroundColor:Color.fromARGB(255, 157, 51, 79),
              currentIndex: cubit.currentIndex,
              onTap: cubit.onChangeTab,
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: 'product',  backgroundColor: Color.fromARGB(255, 157, 51, 79)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'favorite',  backgroundColor: Color.fromARGB(255, 157, 51, 79)),
              //  BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'user'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'user',  backgroundColor: Color.fromARGB(255, 157, 51, 79)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart), label: 'cart' , backgroundColor: Color.fromARGB(255, 157, 51, 79))
              ],
            ) ,
          );
        },
      ),
    );
  }
}
