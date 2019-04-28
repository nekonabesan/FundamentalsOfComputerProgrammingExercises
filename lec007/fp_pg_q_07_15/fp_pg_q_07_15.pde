// 問題 7.15 3 個のボールがウインドウ内で壁に反射しながら等速直線運動するアニメーションを作成せよ．ただし，
// 個々のボールの初期位置，速度は乱数で発生させ，ボールどうしの衝突は考慮しなくても良い．
MoveCircle c1;
MoveCircle c2;
MoveCircle c3;
private float d = 20;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CENTER);
  frameRate(30);
  c1 = new MoveCircle(0, 51, 153, width, height, 20);
  c2 = new MoveCircle(0, 0, 102, width, height, 20);
  c3 = new MoveCircle(0, 0, 255, width, height, 20);
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  c1.drawCircle();
  c2.drawCircle();
  c3.drawCircle();
}
