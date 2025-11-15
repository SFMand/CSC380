package main.model;

public class MPerformance {
    private int matchId;
    private int playerId;
    private String mStatus;
    private int playerRating;

    public MPerformance(int matchId, int playerId, String mStatus, int playerRating) {
        this.matchId = matchId;
        this.playerId = playerId;
        this.mStatus = mStatus;
        this.playerRating = playerRating;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public String getmStatus() {
        return mStatus;
    }

    public void setmStatus(String mStatus) {
        this.mStatus = mStatus;
    }

    public int getPlayerRating() {
        return playerRating;
    }

    public void setPlayerRating(int playerRating) {
        this.playerRating = playerRating;
    }

}
