<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.* , java.util.* , java.io.* , java.sql.* , javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Root</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login-details","root","Sanju@999");
	PreparedStatement ps=con.prepareStatement("select username from user");
    ResultSet res=ps.executeQuery();
    ArrayList<String> x=new ArrayList<String>();
    while(res.next()){
    	x.add(res.getString("username"));
    }
    Collections.shuffle(x);
    session.setAttribute("al", x);
    int j=0;
    for(int i=1;i<=(int)session.getAttribute("res1");i++)
    {
    	out.println("ROOM:"+i);
    	%>
    	<br>
    	<%
    	out.println("|");
    	int g=0;
    	while(j<x.size())
    	{
    		if(g>0 && g%10==0)
    		{
    			%>
    		    <br>
    		    <%
    		    out.println("|");
    		}
    		if(x.get(j)!=null){
    		    out.print(x.get(j)+" | ");
    			g+=1;}
    		j+=1;
    		if(g%(int)session.getAttribute("res2")==0){
    			%>
    	    	<br>
    	    	<%
    			break;}
    	}
    }

} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<br>
<br>
<form action=admin.jsp>
<input type="submit" value="logout">
</form>
</body>
</html>
