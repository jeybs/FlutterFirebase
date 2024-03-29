import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/config/routes.gr.dart';
import 'package:flutter_firebase/constant/app_color.dart';
import 'package:flutter_firebase/models/contact_data/contact.dart';
import 'package:flutter_firebase/models/message_room/message_room.dart';
import 'package:flutter_firebase/models/user_data/user_data.dart';
import 'package:flutter_firebase/pages/home/components/contact_list_component.dart';
import 'package:flutter_firebase/pages/home/components/message_list_component.dart';
import 'package:flutter_firebase/pages/home/home_cubit.dart';
import 'package:flutter_firebase/ui/appbar/home_appbar.dart';
import 'package:flutter_firebase/ui/contacts/contact_list_item.dart';
import 'package:flutter_firebase/ui/dialogs/search_dialog.dart';
import 'package:flutter_firebase/ui/home_drawer.dart';
import 'package:flutter_firebase/ui/loading_dialog.dart';
import 'package:flutter_firebase/ui/textfields/default_textfield.dart';
import 'package:flutter_firebase/ui/textfields/primary_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeCubit? cubit;
  UserData? _userData = null;
  late ProgressDialog pd;
  List<Contact> contactList = [];
  List<MessageRoom> messageRoomList = [];

  @override
  void initState() {
    pd = ProgressDialog(context, type: ProgressDialogType.normal ,isDismissible: false, showLogs: false);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: HomeAppbar.getDefaultAppBar(context, 'Contact List', () {
        showDialog(
            context: context,
            builder: (_context) => const SearchDialog()
        ).then((result) async {
          if(result != null) {

            if(result['email'] != null) {
              // pd.style(
              //     message: "Searching...",
              //     progressWidget: LoadingDialog());
              //
              // pd.show();
              cubit?.searchUserByEmail(result['email']);
            }
            
          }
        });
      }),
      drawer: HomeDrawer.drawer(context, _userData, cubit, (XFile? userImage) {
        if(userImage != null) {
          pd.style(
              message: "Uploading...",
              progressWidget: const LoadingDialog());

          pd.show();
          cubit?.uploadUserImage(userImage);
        }
      }),
      body: SafeArea(
        top: true,
        child: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {


              if(state is UserProfileLoaded) {
                setState(() {
                  _userData = state.userData;
                  cubit?.getContactList();
                  cubit?.getRooms();
                });
              }

              if(state is RoomsLoaded) {
                messageRoomList = state.messageRoomList;
              }
              
              if(state is UploadImageSuccess) {
                cubit?.updateUserProfilePhoto(state.path);
              } else if(state is UploadImageFail){
                pd.hide();
                showOkAlertDialog(
                    context: context,
                    title: "Upload Error",
                    message: "Cannot upload your image right now. kindly try again later");
              }

              if(state is UpdateUserProfilePhotoSuccess) {
                pd.hide();
                showOkAlertDialog(
                    context: context,
                    title: "Upload Success",
                    message: "Profile photo updated");
                cubit?.loadProfile();
              } else if(state is UpdateUserProfilePhotoFail) {
                pd.hide();
              }

              // Search user state
              if(state is SearchUserData) {
                if(state.userData != null) {
                  context.router.push(UserInfoRoute(userData: state.userData!));
                } else {
                  showOkAlertDialog(
                      context: context,
                      title: "Oops!",
                      message: "Email address not found");
                }
              }

              if(state is ContactListLoaded) {
                contactList = state.contactList;
              }

              if(state is UserLogout) {
                context.router.pushAndPopUntil(LoginRoute(), predicate: (_) => false);
              }
            },
            builder: (context, state) {
              if(cubit == null) {
                cubit = context.read<HomeCubit>();
                cubit?.loadProfile();
              }

              if(state is HomeInitial) {
                return loadingContainer();
              }

              return mainBody();
            },
          ),
        ),
      ),
    );
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextField(
            label: 'Search Conversation',
            onTextChanged: (value) {

            },
            isPasswordField: false,
            prefixIcon: Icon(Icons.search, color: AppColor.primaryColor,)
          ),
          // Start Contact shortcut
          if(contactList.isNotEmpty) Container(
            height: 110.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ContactListComponent(userData: _userData!, contactList: contactList),
          ),
          const SizedBox(height: 10.0),
          MessageListComponent(userData: _userData!, messageRoomList: messageRoomList)
          // End
        ],
      ),
    );
  }

  Widget loadingContainer() {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.height,
      child: Center(
        child: SpinKitRing(
          color: AppColor.primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
