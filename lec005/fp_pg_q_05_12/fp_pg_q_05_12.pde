// 問題 5.12 図 5.6(c) に示すような 600 画素 × 400 画素の描画範囲に，等間隔に水平な直線を 9 本描画せよ．
void setup() {
  size(600, 400);
  background(255, 255, 255);
}

void draw() {
  int x = 0;
  int r = height / 10;
  strokeWeight(1);
  stroke(0, 255, 102);
  for (float y = r; y <= (r * 9); y+=r) {
    line(x, y, width, y);
  }
}
