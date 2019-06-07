// 問題 9.1 ボールが壁に反射しながら水平方向に等速直線運動するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとしてボールの色 c，直径 d，位置 x, y，水平方向の速度 vx を持ち，
// メソッドとしてはボールの移動を処理する move メソッド，ボールを描画する draw メソッドを用意せよ．
ReflectionCircle rc;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  rc = new ReflectionCircle(0, 40, 1, 0, 5, width, height);
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  rc.draw();
  rc.move();
}
