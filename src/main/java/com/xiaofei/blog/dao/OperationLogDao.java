package com.xiaofei.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaofei.blog.entity.OperationLog;
import org.springframework.stereotype.Repository;


/**
 * 操作日志
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Repository
public interface OperationLogDao extends BaseMapper<OperationLog> {
}
