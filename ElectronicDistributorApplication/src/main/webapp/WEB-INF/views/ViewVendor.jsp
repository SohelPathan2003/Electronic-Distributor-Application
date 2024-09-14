<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="DashBoard.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vendor Management</title>

<style>
    .view-vendor {
        background-color: rgba(0, 0, 0, 0.5);
        padding: 20px;
        border-radius: 8px;
    }
    .table thead th {
        background-color: #343a40;
    }
    .table td, .table th {
        vertical-align: middle;
    }
    .input {
        margin-bottom: 20px;
    }

    #pagination {
        margin-top: 20px;
        text-align: center; /* Center pagination controls */
    }

    #pagination button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        margin: 0 5px;
        cursor: pointer;
    }

    #pagination button.active {
        background-color: #0056b3;
    }

    #pagination button:disabled {
        background-color: #ddd;
        cursor: not-allowed;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
function confirmationDelete(str) {
    Swal.fire({
        title: 'Are you sure?',
        text: 'You will not be able to recover this Vendor!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Deleted!',
                'Vendor has been deleted.',
                'success'
            ).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "deletevendor?vid=" + str;
                }
            });
        } else {
            Swal.fire('Cancelled', 'Failed to delete Vendor :)', 'error');
        }
    });
}
</script>

</head>
<body>

<div class="view-vendor">
    <input type="text" placeholder="Search Vendor" class="form-control form-control-lg input" name="searchv" onkeyup="searchvendor(this.value)">
    <small id="vendorNameError"></small>

    <div id="searchedtable">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th class="text-white" scope="col">VendorID</th>
                    <th class="text-white" scope="col">Vendor Name</th>
                    <th class="text-white" scope="col">Vendor Email</th>
                    <th class="text-white" scope="col">Delete</th>
                    <th class="text-white" scope="col">Update</th>
                </tr>
            </thead>
            <tbody id="vendorTableBody">
                <% int count = 0; %>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td class="text-white"><%= ++count %></td>
                        <td class="text-white">${s.getVendorName()}</td>
                        <td class="text-white">${s.getEmail()}</td>
                        <td class="text-white"><a class="btn btn-danger" href="#" onclick="confirmationDelete(${s.getVendorId()})">Delete</a></td>
                        <td class="text-white"><a class="btn btn-primary" href="updatevendor?vendorid=${s.getVendorId()}&vendorname=${s.getVendorName()}&vendoremail=${s.getEmail()}">Update</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="pagination" class="text-center mt-4">
        <!-- Pagination buttons will be dynamically added here -->
    </div>
</div>

<script>
function validateVendorName(vendorName) {
    var vendorNameError = document.getElementById("vendorNameError");
    const vendorNameRegex = /^[a-zA-Z\s]{3,}$/;
    if (!vendorNameRegex.test(vendorName.value)) {
        vendorNameError.innerHTML = 'At least 3 characters long.';
    } else {
        vendorNameError.innerHTML = '';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    const rowsPerPage = 10; // Number of rows per page
    const tableBody = document.getElementById('vendorTableBody'); // Table body containing the rows
    const rows = Array.from(tableBody.getElementsByTagName('tr')); // Convert HTMLCollection to array
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);
    let currentPage = 1;

    function showPage(page) {
        rows.forEach((row, index) => {
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;
            row.style.display = index >= start && index < end ? 'table-row' : 'none';
        });
        updatePaginationControls();
    }

    function updatePaginationControls() {
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        const prevButton = document.createElement('button');
        prevButton.textContent = 'Previous';
        prevButton.disabled = currentPage === 1;
        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        });
        pagination.appendChild(prevButton);

        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            pageButton.className = i === currentPage ? 'active' : '';
            pageButton.addEventListener('click', () => {
                currentPage = i;
                showPage(currentPage);
            });
            pagination.appendChild(pageButton);
        }

        const nextButton = document.createElement('button');
        nextButton.textContent = 'Next';
        nextButton.disabled = currentPage === totalPages;
        nextButton.addEventListener('click', () => {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        });
        pagination.appendChild(nextButton);
    }

    // Initialize the pagination
    showPage(currentPage);
});
</script>

</body>
</html>
