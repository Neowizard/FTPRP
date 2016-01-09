package Model;

import java.io.Serializable;
import java.util.ArrayList;

public class Function implements Serializable {

    private static final long serialVersionUID = 1L;
    public String Name;
    public ArrayList<String> Params;

    public Function() {
        this("Default name");
    }

    public Function(String name) {
        this.Name = name;
        this.Params = new ArrayList<String>();
    }

    public Function(String name, ArrayList<String> params) {
        this.Name = name;
        this.Params = params;
    }

    public String toString() {
        String repString = Name + "\nParameters:";
        for (String param : Params) {
            repString = repString + "\n" + param;
        }
        return repString;
    }
}
