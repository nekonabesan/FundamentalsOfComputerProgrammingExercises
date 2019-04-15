// 問題 4.1 変数を用いて直径 20 画素の円を 5 個縦に並べて描画せよ．
void setup() {
  size(100, 100);
  background(255, 255, 255);
}

void drawEllipse(int x, int y, int w, int h){
  ellipse(x, y, w, h);
}

void draw() {
  int x = 50;
  int w = 20;
  int h = 20;
  noStroke();
  fill(0,51,153);
  for(int y = 10; y <= 90; y+=20){
    drawEllipse(x, y, w, h);
  }
}
