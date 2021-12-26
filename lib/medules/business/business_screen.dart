import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/componants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return state is! NewsGetBusinessLoadingState
            ? ListView.separated(
          physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildArticleItem(cubit.business[index],context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 10)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
