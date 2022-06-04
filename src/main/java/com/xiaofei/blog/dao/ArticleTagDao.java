package com.xiaofei.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaofei.blog.entity.ArticleTag;
import org.springframework.stereotype.Repository;


/**
 * 文章标签
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Repository
public interface ArticleTagDao extends BaseMapper<ArticleTag> {

}
