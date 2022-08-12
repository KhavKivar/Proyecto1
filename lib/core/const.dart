import 'dart:ui';

import 'package:flutter/cupertino.dart';

//URL PATH
const String localServer = "http://localhost:3000";
const String mobileLocalServer = "http://10.0.2.2:3000";

const String urlServer = mobileLocalServer;
const String getSubmissionUrl = urlServer + "/submissions";

//COLORS
const PRIMARY_COLOR = Color(0xFF3E63F4);
const ERROR_COLOR = Color(0xFFE96767);
const WARNING_COLOR = Color(0xFFFCA85A);
const DARK_GRAY = Color(0xFF3B3D56);

//TextSize

const double LARGE_SIZE_TEXT = 25;
const double NORMAL_SIZE_TEXT = 18;
const double SMALL_SIZE_TEXT = 15;

//ROUTES
const routeHome = '/';
const routeSubmissionDetails = '/submission/details';
const routeSubmission = '/submission';

//Padding
const double PADDING_HORIZONTAL = 20;
const double PADDING_VERTICAL = 10;

const double BORDER_RADIUS_BIG = 25;
const double BORDER_RADIUS_NORMAL = 15;
const double BORDER_RADIUS_SMALL = 5;
