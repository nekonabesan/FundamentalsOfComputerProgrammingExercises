// 問題 7.4 ボールがウインドウのランダムな位置からランダムな速度で等速直線運動するアニメーションを作成せよ．
// ただし，ボールは任意の方向に運動するようにすること．
private float x = random(1, 400);
private float y = random(1, 400);
private float vx = 1;
private float vy = 1;
private float rx = (vx * getSpeedRate());
private float ry = (vy * getSpeedRate());
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
  x += rx;
  y += ry;
  if(x < 0 || 400 < x || y < 0 || 400 < y){
    rx = (vx * getSpeedRate());
    ry = (vy * getSpeedRate());
    x = random(0, 400);
    y = random(0, 400);
  }
}

private float getSpeedRate(){
  return random(1, 10);
}
