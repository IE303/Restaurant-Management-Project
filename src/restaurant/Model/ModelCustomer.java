
package restaurant.Model;

public class ModelCustomer {
    private String id;
    private String name;
    private String numPhone;
    private String joinDate;

    public ModelCustomer(String id, String name, String numPhone, String joinDate) {
        this.id = id;
        this.name = name;
        this.numPhone = numPhone;
        this.joinDate = joinDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumPhone() {
        return numPhone;
    }

    public void setNumPhone(String numPhone) {
        this.numPhone = numPhone;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }
    
    
}

