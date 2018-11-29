import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

Future<String> getApiKey() async {
  final String config = await rootBundle.loadString('config.yaml');
  final dynamic doc = loadYaml(config);
  return doc['apiKey'];
}
