void setup() {
  size(100, 200);
  background(255, 255, 255);
}

// 問題 3.6 算術演算子を用いて 100 画素 ×200 画素のウインドウに 50 画素 ×20 画素の大きさの矩形を縦方向に 10 画
// 素の間隔を開けて 5 個並べよ．ただし，上辺と左辺からともに 10 画素間隔を空けること．
void draw() {
  int x = 10;
  noStroke();
  fill(0,51,153);
  for(int y = 10; y <= 150; y+=30){
    rect(x, y, 50, 20);
  }
}
