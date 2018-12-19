import 'package:fluro/fluro.dart';
import 'package:codelabs/Basic/TextField/textField_page.dart';
import 'package:codelabs/Basic/Form/form_page.dart';
import 'package:codelabs/Layout/RowColumn/row_column_page.dart';
import 'package:codelabs/Layout/Flex/flex_page.dart';
import 'package:codelabs/Layout/Flow/wrap_page.dart';
import 'package:codelabs/Layout/Flow/flow_page.dart';
import 'package:codelabs/Layout/Stack/stack_page.dart';
import 'package:codelabs/Layout/Container/padding_page.dart';
import 'package:codelabs/Layout/Container/box_page.dart';
import 'package:codelabs/Layout/Container/decoratedBox_page.dart';
import 'package:codelabs/Layout/Container/transform_page.dart';
import 'package:codelabs/Layout/Container/container_page.dart';
import 'package:codelabs/Scroll/SingleChildScrollView/singleChild_scrollView_page.dart';
import 'package:codelabs/Scroll/ListView/listView_page.dart';
import 'package:codelabs/Scroll/GridView/gridView_page.dart';
import 'package:codelabs/Scroll/CustomScrollView/customScrollView_page.dart';
import 'package:codelabs/Scroll/ScrollController/scrollController_page.dart';
import 'package:codelabs/Scroll/NotificationListener/notificationListener_page.dart';
import 'package:codelabs/Functional/willPopScope_page.dart';
import 'package:codelabs/Functional/inheritedWidget_page.dart';
import 'package:codelabs/Functional/themeData_page.dart';

class RouterDefineHandler {
  static final scheme = 'lxfapp';
  static final router = Router();

  RouterDefineHandler.init() {
    _register();
  }

  void _register() {
    // Basic
    router.define(fetchRoute('TextField'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return TextFieldPage();
    }));

    router.define(fetchRoute('Form'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return FormPage();
    }));

    // Layout
    router.define(fetchRoute('RowColumn'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return RowColumnPage();
    }));

    router.define(fetchRoute('FlexExpanded'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return FlexExpandedPage();
    }));

    router.define(fetchRoute('Wrap'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return WrapPage();
    }));

    router.define(fetchRoute('Flow'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return FlowPage();
    }));

    router.define(fetchRoute('Stack'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return StackPage();
    }));

    router.define(fetchRoute('Padding'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return PaddingPage();
    }));

    router.define(fetchRoute('Box'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return BoxPage();
    }));

    router.define(fetchRoute('DecoratedBox'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return DecoreatedBoxPage();
    }));

    router.define(fetchRoute('Transform'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return TransformPage();
    }));

    router.define(fetchRoute('Container'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return ContainerPage();
    }));

    // Scroll
    router.define(fetchRoute('SingleChildScrollView'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return SingleChildScrollViewPage();
    }));

    router.define(fetchRoute('ListView'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return ListViewPage();
    }));

    router.define(fetchRoute('GridView'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return GridViewPage();
    }));

    router.define(fetchRoute('CustomScrollView'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return CustomScrollViewPage();
    }));

    router.define(fetchRoute('ScrollController'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return ScrollControllerPage();
    }));

    router.define(fetchRoute('NotificationListener'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return NotificationListenerPage();
    }));

    // Functional
    router.define(fetchRoute('WillPopScope'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return WillPopScopePage();
    }));

    router.define(fetchRoute('InheritedWidget'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return InheritedWidgetPage();
    }));

    router.define(fetchRoute('ThemeData'),
        handler: Handler(handlerFunc: (context, Map<String, dynamic> params) {
      return ThemeDataPage();
    }));
  }

  static String fetchRoute(String path) {
    return RouterDefineHandler.scheme + '://' + path;
  }
}
