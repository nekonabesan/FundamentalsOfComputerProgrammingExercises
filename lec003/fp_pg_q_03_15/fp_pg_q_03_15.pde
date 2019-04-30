void setup() {
  size(270, 180);
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
  for(y = 20; y <= 180; y+=40){
    rect(x, y, 270, 20);
  }
  // brue rectangle
  // https://www.pantone.com/color-finder/286-C
  noStroke();
  fill(0, 51, 160);
  rect(0, 0, 100, 100);
  // white cross
  noStroke();
  fill(255, 255, 255);
  rect(0, 40, 100, 20);
  noStroke();
  fill(255, 255, 255);
  rect(40, 0, 20, 100);
}
