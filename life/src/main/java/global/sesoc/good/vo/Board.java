package global.sesoc.good.vo;

import lombok.Data;

@Data
public class Board {
	
	int boardnum;
	String id;
	String title;
	String contents;
	String inputdate;
	int hits;
}
