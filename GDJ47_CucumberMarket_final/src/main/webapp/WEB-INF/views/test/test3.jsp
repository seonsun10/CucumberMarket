<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Spring Boot WebSocket Chat Application</title>
 
<style type="text/css">

#chatWrap {
    width: 600px;
    border: 1px solid #ddd;
}

#chatHeader {
    height: 60px;
    text-align: center;
    line-height: 60px;
    font-size: 25px;
    font-weight: 900;
    border-bottom: 1px solid #ddd;
}

#chatLog {
    height: 700px;
    overflow-y: auto;
    padding: 10px;
}

.myMsg {
    text-align: right;
}

.anotherMsg {
    text-align: left;
    margin-bottom: 5px;
}

.msg {
    display: inline-block;
    border-radius: 15px;
    padding: 7px 15px;
    margin-bottom: 10px;
    margin-top: 5px;

}

.anotherMsg > .msg {
    background-color: #f1f0f0;

}

.myMsg > .msg {
    background-color: #0084FF;
    color: #fff;
}
.myMsg > .check {
    
    color: #0084FF;
    font-size: 11px;
}

.anotherName {
    font-size: 16px;
    display: block;
}
.anotherTime {
    font-size: 12px;
     display: block;
}

#chatForm {
    display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
}

#message {
    width: 85%;
    height: calc(100% - 1px);
    border: none;
    padding-bottom: 0;
}

#message:focus {
    outline: none;
}

#chatForm > input[type=submit] {
    outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 17px;
}
    
</style>
</head>
<body>
  <div id="chatWrap">
            <div id="chatHeader">오이마켓 채팅방</div>
            
            <div id="chatLog">
            <c:if test="${not empty msg }">
           	 <c:forEach items="${msg }" var="dd">
           	 	<c:if test="${dd.userid ne loginMember.userId }">
	                <div class="anotherMsg">
	                    <span class="anotherName">${dd.userid }  </span>
	                    <span class="msg"><b>${dd.massage }</span>
	                    <span class="anotherTime"><fmt:formatDate value="${dd.senddate }" type="time"/></span>
	                </div>
	             </c:if>
                <c:if test="${dd.userid eq loginMember.userId }">
	                <div class="myMsg">
	                	<c:if test="${dd.unReadCount eq 1 }"> <span class='check'> 1 </span> </c:if>
	                    <span class="msg"><b> ${dd.massage } </span>
	                    <span class="anotherTime"><fmt:formatDate value="${dd.senddate }" type="time"/>  </span>
	                </div>  
                </c:if>
             </c:forEach>
            </c:if>
            </div>
            <form id="chatForm" >
                <input name ="kj" type="text"  autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
                <input type="submit" value="보내기" id="button-send"  ><!-- id="button-send" -->
            </form>
        </div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

</body>
</html>


<script>



$(document).ready(function(){
	$('body').scrollTop($('#chatWrap')[0].scrollHeight);
	$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
	$('#message').focus();

	const roomid='${room.roomId }';
	const id='${loginMember.userId}';
	var today= new Date();
	
	 

    var sockJs = new SockJS("/ws/chat");
    //1. SockJS를 내부에 들고있는 stomp를 내어줌
    var stomp = Stomp.over(sockJs);

    //2. connection이 맺어지면 실행
    stomp.connect({}, function (){
       console.log("STOMP Connection");
       stomp.subscribe("/sub/chat/room/"+roomid, function (chat) {
           var content = JSON.parse(chat.body);
		   var message = content.massage;
           var writer = content.userid;
           var str = '';
           const temp=$("#chatLog").html();
           if(writer=='${loginMember.userId}'){
           $("#chatLog").html(temp+"<div class='myMsg'><span class='msg'><b>"+ message + "</b></span><span class='anotherTime'><fmt:formatDate value="<%=new java.util.Date() %>" type="time"/></span></div>");
          
           }else{
           $("#chatLog").html(temp+"<div class='anotherMsg'><span class='anotherName'>"+writer+"</span><span class='msg'><b>"+ message + "</b></span><span class='anotherTime'><fmt:formatDate value="<%=new java.util.Date() %>" type="time"/></span></div>");   
           }
           
           
       });

       
       
        $("#button-send").on("click", function(e){
            var msg = document.getElementById("message");
            

            console.log('${room.otherId}' + ":" + msg.value);
            console.log(msg.value.length);
            
            if(msg.value.length!=0){
            	
            	 stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: '${room.roomId}', massage: msg.value, userid: '${loginMember.userId}'}));
            	 
                 msg.value = '';
            }else{
            	alert("메세지를 입력하세요");
            }
           
        }); 
      
        
        $("#button-send").keyup(function(){
			var msg = document.getElementById("message");
            

            console.log('${room.otherId}' + ":" + msg.value);
            console.log(msg.value.length);
            
            if(msg.value.length!=0){
            	 $('#chatLog').scrollTop($('#chatLog').scrollHeight);
            	 $('body').scrollTop($('#chatWrap')[0].scrollHeight);
            	 stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: '${room.roomId}', massage: msg.value, userid: '${loginMember.userId}'}));
            	  
                 msg.value = '';
            }else{
            	alert("메세지를 입력하세요");
            }
        	
        	
        	
        	
        });
        	
       
       

    });

      
    
    function sendMessage(event) {
        var msg = document.getElementById("message").value.trim();
        if(messageContent && stomp) {
            var MessageContent = {
                userid: '${room.otherId}',
                massage: messageContent,
                roodId: '${room.roomId}'
            };
            stomp.send("/pub/chat/message", {}, JSON.stringify(MessageContent));
            msg = '';
        }
        event.preventDefault();
    }
    
    
});

</script>