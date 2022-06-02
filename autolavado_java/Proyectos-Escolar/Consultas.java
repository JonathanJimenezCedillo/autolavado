/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autolavado;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Jonathan
 */
public class Consultas {
       void addCliente(String nom,String app, String apm, String sexo, String edad, String claveem, Statement conex) {
        try {
            String consulta = "CALL addCli('" + nom + "','"+app+"','"+apm+"','" + sexo + "'," + edad + ","+claveem+");";
            System.out.println(consulta);
            conex.executeUpdate(consulta);
            JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    } 
  //////////////////////////////////////////////////////////////////   
       void addAuto(String ma,String ie, String co, String tipo, String cost, Statement conex) {
        try {
            String consulta = "CALL addAutos('" + ma + "',"+ie+","+co+"," + tipo + ","+cost+");";
            System.out.println(consulta);
            conex.executeUpdate(consulta);
            JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    } 
      //////////////////////////////////////////////////////////////////   
       void addEmp(String clave,String nomb, String apep, String apem, String sex, String edad, String du, Statement conex) {
        try {
            String consulta = "CALL addEmpleado(" + clave + ",'"+nomb+"','"+apep+"','"+ apem +"','"+sex+"',"+edad+","+du+");";
            System.out.println(consulta);
            conex.executeUpdate(consulta);
            JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
        }
       ///////////////////////////////////////////////////////////////
       ResultSet mostrarEmpleado(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT * FROM empleado;";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
       //////////////////////////
           ResultSet modificarEmpleado(String clae, String nome, String appe, String apme, String se, String ede, String ide, Statement conex) {
      ResultSet cdr=null;
      try {
            String consulta = "CALL cambiarEm( " + clae + ",'" + nome + "','" + appe + "','" + apme + "','" + se + "'," + ede + "," + ide + ");";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
        } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
      return cdr;
    }
           ////////////////////////////////////////////////////////
           ResultSet mostrarCliente(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT Categoria FROM tipo;";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
           ////////////////////////////////////////
      ResultSet cambioPrecio(String costeo, String tip, Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL cambioPrecio(" + costeo + ", '" + tip + "');";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
            JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
      ////////////////////////////////////////////////////
             ResultSet mostrarAutos(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT * FROM auto;";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
             //////////////////////////////////////////////
             ResultSet TIPO(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT Categoria, Costo FROM tipo;";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
             ///////////////////////////////////////////////////////
             ResultSet boarrarAuto(String nomber,Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL borrar('" + nomber +  "');";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
             /////////////////////////
             ResultSet mostrarE(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL mostrarEm();";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
             /////////////////////////////////////
     ResultSet mostrarEmm(String nom,Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL mostE('"+nom+"');";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
     /////////////////////////////////////
     ResultSet modifAuto(String nm,String nc, String ne,String nca, String mc,Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL cambiarda('"+nm+"',"+nc+","+ne+","+nca+",'"+mc+"');";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
                  /////////////////////////////////////
     ResultSet eliminarE(String elimi,Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL borrarEMP("+elimi+");";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
     ///////////////////////////////////////////////////////////////
       ResultSet precioEm(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL EM()";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
       
            ///////////////////////////////////////////////////////////////
       ResultSet precioCEm(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "CALL df()";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
                   ///////////////////////////////////////////////////////////////
       ResultSet precioTD(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT gananciaTD FROM gananciaDueño";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    }
                         ///////////////////////////////////////////////////////////////
       ResultSet TOTAL(Statement conex) {
    ResultSet cdr=null;
            try {
            String consulta = "SELECT TOTALD FROM INGRESOTOTAL";
            System.out.println(consulta);
            cdr=conex.executeQuery(consulta);
           // JOptionPane.showMessageDialog(null,"Si se pudo","OK ",JOptionPane.INFORMATION_MESSAGE);
     
            } catch (SQLException sQLException) {
            JOptionPane.showMessageDialog(null,"No se pudo","KO ",JOptionPane.WARNING_MESSAGE);
        }
    return cdr;
    } 
}//CLASE
