import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:vpnplaylist/models/vpnconfig.dart';
import 'package:vpnplaylist/models/vpnstatus.dart';

class VpnEngine{
  static final String eventchannelvpnstage = "vpnstage";
  static final String eventchannelvpnstatus = "vpnstatus";
  static final String methodchannelvpncontrol = "vpncontrol";
//vpn connection stage snapshot
  static Stream<String> snapshotvpnstage() => EventChannel(eventchannelvpnstage).receiveBroadcastStream().cast();
 //vpn connection status snapshot
  static Stream<vpnstatus?> snapshotvpnstatus() =>EventChannel(eventchannelvpnstatus).receiveBroadcastStream().map((event) => vpnstatus.fromMap(jsonDecode(event))).cast();
static Future<void> startvpn(configvpn configvpn) async{
  return MethodChannel(methodchannelvpncontrol).invokeMethod(
"start",{
  "config" : configvpn.config,
  "country" : configvpn.country,
  "username" : configvpn.username,
  "password" : configvpn.password
}
  );
}

static Future<void> stopvpn() {
  return MethodChannel(methodchannelvpncontrol).invokeMethod("stop");

}
static Future<void> killswitchvpn() {
  return MethodChannel(methodchannelvpncontrol).invokeMethod("kill_switch");

}
static Future<void> Refreshstagenow() {
  return MethodChannel(methodchannelvpncontrol).invokeMethod("refresh");

}
static Future<String?> getstagenow() {
  return MethodChannel(methodchannelvpncontrol).invokeMethod("stage");


}

static Future<bool> isconnected() {
 return getstagenow().then((value) => value!.toLowerCase() == "connected");

}

// stages of Vpn connection

static const String vpnconnected = "connected";
static const String vpndisconnected = "disconnected";
static const String vpnwaiting = "wait_connection";
static const String authenticating = "authenticating";
static const String vpnreconnect = "reconnect";
static const String vpnnoconnection = "no_connection";
static const String vpnconnecting = "connecting";
static const String vpnprepared = "prepare";
static const String vpndenied = "denied";











}