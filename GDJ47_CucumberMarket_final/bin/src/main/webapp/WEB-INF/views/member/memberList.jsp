<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
	<h1>회원리스트</h1>
	<div>
	<input id="memberNo"><button id="btnMember">회원정보 가져오기</button>
	</div>
	<div>
		<button id="btnMemberAll">전체 회원 가져오기</button>
	</div>
	<div id="dataContainer"></div>
	<script>
		document.getElementById("btnMember").addEventListener("click",
			e=>{
				const data=document.getElementById("memberNo").value;
				
				fetch("/member/"+data)
				.then((response)=>response.json())
				.then((data)=>{
					console.log(data);
					const table=document.createElement("table");
					const header=document.createElement("tr");
					header.innerHTML="<th>아이디</th><th>이름</th><th>나이</th>";
					table.appendChild(header);
					const content=document.createElement("tr");
					content.innerHTML=`<td>${data.userId}</td><td>${data.userName}</td><td>${data.age}</td>`;
					table.appendChild(content);
					document.querySelector("#dataContainer").appendChild(table);
				});
			});
		document.getElementById("btnMemberAll").addEventListener("click",e=>{
			fetch("/member/")
			.then(response=>response.json())
			.then(data=>{
				console.log(data);
				const ul=document.createElement("ul");
				data.forEach(v=>{
					let li=document.createElement("li");
					li.innerHTML=`${v.userId} ${v.userName} ${v.age} ${v.email}`;
					ul.appendChild(li);
				});
				document.querySelector("#dataContainer").appendChild(ul);
			})
		});
	</script>
</body>
</html>