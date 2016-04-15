//
//  PLRegular.h
//  PLTP_I_Integration
//
//  Created by jiaoxt on 15/2/5.
//  Copyright (c) 2015年 中交兴路车联网. All rights reserved.
//

/**
 *  @brief                  判断手机号是否合法的正则表达式
 */
#define REG_STRING_PHONE                @"^1[34578][0-9]{9}$"
#define REG_STRING_COMMPANY             @"^[a-zA-Z\\(\\（\\)\\）\\_\\.\\,\\-\\－\\&\u4e00-\u9fa5]{2,30}$"
#define REG_STRING_USER_NAME            @"^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$"
#define REG_STRING_COMMPANY_NAME        @"^[a-zA-Z0-9\u4e00-\u9fa5]{2,30}$"
#define REG_STRING_COMMPANY_ADDRESS     @"^[a-zA-Z0-9\u4E00-\u9FA5]{1,60}$"
#define REG_STRING_BANK_NUM             @"[0-9]{16,19}"
#define REG_STRING_ID                   @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"
#define REG_STRING_PASSWORD             @"^[0-9]*$"