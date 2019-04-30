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
  mr = new MoveRectangle(0, btm, 1, 0, 0, 0, 255, width, height, prw, prh);
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  if(rc == null){
    rc = createRc();
  }
  if(btm - 2 - rc.getD()/2 <= rc.getY() && rc.getY() <= prh + btm) {
    if(mr.getX() - prw/2 <= rc.getX() && rc.getX() <= mr.getX() + prw/2){
      reflection();
    }
  }
  if(height/2 <= rc.getY()) {
    rc.setX(width);
    rc.setY(height);
    rc.setRgb(255, 255, 255);
    rc = createRc();
  }
  rc.draw();
  rc.move();
  mr.draw();
  if(mousePressed){
    rc.ctrl();
    moveMouse(mouseX, 0);
  }
}

public void reflection(){
  float rcX = rc.getX();
  float rcY = rc.getY();
  float rcRx = rc.getRx();
  float rcRy = rc.getRy();
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
  rc.setX(rcX);
  rc.setY(rcY);
  rc.setRx(rcRx);
  rc.setRy(rcRy);
}

public ReflectionCircle createRc(){
  float x = random(-width/2, width/2);
  float y = random(-height/2, 0);
  float vx = 0;
  float vy = 0;
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float d = random(10, 50);
  rc = new ReflectionCircle(x, y, vx, vy, r, g, b, width, height, d);
  rc.setMaxY((height/2) + d);
  return rc;
}

public void moveMouse(float mX, float mY){
  mX-=(width/2);
  float x = mr.getX();
  float maxX = mr.getMaxX();
  float minX = mr.getMinX();
  float rx = mr.getRx();
  if(x < mX){
    if(x <= maxX && x < maxX) {
      x+=rx;
      mr.setX(x);
    }
  } else if ((mX + rx) < x && minX < x) {
    if(minX <= x){
      x-=rx;
      mr.setX(x);
    }
  }
}
