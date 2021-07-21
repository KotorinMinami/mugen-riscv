#!/usr/bin/bash

# Copyright (c) 2021 Huawei Technologies Co.,Ltd.ALL rights reserved.
# This program is licensed under Mulan PSL v2.
# You can use it according to the terms and conditions of the Mulan PSL v2.
#          http://license.coscl.org.cn/MulanPSL2
# THIS PROGRAM IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
# MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
# See the Mulan PSL v2 for more details.

# #############################################
# @Author    :   lutianxiong
# @Contact   :   lutianxiong@huawei.com
# @Date      :   2021-01-10
# @License   :   Mulan PSL v2
# @Desc      :   skopeo test
# ############################################

source "$OET_PATH/libs/locallibs/common_lib.sh"

function pre_test() {
    DNF_INSTALL skopeo
}

function run_test() {
    for ((i = 0; i < 10; i++)); do
        if skopeo list-tags --tls-verify=false docker://docker.io/nginx; then
            flag_result=1
            break
        fi
        sleep 1
    done
    CHECK_RESULT $flag_result 1
    flag_result=0
    for ((i = 0; i < 10; i++)); do
        if skopeo inspect --tls-verify=false docker://docker.io/nginx; then
            flag_result=1
            break
        fi
        sleep 1
    done
    CHECK_RESULT $flag_result 1
}
function post_test() {
    DNF_REMOVE
}
main $@
