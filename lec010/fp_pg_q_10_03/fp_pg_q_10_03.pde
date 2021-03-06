// 問題 10.3 5 角形を描画するクラス Pentagon を作成し，Pentagon クラスを継承した★クラス Star を利用して★を描画せよ．
private Star st = null;
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
  background(255, 255, 255);
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
  float ic = cc * 1/2 * 0.77;
  float rotate = PI/2;
  st = new Star(x, y, vx, vy, r, g, b, width, height, d, cc, 5, rotate, 0.75);
  st.draw(ic);
}

class Star extends Pentagon {
  private float InscribedCircle = 0;

  Star(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protatete, float prate){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd,
      pCircumscribedCircle, pp, protatete, prate);
  }

  public void drawStar() {
    float cnt = super.getP() * 2;
    float radius = 0;
    float rotate = super.getRotate();
    float x = super.getX();
    float y = super.getY();
    // http://www.d-improvement.jp/learning/processing/2011-a/08.html
    pushMatrix();
    //translate(x, y);
    rotate(rotate);
    beginShape();
    for (int i = 1; i <= cnt; i++) {
      if (i % 2 == 0) {
        radius = this.InscribedCircle;
      } else {
        radius = super.getCircumscribedCircle();
      }
      vertex(radius * cos(radians(360 * i/cnt)), radius * sin(radians(360 * i/cnt)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  public void draw(float pInscribedCircle){
    InscribedCircle = pInscribedCircle;
    noStroke();
    fill(super.getR(), super.getG(), super.getB());
    this.drawStar();
  }

  public void move(){
    super.move();
  }

  public void rotation(float protate){
    super.setRotate(protate);
  }
}

class Pentagon extends Ball {
  Pentagon(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protate, float prate){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd,
      pCircumscribedCircle, pp, protate, prate);
  }

  public void draw(){
    noStroke();
    fill(super.getR(), super.getG(), super.getB());
    super.setRotate(radians(-90));
    super.setP(5);
    super.draw();
  }

  public void move(){
    super.move();
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
  private float CircumscribedCircle = 0;
  private int p = 0;
  private float rotate = PI/2;
  private float rate = 0.75;

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
  public float getCircumscribedCircle(){
    return this.CircumscribedCircle;
  }
  public void setP(int rP){
    this.p = rP;
  }
  public float getP(){
    return this.p;
  }
  public void setRotate(float protate){
    this.rotate = protate;
  }
  public float getRotate(){
    return this.rotate;
  }

  public void setMinX(float pMinX){
    this.minX = pMinX;
  }
  public float getMinX(){
    return this.minX;
  }
  public void setMaxX(float pMaxX){
    this.maxX = pMaxX;
  }
  public float getMaxX(){
    return this.maxX;
  }
  public void setMinY(float pMinY){
    this.minY = pMinY;
  }
  public float getMinY(){
    return this.minY;
  }
  public void setMaxY(float pMaxY){
    this.maxY = pMaxY;
  }
  public float getMaxY(){
    return this.maxY;
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
  }

  public void setup() {
    /*this.minX = -(w/2) + rw/2;
    maxX = (w/2) - rw/2;
    minY = -(h/2) + rh/2;
    maxY = (h/2) - rh/2;*/
    this.minX = this.d;
    this.maxX = this.w - this.d;
    this.minY = this.d;
    this.maxY = this.h - this.d;
    this.x = this.w/2;
    this.y = this.h/2;
    this.rx = (this.vx * getSpeedRate());
    this.ry = (this.vy * getSpeedRate());
  }

  public void draw(){
    pushMatrix();
    rotate(this.rotate);
    beginShape();
    for (int i = 1; i <= p; i++) {
      vertex(this.CircumscribedCircle * cos(radians(360 * i/p)), this.CircumscribedCircle * sin(radians(360 * i/p)));
    }
    endShape(CLOSE);
    popMatrix();
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
