package cn.edu.hbpu.nil.service;

import cn.edu.hbpu.nil.entity.Friend;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hbpu
 * @since 2022-07-18
 */
public interface FriendService extends IService<Friend> {
    List<Friend> getContactsByGroupIndex(int uid, int groupIndex);
}
