// 問題 8.4 ボールが壁に反射しながら左右に等速直線運動するアニメーションを作成せよ．
// ただし，マウスボタンを押している間，ボールが止まっているようにすること．
MoveCircle mc;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  frameRate(30);
  mc = new MoveCircle(0, 0, 1, 0, 0, 0, 255, width, height, 40);
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  mc.draw();
  if(mousePressed){
    mc.move();
  }
}
