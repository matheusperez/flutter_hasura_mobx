import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hello_wold_hasura/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(BotToastInit(child: ModularApp(module: AppModule())));
