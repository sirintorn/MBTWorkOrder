import '/flutter_flow/flutter_flow_util.dart';
import '/home_and_menu/main_menu/main_menu_widget.dart';
import 'work_order_management_widget.dart' show WorkOrderManagementWidget;
import 'package:flutter/material.dart';

class WorkOrderManagementModel
    extends FlutterFlowModel<WorkOrderManagementWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainMenu component.
  late MainMenuModel mainMenuModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainMenuModel = createModel(context, () => MainMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainMenuModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
