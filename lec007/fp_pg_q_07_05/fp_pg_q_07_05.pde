// 問題 7.5 ボールがウインドウ内を壁に反射しながら上下に等速直線運動するアニメーションを作成せよ．
private float x = 20;
private float y = 20;
private float vx = 1;
private float vy = 1;
private float rx = (vx * getSpeedRate());
private float ry = (vy * getSpeedRate());
private float d = 20;
private boolean flg = true;

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
  if(flg){
    x += rx;
    y += ry;
  } else {
    x -= rx;
    y -= ry;
  }
  if(x <= 0 || 380 < x || y <= 0 || 380 < y){
    rx = (vx * getSpeedRate());
    ry = (vy * getSpeedRate());
    if(x <= 0){
      x = 0;
    } else if(380 <= x) {
      x = 380;
    }
    if(y <= 0) {
      y = 0;
    } else if(380 <= y) {
      y = 380;
    }
    if(flg){
      flg = false;
    } else {
      flg = true;
    }
  }
}

private float getSpeedRate(){
  return random(1, 10);
}
