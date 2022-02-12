<%@page import="java4s.Mybean"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.*;" %>

<head>
<link rel="stylesheet" type="text/css" href="css/java4s.css" />
<script type="text/javascript">
function deleteRecord()
	{	     
	    document.fom.action="del.action";
	    document.fom.submit();
	}
function editr(val)
{	     
    document.fom.action="update.action?fid="+val;
    document.fom.submit();
}	
</script>
</head>

<a href="<s:url action="saveLink.action"/>">Insert</a>

<br><br>

<table class="bordt">
<form name="fom" method="post">
<% 
List l=(List)request.getAttribute("disp");
if(l!=null)
{

	Iterator it=l.iterator();
	
	while(it.hasNext())
	{
		
		Mybean b=(java4s.Mybean)it.next();
		int tempNum = b.getNo();
		String tempName = b.getNam();
		String tempCountry = b.getCt();

%>
        <tr> 
        <td class="bord"><input type="checkbox" value="<%= tempNum %>" name="rdel"></td>
        <td class="bord"><%= tempNum %></td>
        <td class="bord"><%= tempName %></td>
        <td class="bord"><%= tempCountry %></td>
        <td class="bord"><a href="javascript:editr('<%= tempNum %>')">Edit</a></td>         
        </tr> 
        
<% 		
				
	}	
}

%>  
<input type="button" value="delete" onclick="deleteRecord();">
</table>

</form>

