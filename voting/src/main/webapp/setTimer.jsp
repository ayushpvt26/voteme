<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h2>Set Timer for Page Access</h2>
    <form action="TimeCon" method="post">
        <input type="hidden" name="action" value="setTimer">
        <label for="duration">Enter time in minutes:</label>
        <input type="number" id="duration" name="duration" min="1" required>
        <button type="submit">Set Timer</button>
    </form>
</body>
</html>