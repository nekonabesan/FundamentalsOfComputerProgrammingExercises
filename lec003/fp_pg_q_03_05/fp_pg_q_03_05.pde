void setup() {
  size(400, 100);
  background(255, 255, 255);
}

// 問題 3.5 算術演算子を用いて 400 画素 ×100 画素のウインドウに 50 画素 ×20 画素の大きさの矩形を等間隔で横に 5
// 個並べよ．ただし，上辺から 10 画素間隔を空けること．
void draw() {
  int y = 10;
  noStroke();
  fill(0,51,153);
  for(int x = 25; x <= 400; x+=75){
      rect(x, y, 50, 20);
  }
}