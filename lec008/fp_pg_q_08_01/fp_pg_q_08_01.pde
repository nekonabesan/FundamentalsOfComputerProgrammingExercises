// 問題 9.1 ボールが壁に反射しながら水平方向に等速直線運動するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとしてボールの色 c，直径 d，位置 x, y，水平方向の速度 vx を持ち，メソッドとしてはボールの移動
// を処理する move メソッド，ボールを描画する draw メソッドを用意せよ．
MoveCircle c1;
MoveCircle c2;
MoveCircle c3;
MoveCircle c4;
MoveCircle c5;
private float[] x = {50, 50, 50, 50, 50};
private float[] y = {50, 100, 150, 200, 250};
private float[] vx = {1, 2, 3, 4, 5};
private float[] d = {10, 20, 30, 40, 50};

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CENTER);
  frameRate(30);

  c1 = new MoveCircle(x[0], y[0] - height/2, vx[0], 0, 51, 153, width, height, d[0]);
  c2 = new MoveCircle(x[1], y[1] - height/2, vx[1], 0, 0, 102, width, height, d[1]);
  c3 = new MoveCircle(x[2], y[2] - height/2, vx[2], 0, 0, 255, width, height, d[2]);
  c4 = new MoveCircle(x[3], y[3] - height/2, vx[3], 51, 153, 255, width, height, d[3]);
  c5 = new MoveCircle(x[4], y[4] - height/2, vx[4], 51, 255, 204, width, height, d[4]);
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  c1.draw();
  c1.move();
  c2.draw();
  c2.move();
  c3.draw();
  c3.move();
  c4.draw();
  c4.move();
  c5.draw();
  c5.move();
}
