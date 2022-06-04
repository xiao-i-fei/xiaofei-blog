package com.xiaofei.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaofei.blog.dao.ArticleTagDao;
import com.xiaofei.blog.entity.ArticleTag;
import com.xiaofei.blog.service.ArticleTagService;
import org.springframework.stereotype.Service;

/**
 * 文章标签服务
 *
 * @author 李飞
 * Date 2021/08/10
 */
@Service
public class ArticleTagServiceImpl extends ServiceImpl<ArticleTagDao, ArticleTag> implements ArticleTagService {

}
