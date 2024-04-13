
package restaurant.Model;


public class ModelDishes {
    
    private int id_dish;
    private String nameDish;
    private double costDish;
    private String typeOfDish;
    private String statusOfDish;

    public ModelDishes(int id_dish, String nameDish, double costDish, String typeOfDish, String statusOfDish) {
        this.id_dish = id_dish;
        this.nameDish = nameDish;
        this.costDish = costDish;
        this.typeOfDish = typeOfDish;
        this.statusOfDish = statusOfDish;
    }

    public int getId_dish() {
        return id_dish;
    }

    public void setId_dish(int id_dish) {
        this.id_dish = id_dish;
    }

    public String getNameDish() {
        return nameDish;
    }

    public void setNameDish(String nameDish) {
        this.nameDish = nameDish;
    }

    public double getCostDish() {
        return costDish;
    }

    public void setCostDish(double costDish) {
        this.costDish = costDish;
    }

    public String getTypeOfDish() {
        return typeOfDish;
    }

    public void setTypeOfDish(String typeOfDish) {
        this.typeOfDish = typeOfDish;
    }

    public String getStatusOfDish() {
        return statusOfDish;
    }

    public void setStatusOfDish(String statusOfDish) {
        this.statusOfDish = statusOfDish;
    }
    
}


//hevgv