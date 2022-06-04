package com.xiaofei.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaofei.blog.dto.FriendLinkBackDTO;
import com.xiaofei.blog.dto.FriendLinkDTO;
import com.xiaofei.blog.entity.FriendLink;
import com.xiaofei.blog.vo.ConditionVO;
import com.xiaofei.blog.vo.FriendLinkVO;
import com.xiaofei.blog.vo.PageResult;

import java.util.List;

/**
 * 友链服务
 *
 * @author 李飞
 * Date 2021/07/29
 */
public interface FriendLinkService extends IService<FriendLink> {

    /**
     * 查看友链列表
     *
     * @return 友链列表
     */
    List<FriendLinkDTO> listFriendLinks();

    /**
     * 查看后台友链列表
     *
     * @param condition 条件
     * @return 友链列表
     */
    PageResult<FriendLinkBackDTO> listFriendLinkDTO(ConditionVO condition);

    /**
     * 保存或更新友链
     *
     * @param friendLinkVO 友链
     */
    void saveOrUpdateFriendLink(FriendLinkVO friendLinkVO);

}
