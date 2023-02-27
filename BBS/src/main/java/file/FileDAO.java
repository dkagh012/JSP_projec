package file;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
 
public class FileDAO {
    
    private Connection conn;            // DB에 접근하는 객체
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public FileDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/bbs";
            String dbID = "root";
            String dbPassword = "root";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }    
    }  
    public int upload(String fileName , String fileRealName) {
    	String SQL = "INSERT INTO FILE VALUE ( ? , ? )";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, fileName);
    		pstmt.setString(2, fileRealName);
    		return pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -1;
    }
}
