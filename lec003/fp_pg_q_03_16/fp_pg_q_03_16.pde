
void setup() {
  size(600, 360);
  //https://www.htmlcsscolor.com/hex/D21034
  background(225, 16, 52);
}

// 問題 3.16 図 2.13 の仕様に示したバーレーン王国国旗を算術演算子を用いて描画せよ．
void draw() {
  int height = 360;
  int width = 600;
  int triangle_height = height / 5;
  // ===== White rect 01 ===== //
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, 150, height);
  // ===== White triangle 01 ===== //
  for(int i = 0; i < 5; i++){
    noStroke();
    fill(255, 255, 255);
    triangle(150 ,(i * triangle_height), 150, (i * triangle_height) + triangle_height, 240, (i * triangle_height) + (triangle_height / 2));
  }
}
