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
import 'package:huawei_awareness/constants/param.dart';

class BarrierDeleteRequest {
  String _type;
  String _barrierKey;

  BarrierDeleteRequest.all() {
    _type = Param.deleteAll;
  }

  BarrierDeleteRequest.withLabel({@required String barrierLabel}) {
    _type = Param.withLabel;
    _barrierKey = barrierLabel;
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        Param.deleteType: _type == null ? null : _type,
        Param.barrierKey: _barrierKey == null ? null : _barrierKey,
      };
}
