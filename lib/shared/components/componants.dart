
import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
 /*   navigateTo(
      context,
      WebViewScreen(article['url']),
    );*/
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
      ],
    ),
  ),
);

Widget defaultFormField(
    {required TextEditingController controller,
      required TextInputType type,
      ValueChanged<String>? onSubmit,
      ValueChanged<String>? onChange,
      GestureTapCallback? onTap,
      bool isPassword = false,
      required FormFieldValidator<String> validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      Function? suffixPress,
      bool isClickable = true}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(prefix),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,MaterialPageRoute(builder: (context) => widget,)
);