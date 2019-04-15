// 問題 4.4 変数を用いて 400 画素 ×100 画素の領域に 50×20 画素の大きさの矩形を横方向に 10 画素の間隔を空けて 5
void setup() {
  size(400, 100);
  background(255, 255, 255);
}

void draw() {
  int w = 50;
  int h = 20;
  int y = 10;
  noStroke();
  fill(0,51,153);
  for(int x = 25; x <= (25 + ((w + 10) * 5)); x+=(w + 10)){
      rect(x, y, w, h);
  }
}
