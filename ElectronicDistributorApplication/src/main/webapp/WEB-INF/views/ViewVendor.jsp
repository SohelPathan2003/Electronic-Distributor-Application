<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
            <tbody>
                <% int count = 0; %>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td class="text-white"><%= ++count %></td>
                        <td class="text-white">${s.getVendorName()}</td>
                        <td class="text-white">${s.getEmail()}</td>
                        <td class="text-white"><a class="btn btn-danger" href="#" onclick="confirmationDelete(${s.getVendorId()})">Delete</a></td>
                        <td class="text-white"><a class="btn btn-primary" href="updatevendor?vid=${s.getVendorId()}&name=${s.getVendorName()}&email=${s.getEmail()}">Update</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


	
</div>
</main>
</body>
</html>
