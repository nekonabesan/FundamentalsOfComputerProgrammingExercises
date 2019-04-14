void setup() {
  size(100, 100);
  background(255, 255, 255);
}

// 3.2 算術演算子を用いて直径 20 画素の円を 10 個隣接させて横に描画せよ．
void draw() {
  int y = 50;
  noStroke();
  fill(0,51,153);
  for(int x = 10; x <= 90; x+=20){
    ellipse(x,y,20,20);
  }
}
