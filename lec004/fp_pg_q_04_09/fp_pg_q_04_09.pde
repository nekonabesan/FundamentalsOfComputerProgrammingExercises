// 問題 4.9 変数を用いて 100 画素 ×300 画素の領域に直径 20 画素の円を下から 5 個縦に並べて描画せよ．
void setup() {
  size(100, 300);
  background(255, 255, 255);
}

void draw() {
  int w = 20;
  int h = 20;
  int x = 50;
  noStroke();
  fill(0, 51, 153);
  for(int y = 275; 25 <= y; y-=50){
    ellipse(x, y, w, h);
  }
}
