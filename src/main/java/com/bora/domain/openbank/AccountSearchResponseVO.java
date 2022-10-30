package com.bora.domain.openbank;

import java.util.List;

//2.2.3. 등록계좌조회 API 응답 데이터
public class AccountSearchResponseVO {
	private String api_tran_id; //거래고유번호(API)
	private String rsp_code; //응답코드(API)
	private String rsp_message; //응답메세지
	private String api_tran_dtm; //거래일시(밀리세컨드)
	private String user_name; //사용자명
	private String res_cnt; //사용자등록계좌 개수
	private List<AccountVO> res_list; //사용자 등록계좌 목록
	//추가
	private String acct_alias; //계좌별명
	private String bank_name; //출금(개설)기관명
	private String acct_num; //계좌번호
//	private String acct_type; //계좌종류 1:수시입출금, 2:예적금, 6:수익증권, T:종합계좌
	//계좌종류는 2020.12월(실시예정)부터 등록하는 계좌에 대해 추가로 제공하는 정보로, 그 이전에 등록된 계좌에 대해서는 해당 정보가 제공되지 않을 수 있음.
	private String acct_state; //계좌상태(01:사용, 09:해지)	
	
	
	public String getApi_tran_id() {
		return api_tran_id;
	}
	public void setApi_tran_id(String api_tran_id) {
		this.api_tran_id = api_tran_id;
	}
	public String getRsp_code() {
		return rsp_code;
	}
	public void setRsp_code(String rsp_code) {
		this.rsp_code = rsp_code;
	}
	public String getRsp_message() {
		return rsp_message;
	}
	public void setRsp_message(String rsp_message) {
		this.rsp_message = rsp_message;
	}
	public String getApi_tran_dtm() {
		return api_tran_dtm;
	}
	public void setApi_tran_dtm(String api_tran_dtm) {
		this.api_tran_dtm = api_tran_dtm;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getRes_cnt() {
		return res_cnt;
	}
	public void setRes_cnt(String res_cnt) {
		this.res_cnt = res_cnt;
	}
	public List<AccountVO> getRes_list() {
		return res_list;
	}
	public void setRes_list(List<AccountVO> res_list) {
		this.res_list = res_list;
	}
	public String getAcct_alias() {
		return acct_alias;
	}
	public void setAcct_alias(String acct_alias) {
		this.acct_alias = acct_alias;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAcct_num() {
		return acct_num;
	}
	public void setAcct_num(String acct_num) {
		this.acct_num = acct_num;
	}
	public String getAcct_state() {
		return acct_state;
	}
	public void setAcct_state(String acct_state) {
		this.acct_state = acct_state;
	} 
	
}
