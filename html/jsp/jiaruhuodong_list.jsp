
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
    

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>���м����б���</p>
  <form name="form1" id="form1" method="post" action="">
   ����:&nbsp;&nbsp;���ţ�<input name="huodongbianhao" type="text" id="huodongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;����ƣ�<input name="huodongmingcheng" type="text" id="huodongmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;���ţ�<input name="shetuan" type="text" id="shetuan" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;�����ˣ�<input name="jiaruren" type="text" id="jiaruren" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="����EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='jiaruhuodong_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>�����</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>��ע</td><td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">����ʱ��</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
  <%
  int curpage=1;//��ǰҳ
				int page_record=10;//ÿҳ��ʾ�ļ�¼��
				int zgs=0;
				int zys=0;
				//������ķ�����sql��ѯ��ɣ��ٶȿ죩
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from jiaruhuodong";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//��ȡ���ݵ�ֵ����Ҫ��ʾ��ҳ
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
   sql="";
  if ((curpage-1)*page_record==0 )
{
  sql="select top 10 * from jiaruhuodong where 1=1";
}
else
{
  sql="select top "+page_record+" * from jiaruhuodong where id not in (select top "+((curpage-1)*page_record)+" id from jiaruhuodong order by id desc) ";
}
  
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String huodongbianhao="";String huodongmingcheng="";String huodongriqi="";String shetuan="";String jiaruren="";String beizhu="";String issh="";
 String addtime="";
 int i=0;
 //difengysfiqfgieuheze

 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongriqi=RS_result.getString("huodongriqi");shetuan=RS_result.getString("shetuan");jiaruren=RS_result.getString("jiaruren");beizhu=RS_result.getString("beizhu");issh=RS_result.getString("issh");
 addtime=RS_result.getString("addtime");
  //zoxngxetxoxngjxvi
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongriqi %></td><td><%=shetuan %></td><td><%=jiaruren %></td><td><%=beizhu %></td><td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=jiaruhuodong" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><%=issh%></a></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="60" align="center"><a href="jiaruhuodong_updt.jsp?id=<%=id%>">�޸�</a>  <a href="del.jsp?id=<%=id %>&tablename=jiaruhuodong" onclick="return confirm('���Ҫɾ����')">ɾ��</a></td>
  </tr>
  	<%
  }
   %>
</table>
<%//yougongzitongji%>
<br>
�������ݹ�<%=i %>��,<a style="cursor:hand" onclick="javascript:window.print();">��ӡ��ҳ</a>
<p align="center">&nbsp;��<%=zgs%>����¼&nbsp;&nbsp;<%=page_record %>��/ҳ��<a href="jiaruhuodong_list.jsp?page=1">��ҳ</a>��<a href="jiaruhuodong_list.jsp?page=<%= curpage-1%>">��һҳ</a>��<A href="jiaruhuodong_list.jsp?page=<%= curpage+1%>">��һҳ</A>��<a href="jiaruhuodong_list.jsp?page=<%=zys %>">βҳ</A>����ǰ��<FONT color=red><%=curpage %></FONT>ҳ/��<FONT color=red><%=zys %></FONT>ҳ</p>
  </body>
</html>
