import 'dart:convert';
import 'dart:io';

import 'package:dudu/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'talent_services.dart';
part 'user_transactions_services.dart';
part 'talent_transactions_services.dart';

String baseURL = 'https://staging.dudu.co.id/api/';
