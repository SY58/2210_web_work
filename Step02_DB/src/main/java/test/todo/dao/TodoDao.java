package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	//오직 한개만 생성된 TodoDao type 객체의 참조값을 담을 static 필드
	private static TodoDao dao;
	
	//외부에서 객체 생성하지 못하도록 접근지정자를 private로 한다.
	private TodoDao() {}
	
	//TodoDao 객체의 참조값을 리턴하는 static 메소드
	public static TodoDao getInstance() {
		//만일 필드에 저장된 값이 null이면 (아직 TodoDao 객체가 생성된 적이 없으면)
		if(dao==null) {
			//객체를 생성해서 참조값을 static 필드에 담아둔다.
			dao=new TodoDao();
		}
		//static 필드에 저장되어 있는 TodoDao 객체의 참조값 리턴
		return dao;
	}
		
	//전체 할일 목록을 리턴(getList)
	public List<TodoDto> getList() {
		List<TodoDto> list=new ArrayList<>();			
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="SELECT num, content, TO_CHAR(regdate, 'YYYY.MM.DD AM HH:MI') AS regdate"
					+" FROM todo"
					+" ORDER BY num ASC";			
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();								
			while(rs.next()) {
				TodoDto dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {}
		}		
		return list;
	}		
			
	//할일 추가(insert)
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO todo"
					+ " (num, content, regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩			
			pstmt.setString(1, dto.getContent());			
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	//할일 삭제(delete)
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM todo"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setInt(1, num);
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	//할일 한개 보기(getData)
	public TodoDto getData(int num) {		
		TodoDto dto=null;
		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, content, TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate"
					+ " FROM todo"
					+ " WHERE num=?";						
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩할게 있으면 한다.
			pstmt.setInt(1, num);
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기

			} catch (Exception e2) {
			}
		}
		return dto;
	}	
	
	//할일 수정하기(update)
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE todo"
					+ " SET content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setString(1, dto.getContent());			
			pstmt.setInt(2, dto.getNum());			
			//INSERT or UPDATE or DELETE문을 수행하고 수정,삭제,추가된 row의 개수 리턴
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}	
}
