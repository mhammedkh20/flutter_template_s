// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template_flutter_project/core/utils/app_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class RemoteConfigService {
  String appStoreUrl = '<رابط التطبيق على متجر App Store>';
  String playStoreUrl = '<رابط التطبيق على متجر Google Play>';

  Future<bool> requestUpdateApplication() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionCode = packageInfo.buildNumber;
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();

    String minimumAppVersionAndroid =
        remoteConfig.getString('minimum_app_version_android');

    String minimumAppVersionIos =
        remoteConfig.getString('minimum_app_version_ios');
    log('minimum_app_version_ios $minimumAppVersionIos');
    log('minimum_app_version_android $minimumAppVersionAndroid');
    if (Platform.isAndroid) {
      return versionCode == minimumAppVersionAndroid;
    } else {
      return versionCode == minimumAppVersionIos;
    }
  }

  Future<bool> checkOurAppForUpdate(BuildContext context) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('check').get();

    bool uploadingApp = querySnapshot.docs[0].get('uploadingApp');

    bool checkAppVersion = await requestUpdateApplication();

    if (checkAppVersion) {
      // ? PASS
      return false;
    } else {
      if (uploadingApp) {
        // ? PASS
        return false;
      } else {
        AppDialogs.updateApplication(
          context,
          onTap: () {
            if (Platform.isAndroid) {
              openPlayStore();
            } else {
              openAppStore();
            }
          },
        );
        return true;
      }
    }
  }

  void openAppStore() async {
    if (!await launchUrl(Uri.parse(appStoreUrl))) {
      throw Exception('Could not launch $appStoreUrl');
    }
  }

  void openPlayStore() async {
    if (!await launchUrl(Uri.parse(playStoreUrl))) {
      throw Exception('Could not launch $playStoreUrl');
    }
  }
}
