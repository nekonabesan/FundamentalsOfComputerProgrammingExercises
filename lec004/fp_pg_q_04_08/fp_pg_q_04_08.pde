// 問題 4.8 変数を用いて 300 画素 ×100 画素の領域に直径 20 画素の円を右から 5 個横に並べて描画せよ．
void setup() {
  size(300, 200);
  background(255, 255, 255);
}

void draw() {
  int w = 20;
  int h = 20;
  float y = 100;
  float interval = 300 / 6;
  noStroke();
  fill(0, 51, 153);
  for(float x = 300 - interval; interval <= x; x-=interval){
    ellipse(x, y, w, h);
  }
}
