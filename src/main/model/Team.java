package main.model;

public class Team {
    private int teamId;
    private String tName;

    public Team(int teamId, String tName) {
        this.teamId = teamId;
        this.tName = tName;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public String getTName() {
        return tName;
    }

    public void setTName(String tName) {
        this.tName = tName;
    }

}
