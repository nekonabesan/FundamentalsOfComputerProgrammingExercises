// 問題 5.14 図 5.6(e) に示すように斜めの線分が交差する線を描画せよ．
void setup() {
  size(600, 100);
  background(255, 255, 255);
}

void draw() {
  int r = 15;
  float s = 3.0;
  strokeWeight(1);
  stroke(0, 255, 102);
  for (float x = r; x + (r * s) <= width - r; x+=r) {
    // 横
    line(x, r, x + (r * s), height - r);
    // 縦
    line(x + (r * s), r, x, height - r);
  }
}
