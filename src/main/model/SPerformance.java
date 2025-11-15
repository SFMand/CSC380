package main.model;

public class SPerformance {
    private int sessionId;
    private int playerId;
    private String sStatus;
    private int playerRating;

    public SPerformance(int sessionId, int playerId, String sStatus, int playerRating) {
        this.sessionId = sessionId;
        this.playerId = playerId;
        this.sStatus = sStatus;
        this.playerRating = playerRating;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public String getsStatus() {
        return sStatus;
    }

    public void setsStatus(String sStatus) {
        this.sStatus = sStatus;
    }

    public int getPlayerRating() {
        return playerRating;
    }

    public void setPlayerRating(int playerRating) {
        this.playerRating = playerRating;
    }

}
