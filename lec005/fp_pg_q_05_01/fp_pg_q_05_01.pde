// 問題 5.1 直径 20 画素の円を 5 個縦に並べて描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  int x = width/2;
  int r = 20;
  float init = 2.5;
  float y = ((height/2) - (init * r)) - r/2;
  println(y);
  /*noStroke();
  fill(0, 0, 255);
  for (float x = ((width/2)-(init*r)) + r/2; x <= ((width/2)+(init*r)) - r/2; x+=20) {
    ellipse(x, y, r, r);
  }*/
  // 01
  drawCircle(x, y, r);
  // 02
  y += 20;
  drawCircle(x, y, r);
  // 03
  y += 20;
  drawCircle(x, y, r);
  // 04
  y += 20;
  drawCircle(x, y, r);
  // 05
  y += 20;
  drawCircle(x, y, r);
}

void drawCircle(float x, float y, int r){
  //fill(0, 0, 255);
  //noStroke();
  noFill();
  stroke(0, 0, 255);
  strokeWeight(1);
  ellipse(x, y, r, r);
}
