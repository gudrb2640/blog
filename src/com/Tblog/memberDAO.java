package com.Tblog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	DataSource ds;
	
	public memberDAO() {
		try{
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");		
			
			ds = (DataSource)envContext.lookup("jdbc/jspbeginner");
	
		}catch(Exception e){
			System.out.println("DB_Connect : " + e.toString());
		}	
	}
	
	public void ResouceClose(){	
		try {
			if(pstmt != null){
				pstmt.close();
			}
			if(rs!= null){
				rs.close();
			}
			if(con != null){ 
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void insertMember(memberDTO dto) {
		try {
			con= ds.getConnection();
			
			String sql = "insert into member (name,id,blog_name,email,pw,phone,main_img)"
					+ " values(?,?,?,?,?,?,?)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getBlog_name());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPw());
			pstmt.setString(6, dto.getPhone());
			pstmt.setString(7,dto.getMain_img());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertMember:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public int userCheck(String id,String pw) {
		try {
			con = ds.getConnection();
			String sql = "select pw from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					return 1;
				}
			}
		} catch (Exception e) {
			System.out.println("userCheck");
		}finally {
			ResouceClose();
		}
		return  0;
	}

	
	public memberDTO getmemberInfo(String id) {
		
		memberDTO mDto = new memberDTO();
		try {
			con = ds.getConnection();
			
			String sql = "select* from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mDto.setMember_num(rs.getInt("member_num"));
				mDto.setId(rs.getString("id"));
				mDto.setName(rs.getString("name"));
				mDto.setBlog_name(rs.getString("blog_name"));
				mDto.setEmail(rs.getString("email"));
				mDto.setPw(rs.getString("pw"));
				mDto.setPhone(rs.getString("phone"));
				mDto.setMain_img(rs.getString("main_img"));
			}
		} catch (Exception e) {
			System.out.println("getmemberInfo:"+e.toString());
		}finally{
			ResouceClose();
		}
		
		
		return mDto;
	}
	
	public Vector<membersCategoryDTO> getCategory(int member_num) {
		
		Vector<membersCategoryDTO> category_v = new Vector<membersCategoryDTO>();
	
		try {
			con = ds.getConnection();
			String sql = "select * from category where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				membersCategoryDTO cdto= new membersCategoryDTO();
				
				category_v.add(new membersCategoryDTO(rs.getInt("category_num"), member_num, rs.getString("category")));
			}
				
		} catch (Exception e) {
			System.out.println("getTitle:"+e.toString());
		}finally {
			ResouceClose();
		}
		
		return category_v;
	}
	
	public void insertCategory(int member_num,String category) {
		try {
			con= ds.getConnection();
			String sql = "insert into category (member_num,category) values(?,?)";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.setString(2, category);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateCategory:"+ e.toString());
		}finally {
			ResouceClose();
		}
		
	}
	public void deleteCategory(int category_num) {
		try {
			con= ds.getConnection();
			String sql = "delete from category where  category_num=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, category_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteCategory:"+ e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public void updateCategory(String new_Category,int category_num) {
		try {
			con= ds.getConnection();
			String sql = "update category set category=? where category_num=?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, new_Category);
			pstmt.setInt(2, category_num);;
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateCategory:"+ e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public Vector<subheadingDTO> getSubheading(int member_num) {
		Vector<subheadingDTO> subheading_v = new Vector<subheadingDTO>();
		try {
			con =ds.getConnection();
			String sql="select s.subheading_num, s.member_num, s.subheading, c.category" 
					+ " from subheading s join category c"
					+ " on s.category_num = c.category_num"
					+ " where s.member_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				subheading_v.add(new subheadingDTO(rs.getInt("subheading_num"),
											rs.getInt("member_num"),
											rs.getString("category"),
											rs.getString("subheading")));
			}
			
		} catch (Exception e) {
			System.out.println("getSubheading:"+e.toString());
		}finally {
			ResouceClose();
		}
		
		return subheading_v;
	}
	
	public void insertSubheading(int member_num,int title_num,String subheading) {
		try {
			con = ds.getConnection();
			String sql ="insert into subheading (member_num,category_num,subheading)"
					+ "values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,member_num);
			pstmt.setInt(2, title_num);
			pstmt.setString(3, subheading);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateaSubheading:"+e.toString());
		}finally {
			ResouceClose();
		}
		
	}
	public  void updateSubheading(int subheading_num,String subheading) {
		try {
			con=ds.getConnection();
			String sql="update subheading set subheading=? where subheading_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, subheading);
			pstmt.setInt(2, subheading_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateSubheading:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public void deleteSubheading(int subheading_num) {
		try {
			con=ds.getConnection();
			String sql="delete from subheading  where subheading_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, subheading_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteSubheading"+e.toString());
		}finally {
			ResouceClose();
		}
	}

	public void updateImg(int member_num,String main_img) {
		try {
			con = ds.getConnection();
			String sql="update member set main_img=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, main_img);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateImg:"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public Vector<memberDTO> getMemberList(){
		Vector<memberDTO> v = new Vector<memberDTO>();
		try {
			con = ds.getConnection();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				memberDTO mdto = new memberDTO();
				mdto.setId(rs.getString("id"));
				mdto.setBlog_name(rs.getString("blog_name"));
				mdto.setMain_img(rs.getString("main_img"));
				
				v.add(mdto);
			}
			
		} catch (Exception e) {
			System.out.println("getMemberList:"+e.toString());
		}finally{
			ResouceClose();
		}
		return v;
	}
	
	public void updateID(String id,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "update member set id=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateID"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void updateName(String name,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "update member set name=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateName"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	public void updatePhone(String phone,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "update member set phone=? where member_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePhone"+e.toString());
		}finally {
			ResouceClose();
		}
	}
	
	public int idCheck(String id) {
		try {
			con = ds.getConnection();
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println("idCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int blog_nameCheck(String blog_name) {
		try {
			con = ds.getConnection();
			String sql = "select blog_name from member where blog_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, blog_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("blog_nameCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int emailCheck(String email) {
		try {
			con = ds.getConnection();
			String sql = "select email from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("emailCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int phoneCheck(String phone) {
		try {
			con = ds.getConnection();
			String sql = "select phone from member where phone=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return 1;
			}
		} catch (Exception e) {
			System.out.println("phoneCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	public int pwCheck(String pw,int member_num) {
		try {
			con = ds.getConnection();
			String sql = "select pw from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))){
					return 1;
				}
					
			}
		} catch (Exception e) {
			System.out.println("pwCheck"+e.toString());
		}finally {
			ResouceClose();
		}
		return 0;
	}
	
	public void updatePw(String new_pw,int member_num){
		try {
			con = ds.getConnection();
			String sql = "update member set pw=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_pw);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePw"+e.toString());
		}finally{
			ResouceClose();
		}
	}
	
	public void updateEmail(String email,int member_num){
		try {
			con = ds.getConnection();
			String sql = "update member set email=? where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateEmail"+e.toString());
		}finally{
			ResouceClose();
		}
	}
	
	public void deletemember(int member_num){
		try {
			con = ds.getConnection();
			String sql = "delete from member where member_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member_num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteMember:"+e.toString());
		}finally{
			ResouceClose();
		}
	}
}//memberDAO
