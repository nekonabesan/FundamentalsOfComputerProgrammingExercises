import java.awt.Rectangle;
import java.awt.TextField;

class Button extends Rectangle {
  private float x;
  private float y;
  private float w = 100;
  private float h = 20;
  private String str;
  private String textInput;
  private boolean status;

  public boolean getStatus(){
    return this.status;
  }
  public String getTextInput(){
    return this.textInput;
  }

  Button(String s, float x, float y){
    this.str = new String(s);
    width = (int)(textWidth(str)) + 8;
    height = (int)(textAscent()) + 8;
    this.x = x;
    this.y = y;
    this.status = false;
    this.setRect(this.x, this.y, width, height);
    this.setup();
  }

  private void setup(){
  }

  public boolean clicked(String s){
    if(this.contains(mouseX, mouseY)){
      this.status = true;
      this.textInput = new String(s);
      return true;
    } else {
      return false;
    }
  }

  public void draw(){
    stroke(0);
    fill(255, 255, 255);
    rect(this.x, this.y, this.w, this.h);
    fill(0);
    textAlign(CENTER);
    text(this.str, this.x + this.w / 2, this.y + this.h / 2 + 4);
    noStroke();
  }
}
