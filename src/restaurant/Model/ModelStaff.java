/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package restaurant.Model;



public class ModelStaff {
    private int id_NV;
    private String nameNV;
    private String beginWorkDay;
    private int numPhoneNV;
    private String status;

    public ModelStaff(int id_NV, String nameNV, String beginWorkDay, int numPhoneNV, String status) {
        this.id_NV = id_NV;
        this.nameNV = nameNV;
        this.beginWorkDay = beginWorkDay;
        this.numPhoneNV = numPhoneNV;
        this.status = status;
    }

    public int getId_NV() {
        return id_NV;
    }

    public void setId_NV(int id_NV) {
        this.id_NV = id_NV;
    }

    public String getNameNV() {
        return nameNV;
    }

    public void setNameNV(String nameNV) {
        this.nameNV = nameNV;
    }

    public String getBeginWorkDay() {
        return beginWorkDay;
    }

    public void setBeginWorkDay(String beginWorkDay) {
        this.beginWorkDay = beginWorkDay;
    }

    public int getNumPhoneNV() {
        return numPhoneNV;
    }

    public void setNumPhoneNV(int numPhoneNV) {
        this.numPhoneNV = numPhoneNV;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
