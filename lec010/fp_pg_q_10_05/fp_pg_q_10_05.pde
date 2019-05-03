// 問題 10.5 ★が壁に反射しながら水平方向に等速直線運動するアニメーションを nPolygon クラスを継承したクラスを用いて作成せよ．
// ただし，フィールドとしては，★の色 c，★の外接円の直径 d，位置 x, y，水平方向の速度 vx を持ち，
// メソッドとしては，★の移動を処理する move メソッド，★を描画する draw メソッドを用意せよ．
private nStar nst = null;

public void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  float x = width/2;
  float y = height/2;
  float vx = random(-2, 2);
  float vy = 0;
  float r = 0;
  float g = 0;
  float b = 255;
  float d = 50;
  float cc = 50;
  float rotate = PI/2;
  float ic = cc * 1/2 * 0.77;
  this.nst = new nStar(x, y, vx, vy, r, g, b, width, height, d, cc, 5, rotate, 0.75);
  this.nst.setInscribedCircle(ic);
  this.nst.setup();
}

public void draw() {
  background(255, 255, 255);
  //translate(width/2, height/2);
  this.nst.draw();
  this.nst.move();
}
