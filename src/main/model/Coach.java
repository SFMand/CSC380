package main.model;

public class Coach {
    private int coachId;
    private int teamId;
    private String cName;
    private String department;
    
    
    public Coach(int coachId, int teamId, String cName, String department) {
        this.coachId = coachId;
        this.teamId = teamId;
        this.cName = cName;
        this.department = department;
    }


    public int getCoachId() {
        return coachId;
    }


    public void setCoachId(int coachId) {
        this.coachId = coachId;
    }


    public int getTeamId() {
        return teamId;
    }


    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }


    public String getcName() {
        return cName;
    }


    public void setcName(String cName) {
        this.cName = cName;
    }


    public String getDepartment() {
        return department;
    }


    public void setDepartment(String department) {
        this.department = department;
    }

    
}
