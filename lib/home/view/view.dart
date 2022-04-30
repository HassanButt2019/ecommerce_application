import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/categories/view/category_list.dart';
import 'package:fluttertask/constants/constant_colors.dart';
import 'package:fluttertask/constants/constant_paths.dart';
import 'package:fluttertask/constants/navigator.dart';
import 'package:fluttertask/home/bloc/bloc.dart';
import 'package:fluttertask/home/bloc/events/events.dart';
import 'package:fluttertask/home/bloc/states/states.dart';
import 'package:fluttertask/home/repository/home_repository.dart';
import 'package:fluttertask/shared-widgets/clickable_text.dart';
import 'package:fluttertask/shared-widgets/shared_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'home_screen.dart';