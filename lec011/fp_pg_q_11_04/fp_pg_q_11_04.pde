// 問題 11.4 描画領域上方から文字列の各文字が順に鉛直下向きに等速直線運動で落下させよ．
private String str = new String("Welcome to Programming and Exercises Class!!");
private Character[] cl = new Character[this.str.length()];
private float h = 0;
private float s = 0;
private float b = 0;
private boolean flg = true;

public void setup(){
  size(600, 300);
  textFont(createFont("Harrington", 24));
  colorMode(HSB, this.str.length() - 1);
  rectMode(CENTER);
  ellipseMode(CENTER);
  translate(width/2, height/2);
  this.h = 0;
  this.s = this.str.length() - 1;
  this.b = this.str.length() - 1;
  this.initializedText();
}

public void draw(){
  background(this.str.length() - 1);
  translate(width/2, height/2);
  float x = -1 * strWidth()/2;
  float d = textWidth(this.str.charAt(int(0)));
  for(float i = 0; i < this.str.length(); i++){
    cl[int(i)].rotateColorH();
    fill(cl[int(i)].getH(), cl[int(i)].getS(), cl[int(i)].getB());
    text(this.str.charAt(int(i)), cl[int(i)].getX(), cl[int(i)].getY());
    cl[int(i)].move();
    x += textWidth(this.str.charAt(int(i)));
  }
}

private void initializedText(){
  background(this.str.length() - 1);
  float y = -height/2 + textWidth(this.str.charAt(int(0))) + 10;
  float x = -1 * strWidth()/2;
  float d = textWidth(this.str.charAt(int(0)));
  for(float i = 0; i < this.str.length(); i++){
    Character c = new Character(this.str.length(), x, y, i, this.str.length() - 1, this.str.length() - 1);
    c.setup(0, 1, width, height, textWidth(this.str.charAt(int(i))));
    cl[int(i)] = c;
    fill(i, this.str.length() - 1, this.str.length() - 1);
    text(this.str.charAt(int(i)), x, y);
    x += textWidth(this.str.charAt(int(i)));
  }
}

private float strWidth(){
  float wh = 0;
  for(float i = 0; i < this.str.length(); i++){
    wh += textWidth(this.str.charAt(int(i)));
  }
  return wh;
}

class Color {
  private boolean flgH = true;
  private boolean flgS = true;
  private boolean flgB = true;
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private int length = 0;

  public void setFlgH(boolean flg){
    this.flgH = flg;
  }
  public boolean getFlgH(){
    return this.flgH;
  }
  public void setFlgS(boolean flg){
    this.flgS = flg;
  }
  public boolean getFlgS(){
    return this.flgS;
  }
  public void setFlgB(boolean flg){
    this.flgB = flg;
  }
  public boolean getFlgB(){
    return this.flgB;
  }

  public void setH(float h){
    this.h = h;
  }
  public float getH(){
    return this.h;
  }
  public void setS(float s){
    this.s = s;
  }
  public float getS(){
    return this.s;
  }
  public void setB(float b){
    this.b = b;
  }
  public float getB(){
    return this.b;
  }

  Color(int length, float h, float s, float b){
    this.length = length;
    this.h = h;
    this.s = s;
    this.b = b;
  }

  public void rotateColor(){
    //
    if(this.flgH){
      this.h += 0.1;
    } else {
      this.h -= 0.1;
    }
    if(this.length - 1 <= this.h){
      flgH = false;
    }
    if(this.h <= 0){
      flgH = true;
    }
    //
    /*if(this.flgS){
      this.s += 0.1;
    } else {
      this.s -= 0.1;
    }
    if(this.length - 1 <= this.s){
      flgS = false;
    }
    if(this.s <= 0){
      flgS = true;
    }
    //
    if(this.flgB){
      this.b += 0.1;
    } else {
      this.b -= 0.1;
    }
    if(this.length - 1 <= this.b){
      flgB = false;
    }
    if(this.b <= 0){
      flgB = true;
    }*/
  }
}

class Character extends Ball{
  private boolean flgH = true;
  private boolean flgS = true;
  private boolean flgB = true;
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private int length = 0;

  public void setX(float x){
    super.setX(x);
  }
  public float getX(){
    return super.getX();
  }
  public void setY(float y){
    super.setY(y);
  }
  public float getY(){
    return super.getY();
  }
  public void setFlgH(boolean flg){
    this.flgH = flg;
  }
  public boolean getFlgH(){
    return this.flgH;
  }
  public void setFlgS(boolean flg){
    this.flgS = flg;
  }
  public boolean getFlgS(){
    return this.flgS;
  }
  public void setFlgB(boolean flg){
    this.flgB = flg;
  }
  public boolean getFlgB(){
    return this.flgB;
  }
  public void setH(float h){
    this.h = h;
  }
  public float getH(){
    return this.h;
  }
  public void setS(float s){
    this.s = s;
  }
  public float getS(){
    return this.s;
  }
  public void setB(float b){
    this.b = b;
  }
  public float getB(){
    return this.b;
  }

  Character(int length, float x, float y, float h, float s, float b){
    this.length = length;
    super.setX(x);
    super.setY(y);
    this.h = h;
    this.s = s;
    this.b = b;
  }

  public void setup(float vx, float vy, float w, float h, float d){
    super.setVx(vx);
    super.setVy(vy);
    super.setW(w);
    super.setH(h);
    super.setD(d);
    //super.setRx(super.getVx() * random(4, 10));
    //super.setRy(super.getVy() * random(4, 10));
    //super.setup();
    super.setMinX(-w/2 + d);
    super.setMaxX(w/2 - d);
    super.setMinY(-h/2 + d);
    super.setMaxY(h/2);
    super.setRx(0);
    super.setRy(super.getVy() * 2);
  }

  public void rotateColorH(){
    if(this.flgH){
      this.h += 0.1;
    } else {
      this.h -= 0.1;
    }
    if(this.length - 1 <= this.h){
      flgH = false;
    }
    if(this.h <= 0){
      flgH = true;
    }
  }

  public void rotateColorS(){
    if(this.flgS){
      this.s += 0.1;
    } else {
      this.s -= 0.1;
    }
    if(this.length - 1 <= this.s){
      flgS = false;
    }
    if(this.s <= 0){
      flgS = true;
    }
  }

  public void rotateColorB(){
    if(this.flgB){
      this.b += 0.1;
    } else {
      this.b -= 0.1;
    }
    if(this.length - 1 <= this.b){
      flgB = false;
    }
    if(this.b <= 0){
      flgB = true;
    }
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
  public void setVx(float vx){
    this.vx = vx;
  }
  public float getVx(){
      return this.vx;
  }
  public void setVy(float vy){
    this.vy = vy;
  }
  public float getVy(){
      return this.vy;
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
  public void setW(float w){
    this.w = w;
  }
  public void setH(float h){
    this.h = h;
  }
  public void setD(float d){
    this.d = d;
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

  Ball() {}
  Ball(float x, float y, float vx, float vy, float w, float h, float d){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = w;
    this.h = h;
    this.d = d;
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
    maxX = (w/2) - w/2;
    minY = -(h/2) + h/2;
    maxY = (h/2) - h/2;*/
    this.minX = this.d;
    this.maxX = this.w - this.d;
    this.minY = this.d;
    this.maxY = this.h - this.d;
    //this.x = this.w/2;
    //this.y = this.h/2;
    this.rx = (this.vx * getSpeedRate());
    this.ry = (this.vy * getSpeedRate());
  }

  public void draw(){
    pushMatrix();
    translate(x, y);
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
