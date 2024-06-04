import 'package:bloc_showcase/src/model/home/res_home_model.dart';
import 'package:bloc_showcase/src/views/add_update_detail/bloc/add_update_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:bloc_showcase/src/constants/string_constants.dart';
import 'package:bloc_showcase/src/extension/gesture_extensions.dart';
import 'package:bloc_showcase/src/extension/scaffold_extensions.dart';
import 'package:bloc_showcase/src/utils/validation_utils.dart';
import 'package:bloc_showcase/src/widgets/text_widgets/text_widgets.dart';
import 'package:bloc_showcase/src/widgets/textfield_widgets/textfield_widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddUpdateDetailView extends StatefulWidget {
  final ResHomeModel model;

  const AddUpdateDetailView({
    super.key,
    required this.model,
  });

  @override
  State<AddUpdateDetailView> createState() => _AddUpdateDetailViewState();
}

class _AddUpdateDetailViewState extends State<AddUpdateDetailView> {
  GlobalKey<FormState> addUpdateFormKey = GlobalKey<FormState>();
  bool isValid = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void isValidData() {
    isValid = addUpdateFormKey.currentState?.validate() ?? false;
    setState(() {});
  }

  bool isEnable() {
    bool isOn = isValid && nameController.text.isNotEmpty && emailController.text.isNotEmpty;
    setState(() {});
    return isOn;
  }

  @override
  void initState() {
    super.initState();
    if ((widget.model.email ?? '').isNotEmpty) {
      nameController.text = widget.model.name ?? '';
      emailController.text = widget.model.email ?? '';
      phoneController.text = widget.model.phone != null ? (widget.model.phone ?? '').toString() : '';
      isValidData();
      isEnable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddUpdateBloc, AddUpdateState>(
      listener: (context, state) {
        if (state is AddUpdateClickSuccess) {
          GoRouter.of(context).pop(true);
        }
        if (state is AddUpdateClickFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: ColorConstants.red,
            content: Text('Already Exist'),
          ));
        }
      },
      child: Form(
        key: addUpdateFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Name
            TextFieldWidgets(
              controller: nameController,
              hintText: StringConstants.name,
              mandatory: true,
              mandatoryText: '*',
              inputFormatter: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                FilteringTextInputFormatter.singleLineFormatter,
                LengthLimitingTextInputFormatter(20),
              ],
              onChange: (value) {
                isValidData();
              },
              validate: (value) {
                return value.toString().validName();
              },
            ),
            const SizedBox(height: 10),

            ///Designation
            TextFieldWidgets(
              controller: emailController,
              hintText: StringConstants.email,
              mandatory: true,
              mandatoryText: '*',
              keyboardType: TextInputType.emailAddress,
              inputFormatter: [
                LengthLimitingTextInputFormatter(40),
              ],
              onChange: (value) {
                isValidData();
              },
              validate: (value) {
                return value.toString().validEmail();
              },
            ),
            const SizedBox(height: 10),

            ///Mobile
            TextFieldWidgets(
              controller: phoneController,
              hintText: StringConstants.phone,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(20),
              ],
              keyboardType: TextInputType.number,
              onChange: (value) {
                isValidData();
              },
              validate: (value) {
                return value.toString().validMobile();
              },
            ),
          ],
        ).bodyPadding().baseScaffold(
              title: StringConstants.addDetails,
              isBack: true,
              onTap: () {
                GoRouter.of(context).pop();
              },
              actions: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: TextWidgets(
                  text: StringConstants.save,
                  textColor: isEnable() ? ColorConstants.white : ColorConstants.grey600,
                ),
              ).onPressedWithHaptic(() async {
                // appState.storage.delete(key: AppConstants.userDetail);
                if (isEnable()) {
                  context.read<AddUpdateBloc>().add(AddUpdateClickEvent(
                        phone: phoneController.text.isNotEmpty ? int.parse(phoneController.text) : null,
                        email: emailController.text,
                        name: nameController.text,
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: ColorConstants.red,
                    content: Text('Error'),
                  ));
                }
              }),
            ),
      ),
    );
  }
}
