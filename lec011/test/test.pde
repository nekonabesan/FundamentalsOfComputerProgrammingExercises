import java.awt.TextField;
import java.awt.Rectangle;
import javax.swing.JPanel;
import processing.awt.PSurfaceAWT;


private But but = null;
private TextField input = new TextField("");
private JPanel panel = new JPanel();

void setup() {
  size(300,100);
  textFont(createFont("Harrington", 16));
  this.panel.setLayout(null);
  this.input.setBounds(30,50,150,20);
  this.panel.add(input);
  this.but = new But("save", 200, 50);
}

void mouseClicked(){
  this.but.clicked(input.getText());
}

void draw() {
  background(255);
  this.but.draw();
  textAlign(LEFT);
  text("Input␣your␣name␣and␣click␣save␣button!!", 10, 30);
  if(this.but.getStatus()) text(this.but.getTextInput(), 10, 90);
}

class But extends Rectangle {
  private String str, textInput;
  private boolean status;

  But(String s, int x, int y){
    str = new String(s);
    width = (int)(textWidth(str)) + 8;
    height = (int)(textAscent()) + 8;
    this.x = x; this.y = y;
    status = false; // just for sample program.
    setRect(this.x, this.y, width, height);
  }

  public boolean getStatus(){
    return status;
  }

  public String getTextInput(){
    return textInput;
  }

  public boolean clicked(String s){
    if(contains(mouseX, mouseY)){
      status = true; // just for sample program.
      textInput = new String(s);
      return true;
    } else {
      return false;
    }
  }

  public void draw(){
    stroke(0);
    fill(255);
    rect(x, y, width, height);
    fill(0);
    textAlign(CENTER);
    text(str, x + width / 2, y + height / 2 + 4);
    noStroke();
  }
}
