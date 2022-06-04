package com.xiaofei.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaofei.blog.dto.OperationLogDTO;
import com.xiaofei.blog.entity.OperationLog;
import com.xiaofei.blog.vo.ConditionVO;
import com.xiaofei.blog.vo.PageResult;

/**
 * 操作日志服务
 *
 * @author 李飞
 * Date 2021/07/29
 */
public interface OperationLogService extends IService<OperationLog> {

    /**
     * 查询日志列表
     *
     * @param conditionVO 条件
     * @return 日志列表
     */
    PageResult<OperationLogDTO> listOperationLogs(ConditionVO conditionVO);

}
