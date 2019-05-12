class Block {
  private float x = 0;
  private float y = 0;
  private float r = 0;
  private float g = 0;
  private float b = 0;
  private float bWidth = 0;
  private float bHeight = 0;
  private boolean visible = true;

  public float getX(){
      return this.x;
  }
  public float getY(){
      return this.y;
  }
  public void setR(float red){
    this.r = red;
  }
  public float getR(){
    return this.r;
  }
  public void setG(float green){
    this.g = green;
  }
  public float getG(){
    return this.g;
  }
  public void setB(float blue){
    this.b = blue;
  }
  public float getB(){
    return this.b;
  }
  public float getBwidth(){
    return this.bWidth;
  }
  public float getBheight(){
    return this.bHeight;
  }
  public boolean getVisible(){
    return this.visible;
  }


  Block(float x, float y, float r, float g, float b, float bWidth, float bHeight){
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.setup();
  }

  private void setup(){

  }

  public void draw(){
    stroke(255, 255, 255);
    fill(this.r, this.g, this.b);
    pushMatrix();
    rotate(0);
    beginShape();
    vertex(this.x, this.y);
    vertex(this.x + this.bWidth, this.y);
    vertex(this.x + this.bWidth, this.y + this.bHeight);
    vertex(this.x, this.y + this.bHeight);
    endShape(CLOSE);
    popMatrix();
  }

  public float[] hit(float bx, float by, float tmpRx, float tmpRy){
    float[] array = new float[2];
    float theta = 0;
    float v = v = (sqrt(sq(tmpRx) + sq(tmpRy)));
    boolean flg = false;
    /*if(this.x <= bx && bx <= this.x + this.bWidth
      && y + this.bHeight / 2 <= by
      && by <= (this.bHeight/this.bWidth) * x + y && by <= -(this.bHeight/this.bWidth) * x + y) {
      if(tmpRx < 0 && 0 < tmpRy){
        theta = (180 + degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (360 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    } else if (this.x <= bx && bx <= (this.x + this.bWidth)
      && by <= (y + this.bHeight)
      && (this.bHeight/this.bWidth) * x + y <= by  && -(this.bHeight/this.bWidth) * x + y <= by) {
      if(tmpRx < 0 && tmpRy < 0){
        theta = (180 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    } else if(this.y <= by && by < this.y + this.bHeight
      && -(this.bHeight/this.bWidth) * x + y <= bx && bx < (this.bHeight/this.bWidth) * x + y) {
      if(0 < tmpRx && tmpRy < 0){
        theta = (180 + degrees(acos(abs(tmpRx)/v)));
        flg = true;
      } else {
        theta = (180 - degrees(acos(abs(tmpRx)/v)));
        flg = true;
      }
    } else if(this.y <= by && by < this.y + this.bHeight
      && bx < -(this.bHeight/this.bWidth) * x + y  && (this.bHeight/this.bWidth) * x + y < bx) {
      if(tmpRx < 0 && tmpRy < 0){
        theta = (360 - degrees(acos(abs(tmpRx)/v)));
        flg = true;
      } else {
        theta = degrees(acos(abs(tmpRx)/v));
        flg = true;
      }
    }*/
    if(this.x <= bx && bx <= this.x + this.bWidth
      && this.y <= by && by <= this.y + this.bHeight
      && this.visible == true){
      if(tmpRx < 0 && tmpRy < 0){
        theta = (180 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    }
    if (flg) {
      array[0] = (v * cos(radians(theta)));
      array[1] = (v * sin(radians(theta)));
      this.visible = false;
    } else {
      array[0] = 99999;
      array[1] = 99999;
    }
    return array;
  }
}
