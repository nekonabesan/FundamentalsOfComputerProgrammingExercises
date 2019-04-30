// 問題 10.1 ボールクラスを作成し，ボールクラスを継承した 5 角形クラス Pentagon を利用して 5 角形を描画せよ．
private Pentagon pt = null;
private float btm = 0;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  btm = height/2 - 30;
}

void draw() {
  translate(width/2, height/2);
  float x = width/2;
  float y = height/2;
  float vx = 0;
  float vy = 0;
  float r = 0;
  float g = 0;
  float b = 255;
  float d = 50;
  float cc = 50;
  float rotate = PI;
  pt = new Pentagon(x, y, vx, vy, r, g, b, width, height, d, cc, 360, rotate, 0.75);
  pt.draw();
}
