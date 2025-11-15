package main.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Match {
    private int matchId;
    private int teamId;
    private LocalDate mDate;
    private String location;
    private String Opposing_team;
    private List<MPerformance> performances;
    public Match(int matchId, int teamId, LocalDate mDate, String location, String opposing_team) {
        this.matchId = matchId;
        this.teamId = teamId;
        this.mDate = mDate;
        this.location = location;
        Opposing_team = opposing_team;
        this.performances = new ArrayList<>();
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public LocalDate getmDate() {
        return mDate;
    }

    public void setmDate(LocalDate mDate) {
        this.mDate = mDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOpposing_team() {
        return Opposing_team;
    }

    public void setOpposing_team(String opposing_team) {
        Opposing_team = opposing_team;
    }

    public List<MPerformance> getPerformances() {
        return performances;
    }

    public void setPerformances(List<MPerformance> performances) {
        this.performances = performances;
    }

}
