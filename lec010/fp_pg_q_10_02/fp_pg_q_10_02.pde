// 問題 10.2 ボールクラスを作成し，ボールクラスを継承した n 角形 nPolygon クラスを利用して 5 角形を描画せよ．
private nPolygon np = null;
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
  np = new nPolygon(x, y, vx, vy, r, g, b, width, height, d, cc, 0, rotate, 0.75);
  np.draw(5);
}
