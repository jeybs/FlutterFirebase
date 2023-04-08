import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/models/contact_data/contact_data.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/pages/user_info/user_info_cubit.dart';
import 'package:flutter_firebase/ui/appbar/primary_appbar.dart';
import 'package:flutter_firebase/ui/loading_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class UserInfoPage extends StatefulWidget {

  final UserData userData;

  const UserInfoPage({Key? key, required this.userData}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  UserInfoCubit? cubit;
  bool isAdded = true;
  late ProgressDialog pd;
  UserData? userData;

  @override
  void initState() {
    pd = ProgressDialog(context, type: ProgressDialogType.normal ,isDismissible: false, showLogs: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar.getDefaultAppBar(context, ''),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: BlocProvider(
              create: (context) => UserInfoCubit(),
              child: BlocConsumer<UserInfoCubit, UserInfoState>(
                listener: (context, state) {
                  pd.hide();

                  if(state is IsUserAreadyAdded) {
                    isAdded = state.isAdded;
                  }

                  if(state is UserProfileLoaded) {
                    userData = state.userData;
                    if(userData!.uid != widget.userData.uid) {
                      cubit?.checkIfAlreadyAdded(widget.userData.uid);
                    } else {
                      isAdded = true;
                    }
                  }

                  if(state is UserAdded) {
                    if(state.isAdded) {
                      isAdded = true;
                      Fluttertoast.showToast(
                          msg: "Contact saved!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Can't save to contact.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
                },
                builder: (context, state) {
                  if(cubit == null) {
                    cubit = context.read<UserInfoCubit>();
                    cubit?.loadProfile();
                  }

                  return mainBody();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.0,
          height: 120.0,
          child: profileImage(),
        ),
        const SizedBox(height: 16.0),
        Text(
          widget.userData.name.toUpperCase(),
          style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          widget.userData.mobile,
          style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            actionButtons('assets/icon_message.png', 'Message', () {

            }),
            if(!isAdded) actionButtons('assets/icon_add_contact.png', 'Save', () {
              pd.style(
                  message: "Saving...",
                  progressWidget: const LoadingDialog());

              pd.show();

              cubit?.saveUserContact(widget.userData);
            }),
          ],
        )
      ],
    );
  }

  Widget profileImage() {
    if(widget.userData.photo.isNotEmpty) {
      return ExtendedImage.network(
        widget.userData.photo,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
        cache: true,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
      );
    } else {
      return ExtendedImage.asset(
        'assets/icon_profile_loading.jpg',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(60.0))
      );
    }
  }

  Widget actionButtons(String assetImage, String title, Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Image.asset(
            assetImage,
            width: 50.0,
            color: AppColor.primaryColor,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
