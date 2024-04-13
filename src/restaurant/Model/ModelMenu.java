/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package restaurant.Model;

import javax.swing.Icon;

/**
 *
 * @author anh152003
 */
public class ModelMenu {
    private Icon icon;
    private String menuName;
    private String subMenu[];

    public ModelMenu() {
    }

    public ModelMenu(Icon icon, String menuName, String[] subMenu) {
        this.icon = icon;
        this.menuName = menuName;
        this.subMenu = subMenu;
    }

    public Icon getIcon() {
        return icon;
    }

    public String getMenuName() {
        return menuName;
    }

    public String[] getSubMenu() {
        return subMenu;
    }

    public void setIcon(Icon icon) {
        this.icon = icon;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public void setSubMenu(String[] subMenu) {
        this.subMenu = subMenu;
    }
    
    
}
