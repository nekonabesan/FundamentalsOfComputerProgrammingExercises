// 問題 10.6 ★が回転しながら水平方向に等速直線運動し，壁で反射するアニメーションを nPolygon クラスを継承し
// たクラスを用いて作成せよ．ただし，フィールドとしては，★の色 c，★の外接円の直径 d，位置 x, y，水平方向の速
// 度 vx，回転速度 theta を持ち，メソッドとしては，★の移動を処理する move メソッド，★を描画する draw メソッド
// を用意せよ．
private nStar nst = null;
private float i = 0;

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
  this.nst.rotation(i + PI/2);
  this.nst.draw();
  this.nst.move();
  i+=0.05;
  if(i == 360){
    i = 0;
  }
}
