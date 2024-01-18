<%@ page import="com.example.demo2.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Application</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    .container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      flex-wrap: wrap;
      gap: 30px;
      padding: 20px;
    }
    .form-container {
      width: 300px;
      min-height: 250px;
      background: #ffffff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    form {
      width: 100%;
      margin-bottom: 20px;
    }
    form input[type=text],
    form input[type=email],
    form input[type=number],
    form input[type=submit] {
      width: calc(100% - 20px);
      margin-bottom: 10px;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
    }
    form input[type=submit] {
      background-color: #5c6bc0;
      color: white;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    form input[type=submit]:hover {
      background-color: #3f51b5;
    }
    .result {
      width: 100%;
      text-align: center;
      padding: 10px;
      padding-left: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: #f9f9f9;
      min-height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
      word-wrap: break-word;
      overflow-x: auto;
    }
    h1 {
      color: #333;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form-container">
    <h1>User Information Form</h1>
    <form action="UserServlet" method="post">
      <input type="hidden" name="action" value="encode"/>
      Username: <input type="text" name="username"/><br/>
      Email: <input type="email" name="email"/><br/>
      Birth Year: <input type="number" name="birthYear"/><br/>
      Gender:
      <select name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select><br/>
      <input type="submit" value="Submit"/>
    </form>

    <div class="result" id="encodedResult">
      <% if (request.getAttribute("encodedUser") != null) { %>
      <textarea id="base64TextArea" readonly style="height: 50px; margin-top: 10px; width: 100%;">
            <%= request.getAttribute("encodedUser") %>
            </textarea>
      <button onclick="copyToClipboard()">Copy</button>
      <% } %>

    </div>
  </div>

  <div class="form-container">
    <h1>Decode Base64 String</h1>
    <form action="UserServlet" method="post">
      <input type="hidden" name="action" value="decode"/>
      Base64: <input type="text" name="base64"/><br/>
      <input type="submit" value="Decode"/>
    </form>

    <div class="result" id="decodedResult">
      <% if (request.getAttribute("user") != null) {
        User user = (User)request.getAttribute("user");
      %>
      Decoded User Information:<br/>
      Username: <%= user.getUsername() %><br/>
      Email: <%= user.getEmail() %><br/>
      Birth Year: <%= user.getBirthYear() %><br/>
      Gender: <%= user.getGender() %>
      <% } %>
    </div>
  </div>
</div>

<script>
  function copyToClipboard() {
    var copyText = document.getElementById("base64TextArea");
    copyText.select(); // Select the text field
    copyText.setSelectionRange(0, 99999); // For mobile devices

    // Create a new textarea element and give it the trimmed value of the original one
    var tempTextArea = document.createElement("textarea");
    tempTextArea.value = copyText.value.trim(); // Use trim() to remove whitespace
    document.body.appendChild(tempTextArea);

    tempTextArea.select(); // Select the text field
    document.execCommand("copy"); // Copy the text inside the text field
    document.body.removeChild(tempTextArea); // Remove the temporary element

    //alert("Copied the text: " + tempTextArea.value); // Alert the copied text
  }
</script>


</body>
</html>
