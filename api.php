<?php
 
header("Content-Type:application/json");
include('connection.php');

if(isset($_GET['action']) && $_GET['action']!='')
{
	if($_GET['action'] == "login")
	{
		if ((isset($_GET['username']) && $_GET['username']!="") && (isset($_GET['password']) && $_GET['password']!="")) {
			$username = $_GET['username'];
			$password = $_GET['password'];
			$query = "SELECT * FROM `users` WHERE username='$username' AND password='$password'";
			$result = mysqli_query($con, $query);
			if ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$userData['id'] = $row['id'];
				$userData['username'] = $row['username'];
				$userData['password'] = $row['password'];
				$userData['name'] = $row['name'];
				$userData['cnic'] = $row['cnic'];

				$response["status"] = "true";
				$response["message"] = "User Details";
				$response["users"] = $userData;
			} else {
				$response["status"] = "true";
				$response["message"] = "Login failed";
			}
		}
		else{
			 $response["status"] = "false";
			$response["message"] = "No user(s) found!";
		}
	}
	else if($_GET['action'] == "get_all_users")
	{
		$query = "SELECT * FROM `users`";
		$result = mysqli_query($con, $query);
		$data = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$userData['id'] = $row['id'];
			$userData['username'] = $row['username'];
			$userData['password'] = $row['password'];
			$userData['name'] = $row['name'];
			$userData['cnic'] = $row['cnic'];
			
			$data[]=array("id"=>$row['id'],"name"=>$row['name'],"username"=>$row['username'],"password"=>$row['password'],"cnic"=>$row['cnic']);
		}

		$response["status"] = "true";
		$response["message"] = "Users Details";
		$response["users"] = $data;
	} 
	else if($_GET['action'] == "get_user")
	{
		if (isset($_GET['user_id']) && $_GET['user_id']!="") {
			$user_id = $_GET['user_id'];
			$query = "SELECT * FROM `users` WHERE id=$user_id";
			$result = mysqli_query($con, $query);
			if ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$userData['id'] = $row['id'];
				$userData['username'] = $row['username'];
				$userData['password'] = $row['password'];
				$userData['name'] = $row['name'];
				$userData['cnic'] = $row['cnic'];

				$response["status"] = "true";
				$response["message"] = "User Details";
				$response["users"] = $userData;
			} else {
				$response["status"] = "true";
				$response["message"] = "No user found";
			}
		}
		else{
			$response["status"] = "false";
			$response["message"] = "No user found";
		}
	}
	else 
	{
	}
} else {
	$response["status"] = "false";
	$response["message"] = "Action not provided";
}
echo json_encode($response); exit;
 
?>