void setup() {
  size(400, 100);
  background(255, 255, 255);
}

// 問題 3.4 算術演算子を用いて 400 画素 ×100 画素のウインドウに 50 画素 ×20 画素の大きさの矩形を横方向に 10 画
// 素の間隔を空けて 5 個並べよ．ただし，上辺と左辺からともに 10 画素間隔を空けること．
void draw() {
  int y = 10;
  noStroke();
  fill(0,51,153);
  for(int x = 25; x <= (25 + (60 * 5)); x+=60){
      rect(x, y, 50, 20);
  }
}
