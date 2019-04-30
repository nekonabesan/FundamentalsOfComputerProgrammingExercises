// 問題 5.6 for 文を用いて直径 20 画素の円を 15 個横に並べて描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  int y = height/2;
  int r = 20;
  float init = 7.5;
  noStroke();
  for (float x = ((width/2)-(init*r)) + r/2; x <= ((width/2)+(init*r)) - r/2; x+=20) {
    if((x + 10) % 100 == 0){
      fill(0, 0, 128);
    } else{
      fill(0, 0, 255);
    }
    ellipse(x, y, r, r);
  }
}
