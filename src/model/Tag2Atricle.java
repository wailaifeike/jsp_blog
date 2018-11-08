package model;

public class Tag2Atricle {
    private int id;
    private int tid;
    private int aid;

    public Tag2Atricle() {
    }

    public Tag2Atricle(int id, int tid, int aid) {
        this.id = id;
        this.tid = tid;
        this.aid = aid;
    }

    @Override
    public String toString() {
        return "Tag2Atricle{" +
                "id=" + id +
                ", tid=" + tid +
                ", aid=" + aid +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }
}
