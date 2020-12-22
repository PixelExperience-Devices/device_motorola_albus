#!/bin/bash
#
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.


if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
else
    MY_DIR="${BASH_SOURCE%/*}"
    if [ ! -d "${MY_DIR}" ]; then
        MY_DIR="${PWD}"
    fi
fi

set -e

# Required!
export DEVICE=albus
export DEVICE_COMMON=msm8953-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2017

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

AOSP_ROOT="$MY_DIR"/../../..

BLOB_ROOT="$AOSP_ROOT"/vendor/"${VENDOR}"/"${DEVICE}"/proprietary

readonly MMCAMERA=(
   vendor/lib/libmmcamera_vstab_module.so
   vendor/lib/libmmcamera2_stats_modules.so
)

for i in "${MMCAMERA[@]}"; do
  patchelf --remove-needed libandroid.so "$BLOB_ROOT"/${i}
done

# Load camera configs from vendor
CAMERA2_SENSOR_MODULES="$BLOB_ROOT"/vendor/lib/libmmcamera2_sensor_modules.so
sed -i "s|/system/etc/camera/|/vendor/etc/camera/|g" "$CAMERA2_SENSOR_MODULES"
