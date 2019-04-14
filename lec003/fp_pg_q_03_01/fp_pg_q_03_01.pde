void setup() {
  size(100, 100);
  background(255, 255, 255);
}

// 問題 3.1 算術演算子を用いて直径 20 画素の円を 5 個隣接させて縦に描画せよ．
void draw() {
  int x = 50;
  noStroke();
  fill(0,51,153);
  for(int y = 10; y <= 90; y+=20){
    ellipse(x,y,20,20);
  }
}
