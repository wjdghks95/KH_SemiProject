package or.com.member;

import java.util.Date;

public class MemberBean {
	private Long member_id;
	private String id;
	private String password;
	private String name;
	private String birthday;
	private char gender;
	private String email;
	private char vote_chk;
	private char board_chk;
	private String created_date;
	
	public Long getMember_id() {
		return member_id;
	}
	
	public void setMember_id(Long member_id) {
		this.member_id = member_id;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	public char getGender() {
		return gender;
	}
	
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public char getVote_chk() {
		return vote_chk;
	}
	
	public void setVote_chk(char vote_chk) {
		this.vote_chk = vote_chk;
	}
	
	public char getBoard_chk() {
		return board_chk;
	}
	
	public void setBoard_chk(char board_chk) {
		this.board_chk = board_chk;
	}
	
	public String getCreated_date() {
		return created_date;
	}
	
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
}


