// 問題 7.4 ボールがウインドウのランダムな位置からランダムな速度で等速直線運動するアニメーションを作成せよ．
// ただし，ボールは任意の方向に運動するようにすること．
private float x = random(1, 400);
private float y = random(1, 400);
private float vx = 1;
private float vy = 1;
private float spd_rate = random(0.1, 1);
private float d = 20;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CORNER);
  frameRate(30);
}

void draw(){
  background(255, 255, 255);
  noStroke();
  fill(0, 0, 255);
  ellipse(x, y, d, d);
  x += (cos(radians(360 * (1/vx * spd_rate))));
  y += (sin(radians(260 * (1/vy * spd_rate))));
  if(x < 0 || x < 400 || y < 0 || 400 < y){
    x = random(0, 400);
    y = random(0, 400);
    spd_rate = random(1, 10);
  }
}
