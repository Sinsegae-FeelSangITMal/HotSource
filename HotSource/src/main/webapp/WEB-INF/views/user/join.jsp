<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register Page</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-[#15161D] h-screen flex items-center justify-center">

  <div class="flex w-[900px] h-[700px] bg-[#15161D] rounded-xl shadow-lg overflow-hidden">

    <!-- Left Image Panel -->
    <div class="w-3/5 h-full flex items-center justify-center bg-[#15161D]">
      <img src="/static/util/hotsourceLogo.png" alt="Logo" class="max-w-full max-h-full object-contain"/>
    </div>

    <!-- Right Register Panel -->
    <div class="w-2/5 p-10 flex flex-col justify-center text-white">
      <h2 class="text-3xl font-bold mb-2 text-left">Sign Up</h2>
      <p class="text-sm text-gray-400 mb-6 text-left">Create your <strong>HotSource</strong> account</p>

      <form action="/main/user/regist" method="post" class="space-y-4">
        <input type="text" name="id" placeholder="User ID"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="password" name="password" placeholder="Password"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="text" name="user_name" placeholder="Full Name"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="email" name="user_email" placeholder="Email"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="text" name="user_nickname" placeholder="Nickname"
               class="w-full bg-[#1e1f26] border border-gray-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-400" required>

        <input type="submit" value="Register"
               class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded cursor-pointer transition">
      </form>

      <div class="mt-6 text-center text-sm text-gray-400">
        Already have an account?
        <a href="/main/user/login" class="text-blue-400 hover:underline">Login here</a>
      </div>
    </div>
  </div>

</body>
</html>
