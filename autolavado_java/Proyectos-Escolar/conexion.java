/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autolavado;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class conexion {
    private String bd="autolavado";
    private String url_sql="jdbc:mysql://localhost/"+bd;
    private final String usuario="root";
    private final String pasword="";
    private Connection miConexion=null;
    private Statement miEstatuto_sql=null;
    private ResultSet cdr=null;
   
    public Statement conectaSql() {
      int sql=0;
       try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        System.out.println("CORRECTO CON EL DRIVER");
        sql++;
    }catch(ClassNotFoundException | InstantiationException | IllegalAccessException e){
        System.out.println("ERROR CON EL DRIVER");
    }

    try{
    miConexion=DriverManager.getConnection(url_sql,usuario,pasword);
    System.out.println(url_sql+usuario+pasword);
    if(miConexion!=null){
    System.out.println("CONEXION OK..");
    sql++;
    }
    }catch(SQLException er){
        System.out.println(er);
    System.out.println("ERROR CON LA CONEXION");
    }

    try{
    miEstatuto_sql=miConexion.createStatement();
    System.out.println("ESTATUTO OK..");
    sql++;
    }catch(SQLException err){
     System.out.println("ERROR CON EL ESTATUTO");
    }

    /*      if(sql==3){
    JOptionPane.showMessageDialog(null,"ESTADO DE LA CONEXION","SQL SE CONECTO",JOptionPane.INFORMATION_MESSAGE);
    }else{
    JOptionPane.showMessageDialog(null,"ESTADO DE LA CONEXION","SQL NO SE CONECTO",JOptionPane.ERROR_MESSAGE);
    }*/
return  miEstatuto_sql;
    }
    
    

}
