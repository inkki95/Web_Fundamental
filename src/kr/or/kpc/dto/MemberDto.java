package kr.or.kpc.dto;

public class MemberDto {
	private int num;
	private String name;
	private String addr;
	//default constructor
	//alt + shift + s => c
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	//alt + shift + s => o
	public MemberDto(int num, String name, String addr) {
		this.num = num;
		this.name = name;
		this.addr = addr;
	}
	//alt + shift + s => r => tap enter tap tap tap tap enter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}

