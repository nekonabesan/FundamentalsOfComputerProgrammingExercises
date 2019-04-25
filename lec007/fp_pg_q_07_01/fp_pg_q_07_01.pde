// 問題 7.1 例題 7.1 の速度を倍にしたアニメーションを作成せよ．
private float x = 1;
private float vx = 1;
private float spd_rate = 2;
private float d = 20;

void setup(){
  size(400, 20);
  smooth();
  background(255, 255, 255);
  ellipseMode(CORNER);
  frameRate(30);
}

void draw(){
  background(255, 255, 255);
  noStroke();
  fill(200, 255, 200);
  ellipse(x, 0, d, d);
  x += (vx * spd_rate);
  if(width < x){
    x = 1;
  }
}
