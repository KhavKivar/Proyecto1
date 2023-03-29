import 'package:flutter/material.dart';
import 'package:tuterritorio/core/plataform/builder_app_data.dart';
import 'package:tuterritorio/features/submission/presentation/bloc/submission_bloc.dart';

const String textResetSettings = "Restablecer";
const String textMainTitle = "Filtros";
const String textSortSettings = "Ordenar";
const String textCategoriesSettings = "Categorias";

const double widthOrderChip = 100;
const String defaultCategoryValue = "Todas las categorias";
const String defaultOrderValue = "Trending";

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
      nameOnUI: "Trending",
      associatedDataOnUI: Icons.trending_up,
      orderValue: OrderBy.trending),
  FilterBySortData(
      nameOnUI: "Populares",
      associatedDataOnUI: Icons.thumb_up,
      orderValue: OrderBy.popular),
  FilterBySortData(
      nameOnUI: "Mas \n comentados",
      associatedDataOnUI: Icons.chat,
      orderValue: OrderBy.mostCommented),
  FilterBySortData(
      nameOnUI: "Nuevos",
      associatedDataOnUI: Icons.schedule,
      orderValue: OrderBy.news),
];

List<FilterByCategoryData> categoriesDataBuilder = [
  FilterByCategoryData(
      nameOnUI: "Todas las categorias",
      associatedDataOnUI: "",
      categoryValue: Categories.all),
  FilterByCategoryData(
      nameOnUI: "Vivienda",
      associatedDataOnUI: "assets/images/casa.png",
      categoryValue: Categories.housing),
  FilterByCategoryData(
      nameOnUI: "Seguridad",
      associatedDataOnUI: "assets/images/guard.png",
      categoryValue: Categories.security),
  FilterByCategoryData(
      nameOnUI: "Deporte",
      associatedDataOnUI: "assets/images/triangulo.png",
      categoryValue: Categories.sports),
  FilterByCategoryData(
      nameOnUI: "Espacio publicos",
      associatedDataOnUI: "assets/images/edificio.png",
      categoryValue: Categories.publicSpace),
];
