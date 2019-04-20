// 問題 5.10 図 5.6(a) に示すような 600 画素 × 400 画素の描画範囲に，間隔 20 画素で水平な直線を 10 本描画せよ．
void setup() {
  size(600, 400);
  background(255, 255, 255);
}

void draw() {
  int x = 0;
  int r = 20;
  strokeWeight(1);
  stroke(0, 255, 102);
  for (float y = r; y <= (r * 10); y+=r) {
    line(0, y, width, y);
  }
}
