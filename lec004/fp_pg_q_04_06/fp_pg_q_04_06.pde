// 問題 4.6 変数を用いて 100 画素 ×200 画素の領域に 50×20 画素の大きさの矩形を縦方向に 10 画素の間隔を空けて 5
// 個並べて描画せよ．ただし，上辺と左辺からともに 10 画素間隔を空けること．
void setup() {
  size(100, 200);
  background(255, 255, 255);
}

void draw() {
  int h = 20;
  int w = 50;
  int x = 10;
  int i = 10 + h;
  noStroke();
  fill(0,51,153);
  for(int y = 10; y <= (5 * i); y+=i){
    rect(x, y, w, h);
  }
}
