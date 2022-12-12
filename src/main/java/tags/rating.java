/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tags;

import java.io.IOException;
import java.io.StringWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author pawel
 */
public class rating extends SimpleTagSupport {

    private int value;

    public void setValue(String val) {
        this.value = Integer.parseInt(val);
    }

    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        String output = "";
        for (int i = 0; i < value; i++) {
            output += "⭐";
        }
        out.println(output);

    }
}
