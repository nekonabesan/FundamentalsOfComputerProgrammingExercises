// 問題 9.9 問題 8.7 をボールおよびパッドを表す 2 つのクラスを用いて作成せよ．
ReflectionCircle rc = null;
MoveRectangle mr = null;
private float btm = 0;
private float prw = 40;
private float prh = 10;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  btm = height/2 - 30;
  this.mr = new MoveRectangle(0, btm, 1, 0, 0, 0, 255, width, height, prw, prh);
  this.createRc();
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  if(this.rc == null){
    this.createRc();
  }
  if(this.btm - 2 - this.rc.getD()/2 <= this.rc.getY() && this.rc.getY() <= this.prh + this.btm) {
    if(mr.getX() - prw/2 <= this.rc.getX() && this.rc.getX() <= this.mr.getX() + this.prw/2){
      this.reflection();
    }
  }
  if(height/2 <= rc.getY()) {
    this.createRc();
  }
  this.rc.draw();
  this.rc.move();
  this.mr.draw();
  if(mousePressed){
    this.rc.ctrl();
    moveMouse(mouseX, 0);
  }
}

public void reflection(){
  float rcX = this.rc.getX();
  float rcY = this.rc.getY();
  float rcRx = this.rc.getRx();
  float rcRy = this.rc.getRy();
  float tmpRx = rcRx;
  float tmpRy = rcRy;
  float theta = 0;
  float v = (sqrt(sq(rcRx) + sq(rcRy)));
  //
  if(tmpRx < 0 && 0 < tmpRy){
    theta = (180 + degrees(asin(abs(tmpRy)/v)));
  } else {
    theta = (360 - degrees(asin(abs(tmpRy)/v)));
  }
  //
  rcRx = (v * cos(radians(theta)));
  rcRy = (v * sin(radians(theta)));
  rcX += rcRx;
  rcY += rcRy;
  this.rc.setX(rcX);
  this.rc.setY(rcY);
  this.rc.setRx(rcRx);
  this.rc.setRy(rcRy);
}

public void createRc(){
  float x = random(-width/4, width/4);
  float y = random(-height/4, 0);
  float vx = 0;
  float vy = 0;
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float d = random(10, 50);
  this.rc = new ReflectionCircle(x, y, vx, vy, r, g, b, width, height, d);
  this.rc.setMaxY((height/2) + d);
}

public void moveMouse(float mX, float mY){
  mX-=(width/2);
  float x = this.mr.getX();
  float maxX = this.mr.getMaxX();
  float minX = this.mr.getMinX();
  float rx = this.mr.getRx();
  if(x < mX){
    if(x <= maxX && x < maxX) {
      x+=rx;
      this.mr.setX(x);
    }
  } else if ((mX + rx) < x && minX < x) {
    if(minX <= x){
      x-=rx;
      this.mr.setX(x);
    }
  }
}
