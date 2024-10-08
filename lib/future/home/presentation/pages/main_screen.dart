import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_flutter_project/core/components/loading_widget.dart';
import 'package:template_flutter_project/core/components/my_app_bar.dart';
import 'package:template_flutter_project/core/components/my_contianer_shape.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/services/notification_service.dart';
import 'package:template_flutter_project/core/utils/app_helpers.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_bloc/home_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(CheckUpdateAppEvent(context));
    NotificationService.init();
    NotificationService.requestIOSPermissions();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        if (notification.title != null) {
          NotificationService.showNotification(
            id: notification.hashCode,
            title: notification.title ?? "",
            body: notification.body ?? "",
            urlImage: notification.android?.imageUrl,
          );
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Tamplate Project'),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is FailureData) {
            AppHelpers.showSnackBar(context,
                message: state.message, error: true);
          }
        },
        builder: (context, state) {
          if (state is LoadingData) {
            return const LoadingWidget();
          }
          if (state is FailureData) {
            return Center(
              child: MyText(title: state.message),
            );
          }
          List<UserModel> users = context.read<HomeBloc>().users;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return MyContainerShape(
                enableRadius: true,
                borderRadius: 16,
                marginBottom: 15,
                paddingHorizontal: 15,
                paddingVertical: 15,
                child: MyText(title: users[index].username ?? ""),
              );
            },
          );
        },
      ),
    );
  }
}
