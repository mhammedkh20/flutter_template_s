import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_flutter_project/core/components/loading_widget.dart';
import 'package:template_flutter_project/core/components/my_app_bar.dart';
import 'package:template_flutter_project/core/components/my_text.dart';
import 'package:template_flutter_project/core/services/notification_service.dart';
import 'package:template_flutter_project/core/utils/app_helpers.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_cubit/home_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    HomeCubit.get(context).initHomeCubit(context);
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
            urlImage: notification.android == null
                ? null
                : notification.android!.imageUrl,
          );
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Tamplate Project',
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
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
          return SingleChildScrollView(
            child: HomeCubit.get(context).trems != null
                ? MyText(title: HomeCubit.get(context).trems!.data ?? "")
                : null,
          );
        },
      ),
    );
  }
}
