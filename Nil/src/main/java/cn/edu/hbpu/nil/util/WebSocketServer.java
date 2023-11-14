package cn.edu.hbpu.nil.util;

import cn.edu.hbpu.nil.entity.Converse;
import cn.edu.hbpu.nil.entity.Friend;
import cn.edu.hbpu.nil.entity.User;
import cn.edu.hbpu.nil.mapper.UserMapper;
import cn.edu.hbpu.nil.service.ConverseService;
import cn.edu.hbpu.nil.service.FriendService;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.springframework.stereotype.Component;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;


@Component
@ServerEndpoint("/websocket/{mAccount}") // 客户端URI访问的路径
public class WebSocketServer {
    //concurrent包的线程安全Set，用来存放每个客户端对应的WebSocket对象。
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<>();
    private Session mSession; // 与客户端连接的会话，用于发送数据
    private String mAccount; // 客户端的标识(这里以账户编号)

    public static CopyOnWriteArraySet<WebSocketServer> getWebSocketSet() {
        return webSocketSet;
    }

    public String getmAccount() {
        return mAccount;
    }

    private static final String CHAT_MESSAGE = "chatMsg";
    private static final String SYSTEM_TIP = "tip";
    public static final String VER_MESSAGE = "verMsg";
    public static final String VER_AGREED = "verAgreed";
    public static final String RECEIVED_MSG = "received_msg";
    @OnOpen
    public void onOpen(Session session, @PathParam("mAccount") String mAccount){
        mSession = session;
        webSocketSet.add(this); // 将回话保存
        this.mAccount = mAccount;
        try {
            List<String> list = new ArrayList<>();
            list.add(SYSTEM_TIP);
            list.add("conn_success");
            String json  = JSONUtil.toJsonStr(list);
            sendMessage(json);
        } catch (IOException e) {
            System.out.println("webSocket IO Exception");
        }
    }

    @OnClose
    public void onClose(){
        webSocketSet.remove(this);
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @Param message 客户端发送过来的消息
     */
    private static final ConverseService converseService =  SpringContextHolder.getBean(ConverseService.class); //关键点2
    private static final UserMapper userMapper =  SpringContextHolder.getBean(UserMapper.class); //关键点2
    private static final FriendService friendService =  SpringContextHolder.getBean(FriendService.class); //关键点2
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println(("收到来自客户端" + mAccount + " 的信息:" + message));
        List<String> data = JSONUtil.toList(message, String.class);
        //下标0存操作类型  下标1存对象数据(如果该操作有)
        String operation = data.get(0);
        switch (operation) {
            case CHAT_MESSAGE:
                String json = data.get(1);
                Converse converse = JSONUtil.toBean(json, Converse.class);
                converse.setSendTime(LocalDateTime.now());
                //保存消息
                //1已发送 2未发送
                converse.setMsgState(2);
                converseService.save(converse);
                // 群发消息
                HashSet<String> accounts = new HashSet<>();
                //查询发送方头像和用户名
                User user = userMapper.getUserByAccount(converse.getSendAccount());
                if (user != null) {
                    converse.setSenderHeader(user.getHeader());
                    converse.setSenderName(user.getUserName());
                }
                //接收方给发送方设置的备注
                User receiverUser = userMapper.getUserByAccount(converse.getReceiveAccount());
                if (user != null) {
                    QueryWrapper<Friend> friendQueryWrapper = new QueryWrapper<>();
                    friendQueryWrapper.eq("userId", receiverUser.getUid()).eq("contactId", user.getUid());
                    Friend friend = friendService.getOne(friendQueryWrapper);
                    if (friend != null) {
                        converse.setNameMem(friend.getNameMem());
                    }
                }
                accounts.add(converse.getReceiveAccount());

                String jsonCon = JSONUtil.toJsonStr(converse);
                List<String> list  = new ArrayList<>();
                list.add(CHAT_MESSAGE);
                list.add(jsonCon);
                //将要发送的消息封装为json
                String jsonTo = JSONUtil.toJsonStr(list);
                try {
                    sendMessage(jsonTo, accounts);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case RECEIVED_MSG:
                int msgId = Integer.parseInt(data.get(1));
                UpdateWrapper<Converse> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("msgId", msgId).set("msgState", 1);
                converseService.update(updateWrapper);
                break;
        }


    }
    /**
     * 发生错误回调
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println((session.getBasicRemote() + "客户端发生错误"));
        error.printStackTrace();
    }

    /**
     * 发自定义消息 同意发送List<String>通过下标0的标识判断发送的什么消息
     */
    public static void sendMessage(String msg, HashSet<String> toAccounts) throws IOException {
        System.out.println(("推送消息到客户端 " + toAccounts + "，推送内容:" + msg));
        for (WebSocketServer item : webSocketSet) {
            try {
                //这里可以设定只推送给传入的sid，为null则全部推送
                if (toAccounts.size() <= 0) {
                    item.sendMessage(msg);
                } else if (toAccounts.contains(item.mAccount)) {
                    item.sendMessage(msg);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 实现服务器主动推送消息到 指定客户端
     */
    public void sendMessage(String message) throws IOException {
        this.mSession.getBasicRemote().sendText(message);
    }

}
