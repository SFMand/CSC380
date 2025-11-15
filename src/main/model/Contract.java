package main.model;

import java.time.LocalDate;

public class Contract {
    private int contractId;
    private int playerId;
    private LocalDate startDate;
    private LocalDate endDate;
    private int salary;

    public Contract(int contractId, int playerId ,LocalDate startDate, LocalDate endDate, int salary) {
        this.contractId = contractId;
        this.playerId = playerId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.salary = salary;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }
    

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

}
