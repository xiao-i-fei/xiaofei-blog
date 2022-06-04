package com.xiaofei.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaofei.blog.entity.UserInfo;
import org.springframework.stereotype.Repository;


/**
 * 用户信息
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Repository
public interface UserInfoDao extends BaseMapper<UserInfo> {

}
