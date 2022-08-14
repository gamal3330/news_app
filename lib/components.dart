import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit2.dart';
import 'package:news_app/web_view.dart';

Widget buildArticleItem(list, context) => InkWell(
      onTap: () {
        navigateTo(context, Webview(list['url']));
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                      '${list['urlToImage']}',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${list['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      list['publishedAt'],
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget buildConditional(List list, {isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    fallback: (context) => isSearch
        ? Container(
            child: Center(
              child: Text(
                'بحث',
                style: TextStyle(
                    fontSize: 18.0,
                    color: AppCubit.get(context).isDark
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator()),
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return buildArticleItem(list[index], context);
      },
      separatorBuilder: (context, index) => Divider(
        height: 10.0,
        color: Colors.grey,
      ),
      itemCount: list.length,
    ),
  );
}

Widget defaultTextFormF(
        {required Widget labelText,
        required Widget prefixIcon,
        required TextEditingController cont,
        required TextInputType type,
        FormFieldValidator<String>? validate,
        FormFieldValidator<String>? value}) =>
    TextFormField(
      onChanged: value,
      validator: validate,
      keyboardType: type,
      controller: cont,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: labelText,
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
