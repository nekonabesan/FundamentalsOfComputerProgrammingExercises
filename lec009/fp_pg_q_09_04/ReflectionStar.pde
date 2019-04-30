class ReflectionStar {
  private float x = 0;
  private float y = 0;
  private float vx = 0;
  private float vy = 0;
  private float rx = 0;
  private float ry = 0;
  private float r;
  private float g;
  private float b;
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
  private float CircumscribedCircle = 0;
  private float InscribedCircle = 0;
  private float p = 0;
  private float rotate = PI/2;
  private float rate = 0.75;

  public float getX(){
      return x;
  }
  public float getY(){
      return y;
  }
  public void setR(float red){
    r = red;
  }
  public float getR(){
    return r;
  }
  public void setG(float green){
    g = green;
  }
  public float getG(){
    return g;
  }
  public void setB(float blue){
    b = blue;
  }
  public float getB(){
    return b;
  }
  public float getCircumscribedCircle(){
    return CircumscribedCircle;
  }
  public float getInscribedCircle(){
    return InscribedCircle;
  }
  public float getP(){
    return p;
  }
  public void setRotate(float protate){
    rotate = protate;
  }
  public float getRotate(){
    return rotate;
  }

  public void setMinX(float pMinX){
    minX = pMinX;
  }
  public float getMinX(){
    return minX;
  }
  public void setMaxX(float pMaxX){
    maxX = pMaxX;
  }
  public float getMaxX(){
    return maxX;
  }
  public void setMinY(float pMinY){
    minY = pMinY;
  }
  public float getMinY(){
    return minY;
  }
  public void setMaxY(float pMaxY){
    maxY = pMaxY;
  }
  public float getMaxY(){
    return maxY;
  }

  ReflectionStar(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle, float pInscribedCircle,
    int pp, float protate, float prate){
    x = px;
    y = py;
    vx = pvx;
    vy = pvy;
    r = red;
    g = green;
    b = blue;
    w = pw;
    h = ph;
    d = pd;
    CircumscribedCircle = pCircumscribedCircle;
    InscribedCircle = pInscribedCircle;
    p = pp;
    rotate = protate;
    rate = prate;
    setup();
  }


  private void setup() {
    minX = d;
    maxX = w - d;
    minY = d;
    maxY = h - d;
    y = h/2;
    rx = (vx * getSpeedRate());
    ry = (vy * getSpeedRate());
  }

  void move(){
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

  private float getSpeedRate(){
    return random(4, 10);
  }
}
