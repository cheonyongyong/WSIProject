package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ScheduleVO {
	private String schNo;
	private String schTitle;
<<<<<<< HEAD
	private String schContent;
	private String schSdate;
	private String schEdate;
	private String scholdSdate;
	private String scholdEdate;
	private String schColor;
	private String schDept;
	private String empNo;
=======
	private String schContent = "q";
	private String schSdate;
	private String schEdate;
	private String scholdSdate;
	private String scholdschEdate;
	private String schColor;
	private String schDept = "q";
	private String empNo = "q";
>>>>>>> branch 'master' of https://github.com/cheonyongyong/finalProject

}
