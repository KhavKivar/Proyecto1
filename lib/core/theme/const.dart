import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//URL PATH
const String localServer = "http://localhost:8080/api";
const String mobileLocalServer = "http://10.0.2.2:8080/api";

const String ipServer = "http://192.168.1.85:8080/api";

const String urlServer = ipServer;

const String getSubmissionUrl = urlServer + "/submission";

//COLORS
const PRIMARY_COLOR = Color(0xFF3B3D56);
const SECONDARY_COLOR = Color(0xFF3E63F4);

const BACKGROUND_COLOR = Color(0xFFFFFFFF);
const SURFACE_COLOR = Color(0xFFFFFFFF);

//
const ERROR_COLOR = Color(0xFFE96767);
const WARNING_COLOR = Color(0xFFFCA85A);

//DARK THEME
const PRIMARY_COLOR_DARK = Color(0xFF121212);
const SECONDARY_COLOR_DARK = Color(0xFF3E63F4);

const BACKGROUND_COLOR_DARK = Color(0xFF121212);

const SURFACE_COLOR_DARK = Color(0xFF414141);

const TEXT_COLOR_DARK = Color(0xFFFFFFFF);
const TEXT_COLOR_SECONDARY_DARK = Color(0xFF3E63F4);

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

// Elevation default
const double ELEVATION_DEFAULT = 5;

// Avatar width
const double avatarWidth = 40;
const double avatarHeight = 40;

//Submission Card
double widthContainer = 300;
double heightSubmissionCard = 250;

const double avatarWidthMedium = 30;
const double avatarHeightMedium = 30;

const double heightTopTitleContainer = 45;
const double containerHeightValue = 45.0;

//Filter page const
const double widthOrderChip = 100;

//Submission Card details

double minExtendHeader = 250;

double heightSwitchContainer = 30;
double heightUserInfoContainer = 80;
