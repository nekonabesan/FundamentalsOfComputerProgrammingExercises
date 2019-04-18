void setup() {
  size(250, 180);
  // https://www.pantone.com/color-finder/287-C
  background(0, 75, 135);
}

// 図 2.12 の仕様に示したアイスランド共和国国旗を算術演算子を用いて描画せよ．
void draw() {
  int x = 0;
  int y = 0;
  //===== white line 01 =====//
  noStroke();
  fill(255, 255, 255);
  y+=70;
  rect(x, y, 250, 40);
  //===== white line 02 =====//
  noStroke();
  fill(255, 255, 255);
  x+=70;
  y-=70;
  rect(x, y, 40, 180);
  //===== red line 01 =====//
  // https://www.pantone.com/color-finder/199-C
  noStroke();
  fill(213, 0, 50);
  x-=70;
  y+=80;
  rect(x, y, 250, 20);
  //===== red line 01 =====//
  // https://www.pantone.com/color-finder/199-C
  noStroke();
  //fill(213, 0, 50);
  x+=80;
  y-=80;
  rect(x, y, 20, 250);
}
