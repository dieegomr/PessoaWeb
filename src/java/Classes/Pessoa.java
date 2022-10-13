package Classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Pessoa {
	private int    idPessoa;
	private String nomePessoa;
	private String email;
        
        public boolean incluirPessoa(){
            String sql = "insert into pessoa (nomepessoa, email) values (?, ?)";
            Connection con = null;
            PreparedStatement stm = null;
            
            try {
                con = Conexao.conectar();
                stm = con.prepareStatement(sql);
                stm.setString(1, this.nomePessoa);
                stm.setString(2, this.email);
                stm.execute();
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage() +sql);
                return false;
            }
            return true;
	}
        
        public boolean alterarPessoa() throws Exception {
            Connection con = Conexao.conectar();
                String sql = "update pessoa ";
                       sql += "set nomepessoa = ?, ";
                       sql += " email = ? ";
                       sql += "where idpessoa = ?";
                        
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nomePessoa);
                stm.setString(2, this.email);
                stm.setInt(3, this.idPessoa);
                stm.execute();
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
                return false;
            }
            return true;
	}
        
        public boolean excluirPessoa() throws Exception {
            Connection con = Conexao.conectar();
            String sql = "delete from pessoa where idpessoa = ?";
                        
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idPessoa);
                stm.executeQuery();
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
                return false;
            }
            return true;
	}
        
        public List<Pessoa> ConsultarPessoas() {
            List<Pessoa> lista = new ArrayList<>();
            Connection con = Conexao.conectar();
            String sql = "select idpessoa, nomepessoa, email ";
                   sql += "from pessoa ";
                   sql += "order by 2 ";
                
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    Pessoa p = new Pessoa();
                    p.setIdPessoa(rs.getInt("idPessoa"));
                    p.setNomePessoa(rs.getString("nomePessoa"));
                    p.setEmail(rs.getString("email"));
                    lista.add(p);
                }       
            } catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
            }
            return lista;
	}
        
        public Pessoa consultarPessoa(int pIdPessoa){
            Connection con = Conexao.conectar();
            String sql = "SELECT * FROM pessoa WHERE idpessoa = ?";
                                    Pessoa p = null;
                   try {
                        PreparedStatement stm = con.prepareStatement(sql);
                        stm.setInt(1, pIdPessoa);
                        ResultSet rs = stm.executeQuery();

                        if (rs.next()) {
                            p = new Pessoa();
                            p.setIdPessoa(rs.getInt("idpessoa"));
                            p.setNomePessoa(rs.getString("nomepessoa"));
                            p.setEmail(rs.getString("email"));				
                        }
                    } 
                    catch (SQLException ex) {
                        System.out.println("Erro: " + ex.getMessage());
                    }
                    return p;
	}
	
	public Pessoa() {	
	}
		
	public Pessoa(String nomePessoa, String email) {
		super();
		this.nomePessoa = nomePessoa;
		this.email = email;
	}

	public Pessoa(int idPessoa, String nomePessoa, String email) {
		super();
		this.idPessoa = idPessoa;
		this.nomePessoa = nomePessoa;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Pessoa [idPessoa=" + idPessoa + ", nomePessoa=" + nomePessoa + ", email=" + email + "]";
	}

	public int getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(int idPessoa) {
		this.idPessoa = idPessoa;
	}
	public String getNomePessoa() {
		return nomePessoa;
	}
	public void setNomePessoa(String nomePessoa) {
		this.nomePessoa = nomePessoa;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;	
	}
}