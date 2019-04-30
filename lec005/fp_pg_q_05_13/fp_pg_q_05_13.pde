// 問題 5.13 図 5.6(d) に示すような 600 画素 × 400 画素の描画範囲に，間隔 15 画素の格子を描画せよ．
void setup() {
  size(600, 400);
  background(255, 255, 255);
}

void draw() {
  strokeWeight(1);
  stroke(0, 255, 102);
  for (float x = 15; x < width; x+=15) {
    for (float y = 15; y < height; y+=15) {
      // 横
      line(0, y, width, y);
      // 縦
      line(x, 0, x, height);
    }
  }
}
