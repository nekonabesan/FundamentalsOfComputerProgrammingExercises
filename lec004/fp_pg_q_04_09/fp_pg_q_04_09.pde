// 問題 4.9 変数を用いて 100 画素 ×300 画素の領域に直径 20 画素の円を下から 5 個縦に並べて描画せよ．
void setup() {
  size(100, 300);
  background(255, 255, 255);
}

void draw() {
  int w = 20;
  int h = 20;
  float x = 50;
  float interval = 300 / 6;
  noStroke();
  fill(0, 51, 153);
  for(float y = height - interval; interval <= y; y-=interval){
    ellipse(x, y, w, h);
  }
}
