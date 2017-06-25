<!-- OracleDB�ɐڑ����A�V�X�e�����t��\������ -->

<%@page contentType="text/html"
 import="java.util.*,javax.naming.*,javax.sql.DataSource,java.sql.*"
%>
<%
   
  DataSource ds = null;
  Connection con = null; 
  PreparedStatement pr = null; 
  InitialContext ic; 
  try {
    ic = new InitialContext();
    <!--  -->
    ds = (DataSource)ic.lookup( "java:/appDatasource" );
    con = ds.getConnection(); 

    <!-- ORACLE���V�X�e�����t���擾 prepare -->
    pr = con.prepareStatement("SELECT SYSTIMESTAMP FROM DUAL");
    ResultSet rs = pr.executeQuery();
    while (rs.next()) {
       <!-- �V�X�e�����t��\�� -->
       out.println(rs.getString(1)); 
    }   
    rs.close();
    pr.close();
  } catch(Exception e) {
    out.println("Exception " +e); 
  } finally {
    if(con != null){
      con.close();
    }      
  }
%>
