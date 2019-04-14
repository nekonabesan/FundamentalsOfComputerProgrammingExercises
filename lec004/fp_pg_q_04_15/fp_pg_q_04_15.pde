// 問題 4.15 ウインドウサイズが簡単に変更可能なように，変数を用いてアイスランド共和国国旗を描画せよ．
void setup() {
  size(500, 360);
  // https://www.pantone.com/color-finder/287-C
  background(0, 75, 135);
}

void flagOfIsland(float width, float height){
  int x = 0;
  int y = 0;
  //===== white line 01 =====//
  noStroke();
  fill(255, 255, 255);
  y+=((height * 4/9) - (height * 1/18));
  rect(x, y, width, (height * 2/9));
  //===== white line 02 =====//
  noStroke();
  fill(255, 255, 255);
  x+=((height * 4/9) - (height * 1/18));
  y-=((height * 4/9) - (height * 1/18));
  rect(x, y, (height * 2/9), height);
  //===== red line 01 =====//
  // https://www.pantone.com/color-finder/199-C
  noStroke();
  fill(213, 0, 50);
  x-=((height * 4/9) - (height * 1/18));
  y+=(height * 4/9);
  rect(x, y, width, (height * 1/9));
  //===== red line 01 =====//
  // https://www.pantone.com/color-finder/199-C
  noStroke();
  //fill(213, 0, 50);
  x+=(height * 4/9);
  y-=(height * 4/9);
  rect(x, y, (height * 1/9), width);
}

// 図 2.12 の仕様に示したアイスランド共和国国旗を算術演算子を用いて描画せよ．
void draw() {
  flagOfIsland(500, 360);
}
