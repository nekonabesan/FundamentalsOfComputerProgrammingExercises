// 問題 4.7 変数を用いて 100 画素 ×200 画素の領域に 50×20 画素の大きさの矩形を等間隔で縦に 5 個並べて描画せよ．
// ただし，水平方向も等間隔にすること．
void setup() {
  size(100, 200);
  background(255, 255, 255);
}

void draw() {
  int h = 20;
  int w = 50;
  int x = 25;
  float a = (height - 20 - (h * 5)) / 4;
  float i = a + h;
  noStroke();
  fill(0,51,153);
  for(float y = 10; y <= (height - 10); y+=i){
    rect(x, y, w, h);
  }
}
