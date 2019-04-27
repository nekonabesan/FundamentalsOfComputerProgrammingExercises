// 問題 7.5 ボールがウインドウ内を壁に反射しながら上下に等速直線運動するアニメーションを作成せよ．
private float x = 20;
private float y = 20;
private float vx = 1;
private float vy = 1;
private float rx = (vx * getSpeedRate());
private float ry = (vy * getSpeedRate());
private float d = 20;
private boolean flg = true;
private float v = 0;

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
  if(x <= 0 || 380 <= x || y <= 0 || 380 <= y){
    v = sqrt(sq(rx) + sq(ry));
    if(vx <= 0 && vy <= 0){
      //　↖
      if(x <= 0 && y <= 0){
        rx = v * cos(degrees(acos(rx/v) - 180));
        ry = v * sin(degrees(asin(ry/v) - 180));
      } else if (x <= 0 && 0 < y) {
        rx = v * cos(degrees(acos(rx/v) - 90));
        ry = v * sin(degrees(asin(ry/v) - 90));
      } else if (0 < x && y <= 0) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      }
    } else if(vx <= 0 && 0 < vy){
      // ↙
      if (x <= 0 && 0 < y) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      } else if (0 < x && 380 <= y) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      } else if (x <= 0 && 380 <= y) {
        rx = v * cos(degrees(acos(rx/v) - 180));
        ry = v * sin(degrees(asin(ry/v) - 180));
      }
    } else if(0 < vx && vy <= 0) {
      // ↗
      if (0 < x && y <= 0) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      } else if (380 <= x && 0 < y) {
        rx = v * cos(degrees(acos(rx/v) - 90));
        ry = v * sin(degrees(asin(ry/v) - 90));
      } else if (380 <= x && y <= 0) {
        rx = v * cos(degrees(acos(rx/v) + 180));
        ry = v * sin(degrees(asin(ry/v) + 180));
      }
    } else if(0 < vx && 0 < vy) {
      //  ↘
      if (380 <= x && 0 < y) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      } else if (380 <= x && 380 <= y) {
        rx = v * cos(degrees(acos(rx/v) + 180));
        ry = v * sin(degrees(asin(ry/v) + 180));
      } else if (0 < x && 380 <= y) {
        rx = v * cos(degrees(acos(rx/v) + 90));
        ry = v * sin(degrees(asin(ry/v) + 90));
      }
    }
    //println(x);
    //println(y);
    //println(cos(180 - 90 - cos(acos(radians(rx/v)))));
    //println(sin(180 - 90 - sin(asin(radians(ry/v)))));
    //rx = v * cos(degrees(acos(rx/v)));
    //ry = v * sin(degrees(asin(ry/v)));
    println(degrees(acos(rx/v)));
    println(degrees(asin(ry/v)));
    //println("rx : " + rx);
    //println("ry : " + ry);
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

    x += rx;
    y += ry;
  }
}

private float getSpeedRate(){
  return random(1, 5);
  //return 5;
}
