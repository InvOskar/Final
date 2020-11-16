package variables;

public class Users {
    private int id;
    private String name;
    private String surname;
    private String major;
    private int group;
    private int year;

    //constructor
    public Users(int id, String name, String surname, String major, int group, int year) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.major = major;
        this.group = group;
        this.year = year;
    }
    //getters
    public int getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getSurname() {
        return surname;
    }
    public String getMajor() {
        return major;
    }
    public int getGroup() {
        return group;
    }
    public int getYear() {
        return year;
    }
    //setters
    public void setName(String name) {
        this.name = name;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public void setMajor(String major) {
        this.major = major;
    }
    public void setGroup(int group) {
        this.group = group;
    }
    public void setYear(int year) {
        this.year = year;
    }
}
