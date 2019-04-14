void setup() {
  size(540, 360);
  // https://www.pantone.com/color-finder/286-C
  background(0, 51, 160);
}

// 問題 3.15 図 2.11 の仕様に示したギリシャ共和国国旗を算術演算子を用いて描画せよ．
void draw() {
  int x = 0;
  int y = 0;
  // white line 01 to 04
  noStroke();
  fill(255, 255, 255);
  for(y = 40; y <= 360; y+=80){
    rect(x, y, 540, 40);
  }
  // brue rectangle
  // https://www.pantone.com/color-finder/286-C
  noStroke();
  fill(0, 51, 160);
  rect(0, 0, 200, 200);
  // white cross
  noStroke();
  fill(255, 255, 255);
  rect(0, 80, 200, 40);
  noStroke();
  fill(255, 255, 255);
  rect(80, 0, 40, 200);
}
