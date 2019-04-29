class MoveCircle {
  private float x = 0;
  private float y = 0;
  private float vx = 1;
  private float vy = 1;
  private float rx = (vx * getSpeedRate());
  private float ry = (vy * getSpeedRate());
  private float w = 0;
  private float h = 0;
  private float d = 20;
  private boolean flg = true;
  private float v = 0;
  private float theta = 0;
  private float minX = 0;
  private float maxX = 0;
  private float minY = 0;
  private float maxY = 0;
  private float tmpRx = 0;
  private float tmpRy = 0;
  private int r = 0;
  private int g = 0;
  private int b = 0;


  MoveCircle(int red, int green, int blue, float w, float h, float d){
    r = red;
    g = green;
    b = blue;
    d = d;
    h = h;
    w = w;
    minX = -(w/2) + d/2;
    maxX = (w/2) - d/2;
    minY = -(h/2) + d/2;
    maxY = (h/2) - d/2;
  }

  public void drawCircle(){
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
    noStroke();
    fill(r, g, b);
    ellipse(x, y, d, d);
    x += rx;
    y += ry;
  }

  private float getSpeedRate(){
    return random(4, 10);
  }
}
