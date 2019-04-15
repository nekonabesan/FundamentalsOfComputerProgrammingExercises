// 問題 4.2 変数を用いて直径 20 画素の円を 10 個横に並べて描画せよ．
void setup() {
  size(200, 100);
  background(255, 255, 255);
}

void drawEllipse(int x, int y, int w, int h){
  ellipse(x, y, w, h);
}

void draw() {
  int y = 50;
  int w = 20;
  int h = 20;
  noStroke();
  fill(0,51,153);
  for(int x = 10; x <= 190; x+=20){
    drawEllipse(x, y, w, h);
  }
}
