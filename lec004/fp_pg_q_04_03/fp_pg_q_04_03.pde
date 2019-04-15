// 問題 4.3 変数を用いて 100×100 画素の領域の中央に 50 画素 ×20 画素の長方形を描画せよ．
void setup() {
  size(100, 100);
  background(255, 255, 255);
}

void draw() {
  int w = 50;
  int h = 20;
  float x = (width / 2) - (w / 2);
  float y = (height / 2) - (h / 2);
  noStroke();
  fill(0,51,153);
  rect(x, y, w, h);
}
