package com.xiaofei.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaofei.blog.entity.Message;
import org.springframework.stereotype.Repository;


/**
 * 留言
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Repository
public interface MessageDao extends BaseMapper<Message> {

}
