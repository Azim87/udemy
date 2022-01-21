import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:udemy/domain/model/device_info.dart';

Future<DeviceInfo> getDeviceDetails() async {
  DeviceInfoPlugin? _infoPlugin;
  String name = 'Unknown';
  String identifier = 'Unknown';
  String version = 'Unknown';

  try {
    if (Platform.isAndroid) {
      var build = await _infoPlugin?.androidInfo;
      name = "${build?.brand} ${build?.model}";
      identifier = build?.androidId ?? "";
      version = build?.version.codename ?? "";
    } else if (Platform.isIOS) {
      var build = await _infoPlugin?.iosInfo;
      name = "${build?.name} ${build?.model}";
      identifier = build?.identifierForVendor ?? "";
      version = build?.systemVersion ?? "";
    }
  } on PlatformException catch (e) {
    return DeviceInfo(
      name: name,
      identifier: identifier,
      version: version,
    );
  }

  return DeviceInfo(
    name: name,
    identifier: identifier,
    version: version,
  );
}
