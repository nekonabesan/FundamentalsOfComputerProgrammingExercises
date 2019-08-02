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

  public void setX(float x){
    this.x = x;
  }
  public float getX(){
    return this.x;
  }
  public void setY(float y){
    this.y = y;
  }
  public float getY(){
    return this.y;
  }
  public void setRx(float rx){
    this.rx = rx;
  }
  public float getRx(){
    return this.rx;
  }
  public void setRy(float ry){
    this.ry = ry;
  }
  public float getRy(){
    return this.ry;
  }
  public float getMinX(){
    return this.minX;
  }
  public float getMaxX(){
    return this.maxX;
  }

  MoveRectangle(float x, float y, float vx, float vy, float r, float g, float b, float w, float h, float rw, float rh){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.g = g;
    this.b = b;
    this.w = w;
    this.h = h;
    this.rw = rw;
    this.rh = rh;
    this.minX = -(this.w/2) + this.rw/2;
    this.maxX = (this.w/2) - this.rw/2;
    this.minY = -(this.h/2) + this.rh/2;
    this.maxY = (this.h/2) - this.rh/2;
    this.rx = (this.vx * this.getSpeedRate());
    this.ry = (this.vy * this.getSpeedRate());
    rectMode(CENTER);
  }

  public void move(){
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
      this.v = (sqrt(sq(this.rx) + sq(this.ry)));
      if(this.x <= this.minX){
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (360 - degrees(acos(abs(this.tmpRx)/v)));
        } else {
          this.theta = degrees(acos(abs(this.tmpRx)/this.v));
        }
      } else if(this.maxX <= this.x){
        if(0 < this.tmpRx && this.tmpRy < 0){
          this.theta = (180 + degrees(acos(abs(this.tmpRx)/this.v)));
        } else {
          this.theta = (180 - degrees(acos(abs(this.tmpRx)/this.v)));
        }
      } else if(this.y <= this.minY) {
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (180 - degrees(asin(abs(this.tmpRy)/this.v)));
        } else {
          this.theta = (degrees(asin(abs(this.tmpRy)/this.v)));
        }
      } else if(this.maxY <= this.y) {
        if(this.tmpRx < 0 && 0 < this.tmpRy){
          this.theta = (180 + degrees(asin(abs(this.tmpRy)/v)));
        } else {
          this.theta = (360 - degrees(asin(abs(this.tmpRy)/this.v)));
        }
      }
      this.rx = (this.v * cos(radians(this.theta)));
      this.ry = (this.v * sin(radians(this.theta)));
    }
    this.x += this.rx;
    this.y += this.ry;
  }

  public void draw(){
    noStroke();
    fill(this.r, this.g, this.b);
    rect(this.x, this.y, this.rw, this.rh);
  }

  private float getSpeedRate(){
    return random(4, 10);
  }
}
