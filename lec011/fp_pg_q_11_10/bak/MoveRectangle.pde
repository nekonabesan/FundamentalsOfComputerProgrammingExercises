class MoveRectangle {
  private float x = 0;
  private float y = 0;
  private float vx = 0;
  private float vy = 0;
  private float rx = 0;
  private float ry = 0;
  private float w = 0;
  private float h = 0;
  private float rw = 20;
  private float rh = 20;
  private boolean flg = true;
  private float v = 0;
  private float theta = 0;
  private float minX = 0;
  private float maxX = 0;
  private float minY = 0;
  private float maxY = 0;
  private float tmpRx = 0;
  private float tmpRy = 0;
  private float r = 0;
  private float g = 0;
  private float b = 0;

  public void setX(float rX){
    x = rX;
  }
  public float getX(){
    return x;
  }
  public void setY(float rY){
    y = rY;
  }
  public float getY(){
    return y;
  }
  public void setRx(float rRx){
    rx = rRx;
  }
  public float getRx(){
    return rx;
  }
  public void setRy(float rRy){
    ry = rRy;
  }
  public float getRy(){
    return ry;
  }
  public float getMinX(){
    return minX;
  }
  public float getMaxX(){
    return maxX;
  }

  MoveRectangle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float prw, float prh){
    x = px;
    y = py;
    vx = pvx;
    vy = pvy;
    r = red;
    g = green;
    b = blue;
    w = pw;
    h = ph;
    rw = prw;
    rh = prh;
    minX = -(w/2) + rw/2;
    maxX = (w/2) - rw/2;
    minY = -(h/2) + rh/2;
    maxY = (h/2) - rh/2;
    rx = (vx * getSpeedRate());
    ry = (vy * getSpeedRate());
    rectMode(CENTER);
  }

  public void move(){
    if(x <= minX || maxX <= x || y <= minY || maxY <= y){
      if(x <= minX){
        x = minX;
      } else if(maxX <= x) {
        x = maxX;
      }
      if(y <= minY) {
        y = minY;
      } else if(maxY <= y) {
        y = maxY;
      }
      // 速度のx成分とy成分からスカラーを導出する処理
      tmpRx = rx;
      tmpRy = ry;
      v = (sqrt(sq(rx) + sq(ry)));
      if(x <= minX){
        if(tmpRx < 0 && tmpRy < 0){
          theta = (360 - degrees(acos(abs(tmpRx)/v)));
        } else {
          theta = degrees(acos(abs(tmpRx)/v));
        }
      } else if(maxX <= x){
        if(0 < tmpRx && tmpRy < 0){
          theta = (180 + degrees(acos(abs(tmpRx)/v)));
        } else {
          theta = (180 - degrees(acos(abs(tmpRx)/v)));
        }
      } else if(y <= minY) {
        if(tmpRx < 0 && tmpRy < 0){
          theta = (180 - degrees(asin(abs(tmpRy)/v)));
        } else {
          theta = (degrees(asin(abs(tmpRy)/v)));
        }
      } else if(maxY <= y) {
        if(tmpRx < 0 && 0 < tmpRy){
          theta = (180 + degrees(asin(abs(tmpRy)/v)));
        } else {
          theta = (360 - degrees(asin(abs(tmpRy)/v)));
        }
      }
      rx = (v * cos(radians(theta)));
      ry = (v * sin(radians(theta)));
    }
    x += rx;
    y += ry;
  }

  public void draw(){
    noStroke();
    fill(r, g, b);
    rect(x, y, rw, rh);
  }

  private float getSpeedRate(){
    return random(4, 10);
  }
}
