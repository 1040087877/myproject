
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
    
    <title>��Ա��Ϣ</title><script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","�ļ��ϴ�");
            pop.build();
            pop.show();
	    }
	</script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.xuehao.value==""){alert("������ѧ��");document.form1.xuehao.focus();return false;}if(document.form1.xingming.value==""){alert("����������");document.form1.xingming.focus();return false;}if(document.form1.mima.value==""){alert("����������");document.form1.mima.focus();return false;}if(document.form1.lianxifangshi.value==""){alert("��������ϵ��ʽ");document.form1.lianxifangshi.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="sheyuanxinxi_updt_postlb.jsp?id=<%=id %>">
  �������Ų鿴:
  <br><br>
  <%
  String sql="select * from sheyuanxinxi where xuehao='"+request.getSession().getAttribute("username")+"'";
  String xuehao="";String xingming="";String mima="";String zhuanye="";String banji="";String sushe="";String lianxifangshi="";String zhaopian="";String beizhu="";String shetuan="";String shifoushechang="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");mima=RS_result.getString("mima");zhuanye=RS_result.getString("zhuanye");banji=RS_result.getString("banji");sushe=RS_result.getString("sushe");lianxifangshi=RS_result.getString("lianxifangshi");zhaopian=RS_result.getString("zhaopian");beizhu=RS_result.getString("beizhu");shetuan=RS_result.getString("shetuan");shifoushechang=RS_result.getString("shifoushechang");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr style='display:none'><td>ѧ�ţ�</td><td><input name='xuehao' type='text' id='xuehao' value='<%= xuehao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>������</td><td><input name='xingming' type='text' id='xingming' value='<%= xingming%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>���룺</td><td><input name='mima' type='text' id='mima' value='<%= mima%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>רҵ��</td><td><input name='zhuanye' type='text' id='zhuanye' value='<%= zhuanye%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>�༶��</td><td><input name='banji' type='text' id='banji' value='<%= banji%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>��ϵ��ʽ��</td><td><input name='lianxifangshi' type='text' id='lianxifangshi' value='<%= lianxifangshi%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr style='display:none'><td>��Ƭ��</td><td><input name='zhaopian' type='text' id='zhaopian' size='50' value='<%= zhaopian%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('zhaopian')" style='border:solid 1px #000000; color:#666666'/></td></tr><tr style='display:none'><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=beizhu%></textarea></td></tr><tr><td>���ţ�</td><td><input name='shetuan' type='text' id='shetuan' value='<%= shetuan%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>�Ƿ��糤��</td><td><input name='shifoushechang' type='text' id='shifoushechang' value='<%= shifoushechang%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

  </body>
</html>

