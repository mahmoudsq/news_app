import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/componants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  final TextEditingController searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultFormField(
                  controller:searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search,
                  validate: (value) {
                    if(value!.isEmpty) {
                      return 'Search must not empty';
                    }else{
                      return null;
                    }
                  },
                  onChange: (value) {
                    cubit.getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildArticleItem(cubit.search[index],context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: cubit.search.length),
              )
            ],
          ),
        );
      },
    );
  }
}
