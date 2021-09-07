#!/usr/bin/bash

# Copyright (c) 2021. Huawei Technologies Co.,Ltd.ALL rights reserved.
# This program is licensed under Mulan PSL v2.
# You can use it according to the terms and conditions of the Mulan PSL v2.
#          http://license.coscl.org.cn/MulanPSL2
# THIS PROGRAM IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
# MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
# See the Mulan PSL v2 for more details.

# #############################################
# @Author    :   Classicriver_jia
# @Contact   :   classicriver_jia@foxmail.com
# @Date      :   2020.5.8
# @License   :   Mulan PSL v2
# @Desc      :   Module operation
# ############################################

source ${OET_PATH}/libs/locallibs/common_lib.sh

function run_test() {
    LOG_INFO "Start executing testcase."
    modprobe raid0
    CHECK_RESULT $?
    lsmod | grep raid0
    CHECK_RESULT $?
    modprobe -r raid0
    lsmod | grep raid0
    CHECK_RESULT $? 1
    LOG_INFO "End of testcase execution."
}

main $@
