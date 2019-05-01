// 問題 10.4 n 角形を描画するクラス nPolygon を作成し，
// nPolygon クラスを継承した n 頂点の★クラス nStar を利用して n 頂点の★を描画せよ．
private nStar nst = null;
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
  background(255, 255, 255);
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
  float ic = cc * 1/2 * 0.77;
  float rotate = PI/2;
  nst = new nStar(x, y, vx, vy, r, g, b, width, height, d, cc, 5, rotate, 0.75);
  nst.draw(ic);
}
