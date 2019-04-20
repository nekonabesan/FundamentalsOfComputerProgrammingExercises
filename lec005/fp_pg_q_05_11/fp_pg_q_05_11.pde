// 問題 5.11 図 5.6(b) に示すような 600 画素 × 400 画素の描画範囲に，間隔 20 画素で水平な直線を下まで描画せよ．
void setup() {
  size(600, 400);
  background(255, 255, 255);
}

void draw() {
  int x = 0;
  int r = 20;
  float init = 10.0;
  strokeWeight(1);
  stroke(0, 255, 102);
  for (float y = r; y < height; y+=r) {
    line(0, y, width, y);
  }
}
