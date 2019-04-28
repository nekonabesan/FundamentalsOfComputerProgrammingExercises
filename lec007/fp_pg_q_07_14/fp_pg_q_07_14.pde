// 問題 7.14 packman が口を開けながら移動するアニメーションを作成せよ．
private float x = 0;
private float y = 0;
private float vx = 1;
private float vy = 1;
private float rx = (vx * getSpeedRate());
private float ry = (vy * getSpeedRate());
private float d = 40;
private boolean flg = true;
private float v = 0;
private float theta = 0;
private float minX = 0;
private float maxX = 0;
private float minY = 0;
private float maxY = 0;
private float tmpRx = 0;
private float tmpRy = 0;
private float rad = PI/2;
private float cnt = 0;

void setup() {
  size(400, 400);
  smooth();
  background(255, 255, 255);
  //translate(width/2, height/2);
  imageMode(CENTER);
  frameRate(30);
  minX = -(width/2) + d/2;
  maxX = (width/2) - d/2;
  minY = -(height/2) + d/2;
  maxY = (height/2) - d/2;
  //y = height/2;
}

void draw(){
  background(255, 255, 255);
  move();
  noStroke();
  fill(0, 0, 255);
  translate(x, y);
  packman();
  //translate(x,y);
  x += rx;
  y += ry;
}

private void packman(){
  float r = d/2;
  stroke(102, 102, 102);
  fill(255, 255, 51);
  ellipse(width/2, height/2, r * 2 , r * 2 );
  noStroke();
  fill(255, 255, 255);
  triangle(width/2, height/2, r + 2, height/2 + 3 + cnt, r + 2, height /2 - 3 - cnt);
  if(cnt <= -60){
    flg = true;
  } else if (60 <= cnt) {
    flg = false;
  }
  if(flg){
    cnt+=1;
  } else {
    cnt-=1;
  }
}

private void move(){
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
}

private float getSpeedRate(){
  return random(4, 10);
  //return 10;
}
