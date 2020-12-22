# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2020 The PixelExperience Project
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

# inherit Moto Z2 play device config
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_albus.mk

COMMON_LUNCH_CHOICES := \
    aosp_albus-user \
    aosp_albus-userdebug \
    aosp_albus-eng
