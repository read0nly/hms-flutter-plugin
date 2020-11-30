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

Map<CircleId, Circle> circleToMap(Iterable<Circle> circles) {
  if (circles == null) return <CircleId, Circle>{};

  return Map<CircleId, Circle>.fromEntries(circles.map((Circle circle) =>
      MapEntry<CircleId, Circle>(circle.circleId, circle.clone())));
}

List<Map<String, dynamic>> circleToList(Set<Circle> circles) {
  if (circles == null) return null;

  return circles
      .map<Map<String, dynamic>>((Circle c) => circleToJson(c))
      .toList();
}
