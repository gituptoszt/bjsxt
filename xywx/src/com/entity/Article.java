package com.entity;

public class Article extends Page {
    private  int id;
    private  String title;
    private  int user_id;
    private  String set_time;
    private  int type_id;
    private  int type2_id;
  
    private  int display;
	private  int hot;
    private  String txt;
    private  String img;
    private  int st;
    private  int shen;
    private  int bei_int;
    private  String bei_1;
    private  String bei_2;
    private  String bei_3;
    
    //type_name,type2_name这两个用来辅助查询,表中没有
    private  String type_name;
    private  String type2_name;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getSet_time() {
        return set_time;
    }

    public void setSet_time(String set_time) {
        this.set_time = set_time;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public int getType2_id() {
		return type2_id;
	}

	public void setType2_id(int type2_id) {
		this.type2_id = type2_id;
	}
	
	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}
	
    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSt() {
        return st;
    }

    public void setSt(int st) {
        this.st = st;
    }

    public int getShen() {
        return shen;
    }

    public void setShen(int shen) {
        this.shen = shen;
    }

    public int getBei_int() {
        return bei_int;
    }

    public void setBei_int(int bei_int) {
        this.bei_int = bei_int;
    }

    public String getBei_1() {
        return bei_1;
    }

    public void setBei_1(String bei_1) {
        this.bei_1 = bei_1;
    }

    public String getBei_2() {
        return bei_2;
    }

    public void setBei_2(String bei_2) {
        this.bei_2 = bei_2;
    }

    public String getBei_3() {
        return bei_3;
    }

    public void setBei_3(String bei_3) {
        this.bei_3 = bei_3;
    }

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getType2_name() {
		return type2_name;
	}

	public void setType2_name(String type2_name) {
		this.type2_name = type2_name;
	}

	
}