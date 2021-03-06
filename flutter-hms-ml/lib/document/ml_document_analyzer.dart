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

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:huawei_ml/document/ml_document_analyzer_setting.dart';
import 'package:huawei_ml/models/ml_document.dart';
import 'package:huawei_ml/utils/channels.dart';

class MLDocumentAnalyzer {
  final MethodChannel _channel = Channels.documentAnalyzerMethodChannel;

  Future<MLDocument> asyncAnalyzeFrame(
      MLDocumentAnalyzerSetting setting) async {
    return new MLDocument.fromJson(json.decode(
        await _channel.invokeMethod("asyncDocumentAnalyze", setting.toMap())));
  }

  Future<bool> closeDocumentAnalyzer() async {
    return await _channel.invokeMethod("close");
  }

  Future<bool> stopDocumentAnalyzer() async {
    return await _channel.invokeMethod("stop");
  }
}
