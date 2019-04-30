//　問題 8.7 300 画素 ×400 画素のウインドウ上で，2 次元等速直線運動をするボールのアニメーションを作成せよ．
// ただし，マウスボタンをクリックするとボールが動き出すようにすること．
// また，底辺での反射は行わなわず，マウスポインタの x 座標値に応じて移動する 40×10 画素の矩形に衝突した場合のみボールが反射するようにせよ．
import java.util.*;
ReflectionCircle rc = null;
MoveRectangle mr;
private float x = 0;
private float y = 0;
private float vx = 0;
private float vy = 0;
private float r = 0;
private float g = 0;
private float b = 0;
private float d = 20;
private float btm = 0;
private float prw = 40;
private float prh = 10;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
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
  if(btm - 2 -d/2 <= rc.getY() && rc.getY() <= prh + btm) {
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
  x = random(-width/2, width/2);
  y = random(-height/2, 0);
  vx = 0;
  vy = 0;
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  d = random(10, 50);
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
