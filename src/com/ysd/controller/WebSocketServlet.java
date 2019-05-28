package com.ysd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.ysd.entity.Message;
import com.ysd.service.EmployeeServiceImp;
import com.ysd.service.MyThread;


@ServerEndpoint("/websocket/{name}")
public class WebSocketServlet {//WebSocket属于服务端推送技术，本质是一种应用层协议，可以实现持久连接的全双工双向通信。
	/*
	 * MyThread thread1=new MyThread(); Thread thread=new Thread(thread1);
	 */
    //用来存放每个客户端对应的MyWebSocket对象。
    private static Map<String, WebSocketServlet> map=new HashMap<>();
    private Session session=null;
	private String name;
	private static int count=0;
	EmployeeServiceImp employeeService=new EmployeeServiceImp();

	/*
	 * private static CopyOnWriteArraySet<WebSocketServlet> webSocketSet = new
	 * CopyOnWriteArraySet<WebSocketServlet>(); private javax.websocket.Session
	 * session=null;
	 */
    /**
     * @ClassName: onOpen   
     * @Description: 开启连接的操作
     */
    @OnOpen
    public void onOpen(@PathParam("name")String name,Session session) throws IOException{
		/*
		 * this.session=session; webSocketSet.add(this);
		 */
		this.session=session;
		this.name=name;
		map.put(name, this);
		count++;
        //开启一个线程对数据库中的数据进行轮询
		/* thread.start(); */

    }
   
    /**
     * @ClassName: onClose
     * @Description: 连接关闭的操作
     */
    @OnClose
    public void onClose(){
		/* thread1.stopMe(); */
		/* webSocketSet.remove(this); */
    	System.out.println("连接退出了");
		map.remove(name);
		count--;
    }
   
    /**
     * @ClassName: onMessage   
     * @Description: 给服务器发送消息告知数据库发生变化
     */
    @OnMessage
    public void onMessage(String message) {
		String[] split = message.split(",");
		String formName=split[0];
		String tomName=split[1];
		String content=split[2];
		if(map.containsKey(tomName)) {
			//李四在线
			map.get(tomName).session.getAsyncRemote().sendText("1");
			employeeService.insertMessage(message);
		}else {
			//离线消息
			employeeService.insertMessage(message);
		}
		
		
	}
	/*
	 * public void onMessage(String count) { try { String[] strs; //定义一数组
	 * strs=count.split(","); //字符分割 if(strs.length>1) { tongXunMessage(count);
	 * }else { sendMessage(); }
	 * 
	 * 
	 * } catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } }
	 */
  /**
     * @ClassName: OnError
     * @Description: 出错的操作
     */
    @OnError
    public void onError(Throwable error){
        error.printStackTrace();
    }
    
    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @throws IOException
     * 发送自定义信号，“1”表示告诉前台，数据库发生改变了，需要刷新
     */
	
	/*
	 * public void sendMessage() throws IOException{ //群发消息 for(WebSocketServlet
	 * item: webSocketSet){ //WebSocket session发送文本消息有两个方法：
	 * //getAsyncRemote()和getBasicRemote()， //这两个方法我只是简单了解了一下，前者是异步发送消息，后者是同步发送消息。
	 * //也就是说getBasicRemote()要等上一条消息发送完才能发送下一条消息。
	 * item.session.getBasicRemote().sendText("1"); } }
	 */
	 
	/*
	 * public void tongXunMessage(String i) throws IOException {
	 * 
	 * for(WebSocketServlet item: webSocketSet){
	 * item.session.getBasicRemote().sendText(i); } }
	 */
}
