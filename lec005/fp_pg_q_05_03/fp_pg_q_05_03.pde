// 問題 5.3 変数を用いて直径 20 画素の円を 15 個横に並べて描画せよ
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  int y = height/2;
  int r = 20;
  float init = 7.5;
  float x = ((width/2)-(init*r)) + r/2;
  /*noStroke();
  for (float x = ((width/2)-(init*r)) + r/2; x <= ((width/2)+(init*r)) - r/2; x+=20) {
    if((x + 10) % 100 == 0){
      fill(0, 0, 128);
    } else{
      fill(0, 0, 255);
    }
    ellipse(x, y, r, r);
  }*/
  // 01
  drawCircle(x, y, r);
  // 02
  x+=20;
  drawCircle(x, y, r);
  // 03
  x+=20;
  drawCircle(x, y, r);
  // 04
  x+=20;
  drawCircle(x, y, r);
  // 05
  x+=20;
  drawCircle(x, y, r);
  // 06
  x+=20;
  drawCircle(x, y, r);
  // 07
  x+=20;
  drawCircle(x, y, r);
  // 08
  x+=20;
  drawCircle(x, y, r);
  // 09
  x+=20;
  drawCircle(x, y, r);
  // 10
  x+=20;
  drawCircle(x, y, r);
  // 11
  x+=20;
  drawCircle(x, y, r);
  // 12
  x+=20;
  drawCircle(x, y, r);
  // 13
  x+=20;
  drawCircle(x, y, r);
  // 14
  x+=20;
  drawCircle(x, y, r);
  // 15
  x+=20;
  drawCircle(x, y, r);
}

void drawCircle(float x, float y, int r){
  if((x + 10) % 100 == 0){
    fill(0, 0, 128);
  } else{
    fill(0, 0, 255);
  }
  noStroke();
  ellipse(x, y, r, r);
}
