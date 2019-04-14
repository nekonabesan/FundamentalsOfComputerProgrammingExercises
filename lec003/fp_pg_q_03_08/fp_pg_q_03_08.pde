void setup() {
  size(300, 200);
  background(255, 255, 255);
}

// 問題 3.8 算術演算子を用いて 300 画素 ×100 画素のウインドウに直径 20 画素の円を右から 5 個横に並べよ．
void draw() {
  int y = 100;
  noStroke();
  fill(0, 51, 153);
  for(int x = 275; 25 <= x; x-=50){
    ellipse(x, y, 20, 20);
  }
}
