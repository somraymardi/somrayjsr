<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .nav-bar {
            background-color: #333;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 1rem;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <nav class="nav-bar">
        <h1>Admin Portal</h1>
    </nav>
    <div class="container">
        <div id="loginPage">
            <h2>Login</h2>
            <form>
                <div class="form-group">
                    <label for="loginUsername">Username</label>
                    <input type="text" class="form-control" id="loginUsername" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="loginPassword">Password</label>
                    <input type="password" class="form-control" id="loginPassword" placeholder="Enter password">
                </div>
                <div id="loginError"></div>
                <button type="button" class="btn btn-primary" onclick="checkLogin()">Login</button>
                <p>Don't have an account? <a href="#" onclick="showRegisterPage()">Register</a></p>
            </form>
        </div>
        <div id="registerPage" style="display: none;">
            <h2>Register</h2>
            <form>
                <div class="form-group">
                    <label for="registerUsername">Username</label>
                    <input type="text" class="form-control" id="registerUsername" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="registerPassword">Password</label>
                    <input type="password" class="form-control" id="registerPassword" placeholder="Enter password">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm password">
                </div>
                <div id="registerError"></div>
                <button type="button" class="btn btn-primary" onclick="registerAdmin()">Register</button>
                <p>Already have an account? <a href="#" onclick="showLoginPage()">Login</a></p>
            </form>
        </div>
        <div id="adminPortal" style="display: none;">
            <h2>Admin Dashboard</h2>
            <button type="button" class="btn btn-primary" onclick="createRetailerId()">Create Retailer ID</button>
            <table id="retailerIdsTable">
                <thead>
                    <tr>
                        <th>Retailer ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="retailerIdsTableBody">
                </tbody>
            </table>
            <button type="button" class="btn btn-danger" onclick="logOut()">Log Out</button>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2023 Admin Portal</p>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let admins = JSON.parse(localStorage.getItem('admins')) || [];
        let retailerIds = JSON.parse(localStorage.getItem('retailerIds')) || [];
        let loggedInAdmin;
        function checkLogin() {
            let username = document.getElementById('loginUsername').value;
            let password = document.getElementById('loginPassword').value;
            for (let admin of admins) {
                if (admin.username === username && admin.password === password) {
                    loggedInAdmin = admin;
                    document.getElementById('loginPage').style.display = 'none';
                    document.getElementById('adminPortal').style.display = 'block';
                    populateRetailerIdsTable();
                    return;
                }
            }
            document.getElementById('loginError').innerHTML = 'Invalid username or password';
        }
        function registerAdmin() {
            let username = document.getElementById('registerUsername').value;
            let password = document.getElementById('registerPassword').value;
            let confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('registerError').innerHTML = 'Password mismatch';
                return;
            }
            for (let admin of admins) {
                if (admin.username === username) {
                    document.getElementById('registerError').innerHTML = 'Username already exists';
                    return;
                }
            }
            admins.push({ username, password });
            localStorage.setItem('admins', JSON.stringify(admins));
            document.getElementById('registerPage').style.display = 'none';
            document.getElementById('loginPage').style.display = 'block';
        }
        function createRetailerId() {
            let Id = Math.floor(Math.random() * 1000000);
            retailerIds.push(Id);
            localStorage.setItem('retailerIds', JSON.stringify(retailerIds));
            populateRetailerIdsTable();
        }
        function deleteRetailerId(Id) {
            retailerIds = retailerIds.filter(id => id !== Id);
            localStorage.setItem('retailerIds', JSON.stringify(retailerIds));
            populateRetailerIdsTable();
        }
        function populateRetailerIdsTable() {
            let tableBody = document.getElementById('retailerIdsTableBody');
            tableBody.innerHTML = '';
            retailerIds.forEach(Id => {
                let row = document.createElement('tr');
                let cell1 = document.createElement('td');
                cell1.textContent = Id;
                let cell2 = document.createElement('td');
                let deleteButton = document.createElement('button');
                deleteButton.textContent = 'Delete';
                deleteButton.onclick = function() { deleteRetailerId(Id); };
                cell2.appendChild(deleteButton);
                row.appendChild(cell1);
                row.appendChild(cell2);
                tableBody.appendChild(row);
            });
        }
        function showRegisterPage() {
            document.getElementById('loginPage').style.display = 'none';
            document.getElementById('registerPage').style.display = 'block';
        }
        function showLoginPage() {
            document.getElementById('registerPage').style.display = 'none';
            document.getElementById('loginPage').style.display = 'block';
        }
        function logOut() {
            document.getElementById('adminPortal').style.display = 'none';
            document.getElementById('loginPage').style.display = 'block';
            loggedInAdmin = null;
        }
    </script>
</body>
</html>
