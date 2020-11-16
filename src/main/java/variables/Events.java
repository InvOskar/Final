package variables;

public class Events extends Activities{
    private String date_time;
    private String location;
    //constructor
    public Events(String a_name, String main_part, String date_time, String location){
        super.a_name=a_name;
        super.main_part=main_part;
        this.date_time=date_time;
        this.location=location;
    }
    //getters
    public String getDate_time() {
        return date_time;
    }
    public String getLocation() {
        return location;
    }
    public String getA_name() {
        return a_name;
    }
    public String getMain_part() {
        return main_part;
    }
    //setters
    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }
    public void setLocation(String location) {
        this.location = location;
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
                ", main_part='" + date_time + '\'' +
                ", main_part='" + location + '\'' +
                '}';
    }
}
