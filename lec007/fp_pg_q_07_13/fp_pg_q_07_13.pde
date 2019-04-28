// 問題 7.13 ☆が回転しながら平行移動するアニメーションを作成せよ．
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
private float rad = PI/2;


void setup() {
  size(400, 400);
  smooth();
  background(255, 255, 255);
  //translate(width/2, height/2);
  imageMode(CENTER);
  frameRate(30);
  minX = d;
  maxX = width - d;
  minY = d;
  maxY = height - d;
  y = height/2;
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
  star(x, y, d, d/3, 5, rad);
  rad -= 0.0277;
  x += rx;
  //y += ry;
}

//------------------------------------------------------------------//
// float x Center x coordinate
// float y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// float p  denominator rate
// float rotatete Rotational correction rate
//------------------------------------------------------------------//
void star(float x, float y, float CircumscribedCircle, float InscribedCircle, int p, float rotatete) {
  int cnt = p * 2;
  float radius = 0;

  // http://www.d-improvement.jp/learning/processing/2011-a/08.html
  pushMatrix();
  translate(x, y);
  rotate(rotatete);
  beginShape();
  for (int i = 1; i <= cnt; i++) {
    if (i % 2 == 0) {
      radius = InscribedCircle;
    } else {
      radius = CircumscribedCircle;
    }
    vertex(radius * cos(radians(360 * i/cnt)), radius * sin(radians(360 * i/cnt)));
  }
  endShape(CLOSE);
  popMatrix();
}

private float getSpeedRate(){
  return random(2, 8);
}
