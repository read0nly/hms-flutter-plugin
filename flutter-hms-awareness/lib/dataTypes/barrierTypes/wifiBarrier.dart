/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'dart:convert' show json;
import 'package:flutter/foundation.dart' show required;
import 'package:huawei_awareness/hmsAwarenessLibrary.dart'
    show AwarenessBarrier;
import 'package:huawei_awareness/constants/param.dart';

class WiFiBarrier extends AwarenessBarrier {
  String barrierLabel;
  int wifiStatus;
  String bssid;
  String ssid;

  WiFiBarrier.keeping({
    @required this.barrierLabel,
    @required this.wifiStatus,
    this.bssid,
    this.ssid,
  }) : super(
          barrierEventType: Param.wifiBarrierReceiverAction,
          barrierType: Param.wifiKeepingBarrier,
          barrierLabel: barrierLabel,
        );

  WiFiBarrier.connecting({
    @required this.barrierLabel,
    this.bssid,
    this.ssid,
  }) : super(
          barrierEventType: Param.wifiBarrierReceiverAction,
          barrierType: Param.wifiConnectingBarrier,
          barrierLabel: barrierLabel,
        ) {
    wifiStatus = null;
  }

  WiFiBarrier.disconnecting({
    @required this.barrierLabel,
    this.bssid,
    this.ssid,
  }) : super(
          barrierEventType: Param.wifiBarrierReceiverAction,
          barrierType: Param.wifiDisconnectingBarrier,
          barrierLabel: barrierLabel,
        ) {
    wifiStatus = null;
  }

  WiFiBarrier.enabling({
    @required this.barrierLabel,
  }) : super(
          barrierEventType: Param.wifiBarrierReceiverAction,
          barrierType: Param.wifiEnablingBarrier,
          barrierLabel: barrierLabel,
        ) {
    wifiStatus = null;
    bssid = null;
    ssid = null;
  }

  WiFiBarrier.disabling({
    @required this.barrierLabel,
  }) : super(
          barrierEventType: Param.wifiBarrierReceiverAction,
          barrierType: Param.wifiDisabling,
          barrierLabel: barrierLabel,
        ) {
    wifiStatus = null;
    bssid = null;
    ssid = null;
  }

  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        Param.barrierEventType:
            barrierEventType == null ? null : barrierEventType,
        Param.barrierType: barrierType == null ? null : barrierType,
        Param.barrierLabel: barrierLabel == null ? null : barrierLabel,
        Param.wifiStatus: wifiStatus == null ? null : wifiStatus,
        Param.bssid: bssid == null ? null : bssid,
        Param.ssid: ssid == null ? null : ssid,
      };
}
