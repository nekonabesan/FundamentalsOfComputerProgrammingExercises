// 問題 4.5 変数を用いて 400 画素 ×100 画素の領域に 50×20 画素の大きさの矩形を等間隔で横に 5 個並べて描画せよ．
// ただし，上辺から 10 画素間隔を空けること．
void setup() {
  size(400, 100);
  background(255, 255, 255);
}

void draw() {
  int h = 20;
  int w = 50;
  int y = 10;
  int a = (width - (w * 5)) / 6;
  int i = 3 * a;
  noStroke();
  fill(0,51,153);
  for(int x = a; x <= width; x+=i){
      rect(x, y, w, h);
  }
}
