import 'dart:io';

import 'package:bwa_flutix/bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:bwa_flutix/shared/shared.dart';
import 'package:bwa_flutix/ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'wrapper.dart';
part 'welcome_page.dart';
part 'main_page.dart';
part 'sign_in_page.dart';
part 'movies_page.dart';
part 'sign_up_page.dart';
part 'preference_page.dart';
part 'account_confirmation_page.dart';
part 'movie_detail_page.dart';
