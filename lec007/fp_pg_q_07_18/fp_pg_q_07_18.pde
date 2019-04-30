// 問題 7.18 ボールが 2 次元平面内で飛び跳ねるアニメーションを作成せよ．壁との衝突
MoveCircle c1;
MoveCircle c2;
MoveCircle c3;
MoveCircle c4;
MoveCircle c5;
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
  c4 = new MoveCircle(51, 153, 255, width, height, 20);
  c5 = new MoveCircle(51, 255, 204, width, height, 20);
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  c1.drawCircle();
  c2.drawCircle();
  c3.drawCircle();
  c4.drawCircle();
  c5.drawCircle();
}
