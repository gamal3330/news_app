import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormF(
                  value: (value) {
                    NewsCubit.get(context).getSearch(value!);
                  },
                  labelText: Text('بحث'),
                  prefixIcon: Icon(Icons.search),
                  cont: searchController,
                  type: TextInputType.text,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter The Value';
                    }
                    return null;
                  },
                  
                ),
              ),
              Expanded(
                child: buildConditional(list ,isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
