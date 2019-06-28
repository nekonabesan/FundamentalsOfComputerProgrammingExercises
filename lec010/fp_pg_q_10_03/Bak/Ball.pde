class Ball {
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
  private int p = 0;
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
  public void setP(int rP){
    p = rP;
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

  Ball(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protate, float prate){
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
      this.CircumscribedCircle = pCircumscribedCircle;
      this.p = pp;
      this.rotate = protate;
      this.rate = prate;
      /*minX = -(w/2) + rw/2;
      maxX = (w/2) - rw/2;
      minY = -(h/2) + rh/2;
      maxY = (h/2) - rh/2;*/
      /*rx = (vx * getSpeedRate());
      ry = (vy * getSpeedRate());*/
  }

  private void setup() {
    this.minX = d;
    this.maxX = w - d;
    this.minY = d;
    this.maxY = h - d;
    this.y = h/2;
    this.rx = (this.vx * getSpeedRate());
    this.ry = (this.vy * getSpeedRate());
  }

  private void draw(){
    pushMatrix();
    rotate(this.rotate);
    beginShape();
    for (int i = 1; i <= p; i++) {
      vertex(this.CircumscribedCircle * cos(radians(360 * i/p)), this.CircumscribedCircle * sin(radians(360 * i/p)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  private void move(){
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
      if(x <= minX){
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (360 - degrees(acos(abs(this.tmpRx)/this.v)));
        } else {
          this.theta = degrees(acos(abs(this.tmpRx)/this.v));
        }
      } else if(this.maxX <= this.x){
        if(0 < this.tmpRx && this.tmpRy < 0){
          this.theta = (180 + degrees(acos(abs(this.tmpRx)/v)));
        } else {
          this.theta = (180 - degrees(acos(abs(this.tmpRx)/v)));
        }
      } else if(this.y <= this.minY) {
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (180 - degrees(asin(abs(this.tmpRy)/this.v)));
        } else {
          this.theta = (degrees(asin(abs(this.tmpRy)/this.v)));
        }
      } else if(this.maxY <= this.y) {
        if(this.tmpRx < 0 && 0 < this.tmpRy){
          this.theta = (180 + degrees(asin(abs(this.tmpRy)/this.v)));
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

  private float getSpeedRate(){
    return random(4, 10);
  }
}
