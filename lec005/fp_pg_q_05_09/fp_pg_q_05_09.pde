// 問題 5.9 直径 20 画素の円を縦いっぱいに並べて描画せよ．
void setup() {
  size(400, 400);
  background(255, 255, 255);
}

void draw() {
  int x = width/2;
  int r = 20;
  float init = 10.0;
  noStroke();
  for (float y = r/2; y <= height - r/2; y+=20) {
    if((y + 10) % 100 == 0){
      fill(0, 0, 128);
    } else{
      fill(0, 0, 255);
    }
    ellipse(x, y, r, r);
  }
}
