package or.com.menu;

public class MenuBean {
	private Long menu_id;
	private String name;
	private String created_date;
	
	public Long getMenu_id() {
		return menu_id;
	}
	
	public void setMenu_id(Long menu_id) {
		this.menu_id = menu_id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCreated_date() {
		return created_date;
	}
	
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}	
}
