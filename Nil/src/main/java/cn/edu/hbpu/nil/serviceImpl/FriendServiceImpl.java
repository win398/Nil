package cn.edu.hbpu.nil.serviceImpl;

import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.mapper.FriendMapper;
import cn.edu.hbpu.nil.mapper.UserMapper;
import cn.edu.hbpu.nil.service.FriendService;
import cn.edu.hbpu.nil.util.WebSocketServer;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hbpu
 * @since 2022-07-18
 */
@Service
public class FriendServiceImpl extends ServiceImpl<FriendMapper, Friend> implements FriendService {
    @Resource
    private FriendMapper friendMapper;

    public List<Friend> getContactsByGroupIndex(int uid, int groupIndex) {
        List<Friend> list;
        Deque<Friend> deque = new ArrayDeque<>();

        if (groupIndex == 0) {
            //特别关心
            list = friendMapper.getFavorContacts(uid);
        } else {
            list = friendMapper.getContactsByGroupIndex(uid, groupIndex);
        }
        //好友为空
        if (list == null || list.isEmpty()) return new ArrayList<>();
        for (Friend friend : list) {
            //默认离线 满足在线逻辑则置为在线  且在线用户在列表前面
            friend.setState("离线");
            CopyOnWriteArraySet<WebSocketServer> webSocketSet = WebSocketServer.getWebSocketSet();
            for (WebSocketServer item : webSocketSet) {
                //好友正连接WebSocket，说明在线
                if (item.getmAccount().equals(friend.getUserNum())) {
                    friend.setState("在线");
                    deque.addFirst(friend);
                    break;
                }
            }
            if (friend.getState().equals("离线")) {
                deque.add(friend);
            }

            //处理null
            if (friend.getNameMem() == null) {
                friend.setNameMem("");
            }
        }

        return new ArrayList<>(deque);
    }
}
