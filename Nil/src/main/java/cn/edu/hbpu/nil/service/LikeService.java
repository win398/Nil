package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.Like;

import java.util.List;

public interface LikeService {
    boolean likeDynamic(Long userId, Long dynamicId);
    boolean cancelLike(Long userId, Long dynamicId);
    boolean isLikeDynamic(Long userId, Long dynamicId);
    List<Like> getLikeList(Long dynamicId);
}
