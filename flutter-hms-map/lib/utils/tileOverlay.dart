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

import 'package:huawei_map/components/components.dart';
import 'package:huawei_map/utils/toJson.dart';

Map<TileOverlayId, TileOverlay> tileOverlayToMap(
    Iterable<TileOverlay> tileOverlays) {
  if (tileOverlays == null) {
    return <TileOverlayId, TileOverlay>{};
  }
  return Map<TileOverlayId, TileOverlay>.fromEntries(tileOverlays.map(
      (TileOverlay tileOverlay) => MapEntry<TileOverlayId, TileOverlay>(
          tileOverlay.tileOverlayId, tileOverlay.clone())));
}

List<Map<String, dynamic>> tileOverlayToList(Set<TileOverlay> tileOverlays) {
  if (tileOverlays == null) return null;

  return tileOverlays
      .map<Map<String, dynamic>>((TileOverlay t) => tileOverlayToJson(t))
      .toList();
}
