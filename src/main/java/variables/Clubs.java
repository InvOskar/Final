package variables;

import java.util.ArrayList;

public class Clubs{
    private String club_name;
    private ArrayList<Users> members;

    public Clubs(String club_name) {
        this.club_name = club_name;
    }

    public String getClub_name() {
        return club_name;
    }

}
