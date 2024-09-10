<%@page import="electronic.distributor.model.RegisterModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f4f7f6;
        }
        .profile-container {
            margin-top: 50px;
        }
        .btn-color {
            background-color: teal;
        }
        .profile-card {
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-card h2 {
            margin-bottom: 20px;
        }
        .profile-info {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-photo {
            border-radius: 50%;
            width: 150px;
            border: 3px solid lime;
            height: 150px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-info label {
            font-weight: bold;
        }
        .logout-btn {
            margin-top: 20px;
            margin-right: 30px;
        }
        .update-btn {
            margin-top: 20px;
        }
        .edit-mode {
            display: none;
        }
        @media (max-width: 768px) {
            .profile-photo {
                width: 120px;
                height: 120px;
            }
        }
        .back-btn {
            margin-bottom: 0px;
            margin-top:20px;
            margin-right:20px;
        }
    </style>
</head>
<body>

    <%
    
    RegisterModel registermodel = (RegisterModel) session.getAttribute("userprofile");
    String imageURL = (String) session.getAttribute("userimageurl");
    %> 

    <div class="container profile-container">
        <div class="row justify-content-center">
            <div class="col-md-8">
               
               
                <div class="profile-card">
                    <h2 class="text-center">User Profile</h2>
                    <div class="profile-info">
                        <img src="<%= imageURL %>" class="profile-photo" alt="User Photo">
                        <div class="user-info">
                            <h4> <%= registermodel.getUserName() %></h4>
                            <p><%= registermodel.getEmail() %></p>
                        </div>
                        
                    </div>
                    <form id="profileForm" action="updateProfile" method="post">
                        <div class="form-group row">
                            <label for="fullName" class="col-sm-3 col-form-label">Full Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="fullName" name="userName" value="<%= registermodel.getUserName() %>" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" name="email" value="<%= registermodel.getEmail() %>" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="phone" class="col-sm-3 col-form-label">Phone</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="phone" name="contact" value="<%= registermodel.getContact() %>" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-sm-3 col-form-label">Address</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="address" name="address" value="<%= registermodel.getAddress() %>" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="joinedDate" class="col-sm-3 col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="joinedDate" name="password" value="<%= registermodel.getPassword() %>" readonly>
                                <input type="hidden" class="form-control" id="joinedDate" name="clientId" value="<%= registermodel.getClientId() %>" readonly>
                            </div>
                        </div>
                        <div class="text-center">
                       <a href="home" class="btn btn-secondary back-btn">
                    <i class="fas fa-arrow-left"></i> Back
                </a>
                            <a href="userlogout" class="btn btn-danger logout-btn">Logout</a>
                            <button type="button" class="btn btn-color text-white update-btn" onclick="enableEditMode()">Edit</button>
                            <button type="submit" class="btn btn-success update-btn edit-mode" id="saveBtn">Save</button>
                             
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function enableEditMode() {
            const form = document.getElementById('profileForm');
            const inputs = form.querySelectorAll('input');
            inputs.forEach(input => {
                if (input.id !== 'email' && input.id !== 'joinedDate') { 
                    input.removeAttribute('readonly');
                }
            });
            document.querySelector('.update-btn').classList.add('edit-mode'); 
            document.getElementById('saveBtn').classList.remove('edit-mode'); 
        }
    </script>
</body>
</html>
