// 問題 5.1 直径 20 画素の円を 5 個縦に並べて描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  int y = height/2;
  int r = 20;
  noStroke();
  fill(0, 0, 255);
  for (float x = ((width/2)-(2.5*r)) + r/2; x <= ((width/2)+(2.5*r)) - r/2; x+=20) {
    ellipse(x, y, r, r);
  }
}
