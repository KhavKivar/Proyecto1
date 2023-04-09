import 'package:flutter/material.dart';
import 'package:tuterritorio/core/plataform/builder_app_data.dart';
import 'package:tuterritorio/core/theme/strings_app.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';

class FilterBySortData extends BuilderAppData {
  OrderBy orderValue;
  FilterBySortData(
      {required associatedDataOnUI,
      required nameOnUI,
      this.orderValue = OrderBy.trending})
      : super(nameOnUI, associatedDataOnUI);
}

class FilterByCategoryData extends BuilderAppData {
  Categories categoryValue;
  FilterByCategoryData(
      {required nameOnUI,
      required associatedDataOnUI,
      this.categoryValue = Categories.all})
      : super(nameOnUI, associatedDataOnUI);
}

List<FilterBySortData> sortDataBuilder = [
  FilterBySortData(
      nameOnUI: textTrending,
      associatedDataOnUI: Icons.trending_up,
      orderValue: OrderBy.trending),
  FilterBySortData(
      nameOnUI: textPopular,
      associatedDataOnUI: Icons.thumb_up,
      orderValue: OrderBy.popular),
  FilterBySortData(
      nameOnUI: textmostCommented,
      associatedDataOnUI: Icons.chat,
      orderValue: OrderBy.mostCommented),
  FilterBySortData(
      nameOnUI: textNews,
      associatedDataOnUI: Icons.schedule,
      orderValue: OrderBy.news),
];

List<FilterByCategoryData> categoriesDataBuilder = [
  FilterByCategoryData(
      nameOnUI: textCategoryAll,
      associatedDataOnUI: "",
      categoryValue: Categories.all),
  FilterByCategoryData(
      nameOnUI: textCategoryHousing,
      associatedDataOnUI: "assets/images/casa.png",
      categoryValue: Categories.housing),
  FilterByCategoryData(
      nameOnUI: textCategorySecurity,
      associatedDataOnUI: "assets/images/guard.png",
      categoryValue: Categories.security),
  FilterByCategoryData(
      nameOnUI: textCategorySport,
      associatedDataOnUI: "assets/images/triangulo.png",
      categoryValue: Categories.sports),
  FilterByCategoryData(
      nameOnUI: textCategoryPublicSpace,
      associatedDataOnUI: "assets/images/edificio.png",
      categoryValue: Categories.publicSpace),
];
