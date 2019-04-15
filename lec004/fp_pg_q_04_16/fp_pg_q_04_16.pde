// 問題 4.16 ウインドウサイズが簡単に変更可能なように，変数を用いてバーレーン王国国旗を描画せよ．

void setup() {
  size(600, 360);
  //https://www.htmlcsscolor.com/hex/D21034
  background(225, 16, 52);
}

void flagOfBahrayn() {
  float triangle_height = height / 5;
  // ===== White rect 01 ===== //
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, (width * 5/20), height);
  // ===== White triangle 01 ===== //
  noStroke();
  fill(255, 255, 255);
  for(int i = 0; i < 5; i++){
    triangle((width * 5/20) ,(i * triangle_height), (width * 5/20), (i * triangle_height) + triangle_height, (width * 8/20), (i * triangle_height) + (triangle_height / 2));
  }
}

// 問題 3.16 図 2.13 の仕様に示したバーレーン王国国旗を算術演算子を用いて描画せよ．
void draw() {
  flagOfBahrayn();
}
