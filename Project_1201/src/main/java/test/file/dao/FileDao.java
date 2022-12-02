package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {	
	//static 필드
	private static FileDao dao;
	//외부에서 객체 생성하지 못하도록 생성자를 private로
	private FileDao() {}
	//자신의 참조값을 리턴해주는 메소드
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}
		return dao;
	}
	
	//페이징 처리하기(getcount)
	
	//페이징 처리하기(getData)
	
	//파일 1개 삭제하기
	
	//파일 1개 추가하기
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO recipe_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(recipe_file_seq.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//?에 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
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
	
	//파일 목록을 리턴해주는 메소드	
	public List<FileDto> getList() {
		//파일목록을 담을 객체 생성
		List<FileDto> list = new ArrayList<>();

		//필요한 객체를 담을 지역변수를 미리 만들어둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, writer, title, orgFileName, fileSize, regdate"
					+ " FROM recipe_file"
					+ " ORDER BY num DESC";
			//sql문의 ?에 바인딩할게 있으면 한다.

			pstmt = conn.prepareStatement(sql);
			//SELECT문을 수행하고 결과값을 받아온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 resultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				FileDto dto=new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("filesize"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
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
		return list;
	}

	
	
}
