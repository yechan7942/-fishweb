package global.sesoc.good.vo;

import lombok.Data;

@Data
public class GuestBook {
	
	private int num;
	private String name;
	private String password;
	private String contents;
	private String inputdate;
}
