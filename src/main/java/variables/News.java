package variables;

public class News extends Activities{
    private String author;
    //constructor
    public News(String a_name, String main_part, String author) {
        super.a_name=a_name;
        super.main_part=main_part;
        this.author = author;
    }
    //getters
    public String getAuthor() {
        return author;
    }
    public String getA_name() {
        return a_name;
    }
    public String getMain_part() {
        return main_part;
    }
    //setters
    public void setAuthor(String author) {
        this.author = author;
    }
    public void setA_name(String a_name) {
        this.a_name = a_name;
    }
    public void setMain_part(String main_part) {
        this.main_part = main_part;
    }

    @Override
    public String toString() {
        return "Activities{" +
                "a_name='" + a_name + '\'' +
                ", main_part='" + main_part + '\'' +
                ", main_part='" + author + '\'' +
                '}';
    }
}
