import 'package:tuterritorio/core/plataform/builder_app_data.dart';

const double widthContainer = 300;
const String defaultAvatarSrc = 'assets/images/avatar.png';
const String userName = "Lorem Isum";
const double avatarWidth = 30;
const double avatarHeight = 30;
const String defaultErrorTag = "todas las categorias";

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
