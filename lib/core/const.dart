import 'dart:ui';

import 'package:flutter/material.dart';

//URL PATH
const String localServer = "http://localhost:8080/api";
const String mobileLocalServer = "http://10.0.2.2:8080/api";

const String urlServer = mobileLocalServer;
const String getSubmissionUrl = urlServer + "/submission";

//COLORS
const SECONDARY_COLOR = Color(0xFF3E63F4);
const PRIMARY_COLOR = Color(0xFF3B3D56);

//DARK THEME
const SECONDARY_COLOR_DARK = Color(0xFF3E63F4);
const PRIMARY_COLOR_DARK = Color(0xFF3E63F4);

const ERROR_COLOR = Color(0xFFE96767);
const WARNING_COLOR = Color(0xFFFCA85A);

//Text Sizep
const double XLARGE_SIZE_TEXT = 35;
const double LARGE_SIZE_TEXT = 25;
const double MEDIUM_SIZE_TEXT = 18;
const double SMALL_SIZE_TEXT = 15;

//ROUTES
const routeHome = '/';
const routeSubmissionDetails = '/submission/details';
const routeSubmission = '/submission';
const routeSubmissionFilter = '/submission/filter';

//Padding
const double PADDING_HORIZONTAL = 20;
const double PADDING_VERTICAL = 10;
const double PADDING_DEFAULT = 8;
const double PADDING_DEFAULT_DIV_2 = 4;

//Border Size
const double BORDER_RADIUS_BIG = 25;
const double BORDER_RADIUS_MEDIUM = 15;
const double BORDER_RADIUS_MEDIUM_MIN = 10;
const double BORDER_RADIUS_SMALL = 5;

//Strings const

const String textLoading = "loading..";
const String textComment = "Comentarios";

// Elevation default
const double ELEVATION_DEFAULT = 5;
