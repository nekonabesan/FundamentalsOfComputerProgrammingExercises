void setup() {
  size(100, 300);
  background(255, 255, 255);
}

// 問題 3.9 算術演算子を用いて 100 画素 ×300 画素のウインドウに直径 20 画素の円を下から 5 個縦に並べよ
void draw() {
  int x = 50;
  noStroke();
  fill(0, 51, 153);
  for(int y = 275; 25 <= y; y-=50){
    ellipse(x, y, 20, 20);
  }
}
