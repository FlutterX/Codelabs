import 'package:fluro/fluro.dart';
import 'package:codelabs/TextField/textField_page.dart';
import 'package:codelabs/Form/form_page.dart';

class RouterDefineHandler {
  static final scheme = 'lxfapp';
  static final router = Router();

  RouterDefineHandler.init() {
    _register();
  }

  void _register() {
    router.define(fetchRoute('TextField'), handler:  Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return TextFieldPage();
    }));

    router.define(fetchRoute('Form'), handler:  Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return FormPage();
    }));
  }

  static String fetchRoute(String path) {
    return RouterDefineHandler.scheme + '://' + path;
  }
}