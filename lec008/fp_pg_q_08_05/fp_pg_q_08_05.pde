// 問題 8.5 マウスポインタの x 座標値に応じて，ウインドウの底辺上で動く矩形を描画せよ．
MoveRectangle mr;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  frameRate(30);
  mr = new MoveRectangle(0, height/2 - 20, 1, 0, 0, 0, 255, width, height, 40, 40);
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  mr.draw();
  if(mousePressed){
    moveMouse(mouseX, 0);
  }
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
