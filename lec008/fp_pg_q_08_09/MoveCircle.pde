class MoveCircle {
  private float x = 0;
  private float y = 0;
  private float vx = 0;
  private float vy = 0;
  private float rx = 0;
  private float ry = 0;
  private float w = 0;
  private float h = 0;
  private float d = 20;
  private boolean flg = true;
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
    this.x = rX;
  }
  public float getX(){
    return this.x;
  }
  public void setY(float rY){
    this.y = rY;
  }
  public float getY(){
    return this.y;
  }

  public void setVx(float rVx){
    this.vx = rVx;
  }
  public float getVx(){
    return this.vx;
  }
  public void setVy(float rVy){
    this.vy = rVy;
  }
  public float getVy(){
    return this.vy;
  }

  public void setRx(float rRx){
    this.rx = rRx;
  }
  public float getRx(){
    return this.rx;
  }
  public void setRy(float rRy){
    this.ry = rRy;
  }
  public float getRy(){
    return this.ry;
  }
  public void setMinX(float rMinX){
    this.minX = rMinX;
  }
  public float getMinX(){
    return this.minX;
  }
  public void setMaxX(float rMaxX){
    this.maxX = rMaxX;
  }
  public float getMaxX(){
    return this.maxX;
  }
  public float getMinY(){
    return this.minY;
  }
  public void setMaxY(float rMaxY){
    this.maxY = rMaxY;
  }
  public float getMaxY(){
    return this.maxY;
  }

  public void setRgb(float red, float green, float blue){
    this.r = red;
    this.g = green;
    this.b = blue;
  }

  MoveCircle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float pd){
    this.x = px;
    this.y = py;
    this.vx = pvx;
    this.vy = pvy;
    this.r = red;
    this.g = green;
    this.b = blue;
    this.w = pw;
    this.h = ph;
    this.d = pd;
    this.minX = -(w/2) + d/2;
    this.maxX = (w/2) - d/2;
    this.minY = -(h/2) + d/2;
    this.maxY = (h/2) - d/2;
    this.rx = (this.vx * this.getSpeedRate());
    this.ry = (this.vy * this.getSpeedRate());
  }

  public void move(){
    float v = 0;
    float theta = 0;
    if(this.x <= this.minX || this.maxX <= this.x || this.y <= this.minY || this.maxY <= this.y){
      if(this.x <= this.minX){
        this.x = this.minX;
      } else if(this.maxX <= this.x) {
        this.x = this.maxX;
      }
      if(this.y <= this.minY) {
        this.y = this.minY;
      } else if(this.maxY <= this.y) {
        this.y = this.maxY;
      }
      // 速度のx成分とy成分からスカラーを導出する処理
      this.tmpRx = this.rx;
      this.tmpRy = this.ry;
      v = (sqrt(sq(this.rx) + sq(this.ry)));
      /*if(this.x <= this.minX){
        if(this.tmpRx < 0 && this.tmpRy < 0){
          theta = (360 - degrees(acos(abs(this.tmpRx)/v)));
        } else {
          theta = degrees(acos(abs(this.tmpRx)/v));
        }
      } else if(this.maxX <= this.x){
        if(0 < this.tmpRx && this.tmpRy < 0){
          theta = (180 + degrees(acos(abs(this.tmpRx)/v)));
        } else {
          theta = (180 - degrees(acos(abs(this.tmpRx)/v)));
        }
      } else if(y <= minY) {
        if(this.tmpRx < 0 && this.tmpRy < 0){
          theta = (180 - degrees(asin(abs(this.tmpRy)/v)));
        } else {
          theta = (degrees(asin(abs(this.tmpRy)/v)));
        }
      } else if(this.maxY <= this.y) {
        if(this.tmpRx < 0 && 0 < this.tmpRy){
          theta = (180 + degrees(asin(abs(this.tmpRy)/v)));
        } else {
          theta = (360 - degrees(asin(abs(this.tmpRy)/v)));
        }
      }
      this.rx = (v * cos(radians(this.theta)));*/
      //this.ry = (v * sin(radians(this.theta)));
      this.ry = v;
    }
    this.x += this.rx;
    this.y += this.ry;
  }

  public void draw(){
    noStroke();
    fill(this.r, this.g, this.b);
    ellipse(this.x, this.y, this.d, this.d);
  }

  private float getSpeedRate(){
    return random(4, 10);
  }
}
