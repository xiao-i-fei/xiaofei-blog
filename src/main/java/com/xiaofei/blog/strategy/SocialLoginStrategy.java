package com.xiaofei.blog.strategy;

import com.xiaofei.blog.dto.UserInfoDTO;

/**
 * 第三方登录策略
 *
 * @author 李飞
 * Date 2021/07/28
 */
public interface SocialLoginStrategy {

    /**
     * 登录
     *
     * @param data 数据
     * @return {@link UserInfoDTO} 用户信息
     */
    UserInfoDTO login(String data);

}
