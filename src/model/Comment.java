package model;

public class Comment {
        private  String text;
        private String ctime;

    public void setText(String text) {
        this.text = text;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "text='" + text + '\'' +
                ", ctime='" + ctime + '\'' +
                ", aid=" + aid +
                ", uid=" + uid +
                '}';
    }

    public Comment() {
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getText() {
        return text;
    }

    public String getCtime() {
        return ctime;
    }

    public int getAid() {
        return aid;
    }

    public int getUid() {
        return uid;
    }

    private int aid;
        private int uid;


}
