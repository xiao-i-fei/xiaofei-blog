package com.xiaofei.blog.strategy;

import com.xiaofei.blog.dto.ArticleSearchDTO;

import java.util.List;

/**
 * 搜索策略
 *
 * @author 李飞
 * Date 2021/07/27
 */
public interface SearchStrategy {

    /**
     * 搜索文章
     *
     * @param keywords 关键字
     * @return {@link List<ArticleSearchDTO>} 文章列表
     */
    List<ArticleSearchDTO> searchArticle(String keywords);

}
