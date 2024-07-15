<%-- 
    Document   : Update
    Created on : Oct 12, 2020, 8:29:35 PM
    Author     : trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Order</title>
    </head>
    <body>
        <form action="updateOrder" method="post">
            <table>
                <tr>
                    <td>Order ID</td>
                    <td>
                        <input value="${OrderUpdate.order_id}" type="text" name="order_id" readonly>
                    </td>
                </tr>
                <tr>
                    <td>User ID</td>
                    <td>
                        <input value="${OrderUpdate.user_id}" type="text" name="user_id" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Total Money</td>
                    <td>
                        <input value="${OrderUpdate.total_money}" type="text" name="total_money" readonly>
                    </td>
                </tr>                
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="Status" value="0" ${OrderUpdate.status_id ==0 ?checked:""}>Delivering
                        <input type="radio" name="Status" value="1" ${OrderUpdate.status_id ==1 ?checked:""}>Complete
                    </td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>
                        <input value="${OrderUpdate.date}" type="text" name="date" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Note</td>
                    <td>
                        <input value="${OrderUpdate.note}" type="text" name="note" readonly>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
