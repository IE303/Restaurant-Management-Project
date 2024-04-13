/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package restaurant.Model;

/**
 *
 * @author anh152003
 */
public class ModelBan {
    private int ID;
    private String name; 
    private String status; 
    private int amountOfPeople;
    private String position;

    public ModelBan() {
    }

    public ModelBan(int ID, String name, String status, int amountOfPeople, String position) {
        this.ID = ID;
        this.name = name;
        this.status = status;
        this.amountOfPeople = amountOfPeople;
        this.position = position;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getStatus() {
        return status;
    }

    public int getAmountOfPeople() {
        return amountOfPeople;
    }

    public String getPosition() {
        return position;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAmountOfPeople(int amountOfPeople) {
        this.amountOfPeople = amountOfPeople;
    }

    public void setPosition(String position) {
        this.position = position;
    }
    
    
}
