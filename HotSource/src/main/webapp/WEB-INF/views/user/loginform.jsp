<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#15161D] h-screen flex items-center justify-center">

  <div class="flex w-[900px] h-[600px] bg-[#15161D] rounded-xl shadow-lg overflow-hidden">

    <!-- Left Image Panel -->
    <div class="w-3/5 h-full flex items-center justify-center bg-[#15161D]">
      <img src="/static/util/hotsourceLogo.png" alt="Logo" class="max-w-full max-h-full object-contain"/>
    </div>

    <!-- Right Login Panel -->
    <div class="w-2/5 p-10 flex flex-col justify-center text-white">
      <h2 class="text-3xl font-bold mb-2 text-left">Sign In</h2>
      <p class="text-sm text-gray-400 mb-6 text-left">to continue to <strong>HotSource</strong></p>

      <form id="loginForm" class="space-y-4">
        <input type="text" id= "user_email" name="user_email" placeholder="Email"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="password" id= "password" name="password" placeholder="Password"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="button" id="loginButton" value="Login"
               class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded cursor-pointer transition">
      </form>

      <div class="mt-1">
      	<p class="text-center text-sm text-gray-400 mt-1">
		  Don't have an account?
		  <a href="/main/user/registform"
		     class="text-blue-400 hover:text-blue-600 font-medium underline transition">
		    Sign up
		  </a>
		</p>
        <p class="text-center text-gray-400 text-sm mb-2">Or sign in with</p>

        <div class="flex flex-col space-y-3">
          <a href="javascript:login('google')"
             class="flex items-center justify-center w-full py-2 border border-gray-500 rounded text-white hover:bg-gray-700 transition">
            <img src="https://cdn.jsdelivr.net/npm/simple-icons@v8/icons/google.svg" class="w-5 h-5 mr-2" alt="Google">
            Google 로그인
          </a>

          <a href="javascript:login('kakao')"
             class="flex items-center justify-center w-full py-2 bg-yellow-300 text-black rounded hover:bg-yellow-400 transition">
            <img src="https://cdn.jsdelivr.net/npm/simple-icons@v8/icons/kakaotalk.svg" class="w-5 h-5 mr-2" alt="Kakao">
            카카오 로그인
          </a>

          <a href="javascript:login('naver')"
             class="flex items-center justify-center w-full py-2 bg-green-500 text-white rounded hover:bg-green-600 transition">
            <img src="https://cdn.jsdelivr.net/npm/simple-icons@v8/icons/naver.svg" class="w-5 h-5 mr-2" alt="Naver">
            네이버 로그인
          </a>
        </div>
      </div>
    </div>
  </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script type="text/javascript">
  
  function login(sns){
  	$.ajax({
  		url : "/main/user/" + sns + "/authurl",
  		type : "get",
  		success : function(result){
  			location.href=result; 
  		}
  	});
  }
  function loginAjax() {
    const user = {
      user_email: $("#user_email").val(),
      password: $("#password").val()
    };

    $.ajax({
      url: "/main/user/login",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(user),
      success: function(response) {
        if (response.success) {
          location.href = response.redirectUrl;
        }
      },
      error: function(xhr) {
        if (xhr.status === 401) {
          alert("아이디 또는 비밀번호가 잘못되었습니다.");
        } else {
          alert("알 수 없는 오류가 발생했습니다.");
        }
      }
    });
  }
	$(() => {
	  $("#loginButton").click(() => {
	    loginAjax();
	  });
	});
  
  </script>

</body>
</html>





