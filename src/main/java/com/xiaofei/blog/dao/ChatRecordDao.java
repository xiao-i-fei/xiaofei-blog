package com.xiaofei.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaofei.blog.entity.ChatRecord;
import org.springframework.stereotype.Repository;

/**
 * 聊天记录
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Repository
public interface ChatRecordDao extends BaseMapper<ChatRecord> {
}
