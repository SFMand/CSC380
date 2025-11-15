package main.model;

import java.util.List;
import java.util.ArrayList;

public class Player {
    private int playerId;
    private String pName;
    private String nationality;
    private List<String> positions;

    public Player(int playerId, String pName, String nationality) {
        this.playerId = playerId;
        this.pName = pName;
        this.nationality = nationality;
        this.positions = new ArrayList<>();
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public List<String> getPositions() {
        return positions;
    }

    public void setPositions(List<String> positions) {
        this.positions = positions;
    }

}
