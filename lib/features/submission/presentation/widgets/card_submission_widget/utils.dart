import 'package:tuterritorio/core/plataform/builder_app_data.dart';

class TagDataBuilder extends BuilderAppData {
  TagDataBuilder(nameOnUI, associatedDataOnUI)
      : super(nameOnUI, associatedDataOnUI);
}

List<TagDataBuilder> tagDataBuilder = [
  TagDataBuilder("todas las categorias", ""),
  TagDataBuilder(
    "vivienda",
    "assets/images/casa.png",
  ),
  TagDataBuilder(
    "seguridad",
    "assets/images/guard.png",
  ),
  TagDataBuilder(
    "deporte",
    "assets/images/triangulo.png",
  ),
  TagDataBuilder(
    "espacios publicos",
    "assets/images/edificio.png",
  ),
];
