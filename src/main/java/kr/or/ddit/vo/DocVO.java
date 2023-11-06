package kr.or.ddit.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class DocVO {

	private String docNo;
	private String empNo;
	private String docClfCode;
	private String docTitle;
	private String docCont;
	private Date docDate;
	private String docStat;
	private String empName;
	private String empDept;
	private String peNo;
	private String peCont; 
	private String peDept; 
	private String peName; 
	private String peDate; 
	private String peAmt;
	private String peBank; 
	private String peAcct;
	private String peEmpName;
	private String peClf; 
	private String peConf;
	private int count;
	private String aprJob;
	private String aprEmpNo;
	private int aprNo;
	private String docClfFile;
	private String aprStat;
	private Date aprDate;
	private String aprRegConf;
	private String aprRejRsn;
	private String docClfName;
	private Date docConfDate;
	private String aprName;
}
