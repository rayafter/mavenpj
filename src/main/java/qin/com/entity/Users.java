package qin.com.entity;

public class Users {
    private Long id;
    private String name;
    private String pass;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass == null ? null : pass.trim();
    }
}