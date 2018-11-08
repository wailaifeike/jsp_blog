package model;

public class UserInfo {
    private int id;
    private String username;
    private String password;
    private String eamil;
    private String phone;

    public int getId() {
        return id;
    }

    public String getEamil() {
        return eamil;
    }

    public String getPassword() {
        return password;
    }

    public String getPhone() {
        return phone;
    }

    public String getUsername() {
        return username;
    }

    public void setEamil(String eamil) {
        this.eamil = eamil;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
