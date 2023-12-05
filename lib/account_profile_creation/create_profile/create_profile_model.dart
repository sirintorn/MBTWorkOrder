import '/account_profile_creation/edit_profile_component/edit_profile_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for editProfileComponent component.
  late EditProfileComponentModel editProfileComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editProfileComponentModel =
        createModel(context, () => EditProfileComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfileComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
