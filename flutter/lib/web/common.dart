import 'dart:js_util' as js_util;
// cycle imports, maybe we can improve this
import 'package:flutter_hbb/consts.dart';

final isAndroid_ = false;
final isIOS_ = false;
final isWindows_ = false;
final isMacOS_ = false;
final isLinux_ = false;
final isWeb_ = true;
final isWebDesktop_ = !js_util.callMethod(js_util.globalThis, 'isMobile', []);

final isDesktop_ = false;

String get screenInfo_ =>
    js_util.callMethod(js_util.globalThis, 'getByName', ['screen_info']);

final _localOs =
    js_util.callMethod(js_util.globalThis, 'getByName', ['local_os', '']);
final isWebOnWindows_ = _localOs == kPeerPlatformWindows;
final isWebOnLinux_ = _localOs == kPeerPlatformLinux;
final isWebOnMacOS_ = _localOs == kPeerPlatformMacOS;
