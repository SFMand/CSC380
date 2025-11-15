package main.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TrainingSession {
    private int sessionId;
    private int coachId;
    private LocalDate sDate;
    private String type;
    private List<SPerformance> performances;

    public TrainingSession(int sessionId, int coachId, LocalDate sDate, String type) {
        this.sessionId = sessionId;
        this.coachId = coachId;
        this.sDate = sDate;
        this.type = type;
        performances = new ArrayList<>();
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public int getCoachId() {
        return coachId;
    }

    public void setCoachId(int coachId) {
        this.coachId = coachId;
    }

    public LocalDate getsDate() {
        return sDate;
    }

    public void setsDate(LocalDate sDate) {
        this.sDate = sDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<SPerformance> getPerformances() {
        return performances;
    }

    public void setPerformances(List<SPerformance> performances) {
        this.performances = performances;
    }

}
