// 問題 10.2 ボールクラスを作成し，ボールクラスを継承した n 角形 nPolygon クラスを利用して 5 角形を描画せよ．
private nPolygon np = null;
private float btm = 0;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  btm = height/2 - 30;
}

void draw() {
  translate(width/2, height/2);
  float x = width/2;
  float y = height/2;
  float vx = 0;
  float vy = 0;
  float r = 0;
  float g = 0;
  float b = 255;
  float d = 50;
  float cc = 50;
  float rotate = -PI/2;
  np = new nPolygon(x, y, vx, vy, r, g, b, width, height, d, cc, 0, rotate, 0.75);
  np.draw(5);
}

class nPolygon extends Ball {
  nPolygon(float x, float y, float vx, float vy,
    float red, float green, float blue, float w, float h,
    float d, float circumscribedCircle,
    int p, float rotate, float rate){
    super(x, y, vx, vy, red, green, blue, w, h, d,
      circumscribedCircle, p, rotate, rate);
  }

  public void draw(int n){
    //noFill();
    //stroke(getR(), getG(), getB());
    noStroke();
    fill(super.getR(), super.getG(), super.getB());
    //super.setRotate(radians(-90));
    super.setP(n);
    super.draw();
  }

  public void move(){
    //super.move();
  }
}

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
  private float circumscribedCircle = 0;
  private int p = 0;
  private float rotate = PI/2;
  private float rate = 0.75;

  public float getX(){
    return this.x;
  }
  public float getY(){
    return this.y;
  }
  public void setR(float r){
    this.r = r;
  }
  public float getR(){
    return this.r;
  }
  public void setG(float gr){
    this.g = g;
  }
  public float getG(){
    return this.g;
  }
  public void setB(float b){
    this.b = b;
  }
  public float getB(){
    return this.b;
  }
  public float getCircumscribedCircle(){
    return this.circumscribedCircle;
  }
  public void setP(int p){
    this.p = p;
  }
  public float getP(){
    return this.p;
  }
  public void setRotate(float rotate){
    this.rotate = rotate;
  }
  public float getRotate(){
    return this.rotate;
  }

  public void setMinX(float minX){
    this.minX = minX;
  }
  public float getMinX(){
    return this.minX;
  }
  public void setMaxX(float maxX){
    this.maxX = maxX;
  }
  public float getMaxX(){
    return this.maxX;
  }
  public void setMinY(float minY){
    this.minY = minY;
  }
  public float getMinY(){
    return this.minY;
  }
  public void setMaxY(float maxY){
    this.maxY = maxY;
  }
  public float getMaxY(){
    return this.maxY;
  }

  Ball(float x, float y, float vx, float vy,
    float red, float green, float blue, float w, float h,
    float d, float circumscribedCircle,
    int p, float rotate, float rate){
      this.x = x;
      this.y = y;
      this.vx = vx;
      this.vy = vy;
      this.r = red;
      this.g = green;
      this.b = blue;
      this.w = w;
      this.h = h;
      this.d = d;
      this.circumscribedCircle = circumscribedCircle;
      this.p = p;
      this.rotate = rotate;
      this.rate = rate;
      /*minX = -(w/2) + rw/2;
      maxX = (w/2) - rw/2;
      minY = -(h/2) + rh/2;
      maxY = (h/2) - rh/2;*/
      /*rx = (vx * getSpeedRate());
      ry = (vy * getSpeedRate());*/
  }

  private void setup() {
    this.minX = this.d;
    this.maxX = this.w - this.d;
    this.minY = this.d;
    this.maxY = this.h - this.d;
    this.y = this.h/2;
    this.rx = (this.vx * this.getSpeedRate());
    this.ry = (this.vy * this.getSpeedRate());
  }

  private void draw(){
    pushMatrix();
    rotate(this.rotate);
    beginShape();
    for (int i = 1; i <= this.p; i++) {
      vertex(this.circumscribedCircle * cos(radians(360 * i/this.p)), this.circumscribedCircle * sin(radians(360 * i/this.p)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  /*private void move(){
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
  }*/

  private float getSpeedRate(){
    return random(4, 10);
  }
}
