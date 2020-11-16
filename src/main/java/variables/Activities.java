package variables;

public abstract class Activities {
    protected String a_name;
    protected String main_part;

    @Override
    public String toString() {
        return "Activities{" +
                "a_name='" + a_name + '\'' +
                ", main_part='" + main_part + '\'' +
                '}';
    }
}
