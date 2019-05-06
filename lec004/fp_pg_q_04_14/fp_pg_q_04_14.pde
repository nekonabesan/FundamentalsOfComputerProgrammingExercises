// 問題 4.14 ウインドウサイズが簡単に変更可能なように，変数を用いてギリシャギリシャ共和国国旗を描画せよ
void setup() {
  size(540, 360);
  // https://www.pantone.com/color-finder/286-C
  background(0, 51, 160);
}

void flagOfGreece(){
  float x = 0;
  float y = 0;
  // white line 01 to 04
  noStroke();
  fill(255, 255, 255);
  for(y = (height/9); y <= height; y+=((height/9) * 2)){
    rect(x, y, width, (height/9));
  }
  // brue rectangle
  // https://www.pantone.com/color-finder/286-C
  noStroke();
  fill(0, 51, 160);
  rect(0, 0, (height - ((height/9) * 4)), (height - ((height/9) * 4)));
  // white cross
  noStroke();
  fill(255, 255, 255);
  rect(0, ((height/9) * 2), ((height/9) * 5), (height/9));
  noStroke();
  fill(255, 255, 255);
  rect(((height/9) * 2), 0, (height/9), ((height/9) * 5));
}

void draw() {
  flagOfGreece();
}
