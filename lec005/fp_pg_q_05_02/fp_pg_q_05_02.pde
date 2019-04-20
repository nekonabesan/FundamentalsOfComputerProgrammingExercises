// 問題 5.2 直径 20 画素の円を 10 個横に並べて描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  int y = height/2;
  int r = 20;
  float init = 5.0;
  float x = ((width/2)-(init*r)) + r/2;
  /*noStroke();
  fill(0, 0, 255);
  for (float x = ((width/2)-(init*r)) + r/2; x <= ((width/2)+(init*r)) - r/2; x+=20) {
    ellipse(x, y, r, r);
  }*/
  // 01
  drawCircle(x, y, r);
  // 02
  x+=20;
  drawCircle(x, y, r);
  // 03
  x+=20;
  drawCircle(x, y, r);
  // 04
  x+=20;
  drawCircle(x, y, r);
  // 05
  x+=20;
  drawCircle(x, y, r);
  // 06
  x+=20;
  drawCircle(x, y, r);
  // 07
  x+=20;
  drawCircle(x, y, r);
  // 08
  x+=20;
  drawCircle(x, y, r);
  // 09
  x+=20;
  drawCircle(x, y, r);
  // 10
  x+=20;
  drawCircle(x, y, r);
}

void drawCircle(float x, float y, int r){
  fill(0, 0, 255);
  noStroke();
  ellipse(x, y, r, r);
}
