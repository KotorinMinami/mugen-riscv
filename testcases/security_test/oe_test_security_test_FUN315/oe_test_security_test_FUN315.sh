#!/usr/bin/bash

# Copyright (c) 2021. Huawei Technologies Co.,Ltd.ALL rights reserved.
# This program is licensed under Mulan PSL v2.
# You can use it according to the terms and conditions of the Mulan PSL v2.
#          http://license.coscl.org.cn/MulanPSL2
# THIS PROGRAM IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
# EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
# MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
# See the Mulan PSL v2 for more details.
####################################
#@Author    	:   Jevons
#@Contact   	:   1557927445@qq.com
#@Date      	:   2021-05-19 09:39:43
#@License   	:   Mulan PSL v2
#@Desc      	:   validity of file execution permission
#####################################

source ${OET_PATH}/libs/locallibs/common_lib.sh

function pre_test()
{
    LOG_INFO "Start to prepare the test environment."
    
    touch /tmp/test.txt

    LOG_INFO "End to prepare the test environment."
}
function run_test()
{
    LOG_INFO "Start to run test."
    
    chmod 700 /tmp/test.txt
    CHECK_RESULT $? 0 0 "chmod failed"
    useradd tester
    CHECK_RESULT $? 0 0 "add failed"
    su - tester -c "cat /tmp/test.txt" 
    CHECK_RESULT $? 1 0 "cat failed"

    LOG_INFO "End to run test."
}

function post_test()
{
    LOG_INFO "Start to restore the test environment."
    
    rm -rf /tmp/test.txt
    userdel -rf tester
    
    LOG_INFO "End to restore the test environment."
}

main "$@"
