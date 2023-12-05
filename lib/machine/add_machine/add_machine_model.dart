import '/flutter_flow/flutter_flow_util.dart';
import 'add_machine_widget.dart' show AddMachineWidget;
import 'package:flutter/material.dart';

class AddMachineModel extends FlutterFlowModel<AddMachineWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
