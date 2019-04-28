// 問題 7.6 ボールがウインドウで壁に反射しながら 2 次元平面内で等速直線運動するアニメーションを作成せよ．
private float x = 0;
private float y = 0;
private float vx = 1;
private float vy = 1;
private float rx = (vx * getSpeedRate());
private float ry = (vy * getSpeedRate());
private float d = 20;
private boolean flg = true;
private float v = 0;
private float theta = 0;
private float minX = 0;
private float maxX = 0;
private float minY = 0;
private float maxY = 0;
private float tmpRx = 0;
private float tmpRy = 0;


void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CENTER);
  frameRate(30);
  minX = -(width/2) + d/2;
  maxX = (width/2) - d/2;
  minY = -(height/2) + d/2;
  maxY = (height/2) - d/2;
}

void draw(){
  background(255, 255, 255);
  if(x <= minX || maxX <= x || y <= minY || maxY <= y){
    if(x <= minX){
      x = minX;
    } else if(maxX <= x) {
      x = maxX;
    }
    if(y <= minY) {
      y = minY;
    } else if(maxY <= y) {
      y = maxY;
    }
    // 速度のx成分とy成分からスカラーを導出する処理
    tmpRx = rx;
    tmpRy = ry;
    v = (sqrt(sq(rx) + sq(ry)));
    if(x <= minX){
      if(tmpRx < 0 && tmpRy < 0){
        theta = (360 - degrees(acos(abs(tmpRx)/v)));
      } else {
        theta = degrees(acos(abs(tmpRx)/v));
      }
    } else if(maxX <= x){
      if(0 < tmpRx && tmpRy < 0){
        theta = (180 + degrees(acos(abs(tmpRx)/v)));
      } else {
        theta = (180 - degrees(acos(abs(tmpRx)/v)));
      }
    } else if(y <= minY) {
      if(tmpRx < 0 && tmpRy < 0){
        theta = (180 - degrees(asin(abs(tmpRy)/v)));
      } else {
        theta = (degrees(asin(abs(tmpRy)/v)));
      }
    } else if(maxY <= y) {
      if(tmpRx < 0 && 0 < tmpRy){
        theta = (180 + degrees(asin(abs(tmpRy)/v)));
      } else {
        theta = (360 - degrees(asin(abs(tmpRy)/v)));
      }
    }
    rx = (v * cos(radians(theta)));
    ry = (v * sin(radians(theta)));
  }
  noStroke();
  fill(0, 0, 255);
  translate(width/2, height/2);
  ellipse(x, y, d, d);
  x += rx;
  y += ry;
}

private float getSpeedRate(){
  return random(4, 10);
  //return 10;
}
