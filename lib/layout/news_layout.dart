import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/medules/search/search_screen.dart';
import 'package:newsapp/shared/components/componants.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(onPressed: () {
                  navigateTo(context,SearchScreen());
                }, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit.changeAppMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (value) {
                cubit.changeIndex(value);
              },
            ),
          );
        },
      ),
    );
  }
}
