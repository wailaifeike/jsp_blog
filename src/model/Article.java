package model;

public class Article {
    private int id;
    private String title;
    private String content;
    private String detail;
    private int upcount;
    private int downcount;
    private int user_id;
    private String ctime;
    private int cid;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Article(String title, String content, String detail, int user_id,int cid){
        this.content = content;
        this.title = title;
        this.detail = detail;
        this.user_id = user_id;
        this.cid = cid;
    }

    public Article(String title,String content,String detail,String ctime,int user_id){
        this.content = content;
        this.title = title;
        this.detail = detail;
        this.ctime = ctime;
        this.user_id = user_id;
    }

    public Article(){

    }
    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", detail='" + detail + '\'' +
                ", upcount=" + upcount +
                ", downcount=" + downcount +
                ", user_id=" + user_id +
                '}';
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getUpcount() {
        return upcount;
    }

    public void setUpcount(int upcount) {
        this.upcount = upcount;
    }

    public int getDowncount() {
        return downcount;
    }

    public void setDowncount(int downcount) {
        this.downcount = downcount;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public String getCtime() {
        return ctime;
    }
}
