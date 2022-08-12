import 'package:flutter/material.dart';
import 'package:tuterritorio/core/const.dart';
import 'package:tuterritorio/core/presentation/widgets/text_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  final double radius = 25;
  final String textSearch = "Buscar..";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [
          const BoxShadow(color: Colors.grey, spreadRadius: 0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: DARK_GRAY,
                ),
                const SizedBox(
                  width: 5,
                ),
                TextGrey(
                  text: textSearch,
                  fontSize: NORMAL_SIZE_TEXT,
                )
              ],
            ),
            Icon(
              Icons.filter_list_rounded,
              color: DARK_GRAY,
            )
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectTag = 0;
  List<String> tags = [
    "Todas las categorias",
    "Vivienda",
    "Seguridad",
    "Deporte",
    "Espacio publicos"
  ];
  List<String> avatarURL = [
    "",
    "assets/images/casa.png",
    "assets/images/guard.png",
    "assets/images/triangulo.png",
    "assets/images/edificio.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(5, (index) {
        return Padding(
          padding: index == 0
              ? EdgeInsets.only(right: 5)
              : EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: (() {
              setState(() {
                selectTag = index;
              });
            }),
            child: CategoryWidget(
              removeAvatar: index == 0 ? true : false,
              isPainted: index == selectTag,
              avatarURL: avatarURL[index],
              text: tags[index],
            ),
          ),
        );
      })),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {Key? key,
      this.isPainted = false,
      this.removeAvatar = false,
      required this.text,
      required this.avatarURL})
      : super(key: key);
  final bool isPainted;
  final bool removeAvatar;
  final String text;
  final String avatarURL;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: removeAvatar
          ? null
          : CircleAvatar(
              backgroundImage: AssetImage(avatarURL),
            ),
      label: Text(
        text,
        style: TextStyle(
            color: isPainted ? Colors.white : DARK_GRAY,
            fontSize: SMALL_SIZE_TEXT),
      ),
      side: isPainted
          ? BorderSide(width: 0.6, color: PRIMARY_COLOR)
          : BorderSide(width: 0.6, color: DARK_GRAY),
      backgroundColor: isPainted ? PRIMARY_COLOR : Colors.white,
    );
  }
}
