// 問題 6.6 ★を描画するメソッドを用いてホンジュラス国旗を描画せよ．
void setup() {
  size(720, 360);
  background(255, 255, 255);
}

// https://en.wikipedia.org/wiki/Flag_of_Panama
void draw() {
  flagOfHonduras();
}

void flagOfHonduras(){
  float x = 0;
  float y = 0;
  // blue rectangle 01
  noStroke();
  fill(0, 102, 204);
  rect(x, y, width, height/3);
  // blue rectangle 02
  noStroke();
  fill(0,102,204);
  y+=height*2/3;
  rect(x, y, width, height/3);
  // blue start 01
  noStroke();
  fill(0,102,204);
  x = width * 1/3;
  y = height * 5/12;
  star(x, y, (height * 1/18), (height * 1/42), 5, PI/2);
  // blue start 02
  noStroke();
  fill(0,102,204);
  y = height * 7/12;
  star(x, y, (height * 1/18), (height * 1/42), 5, PI/2);
  // blue start 03
  noStroke();
  fill(0,102,204);
  x = width * 1/2;
  y = height * 1/2;
  star(x, y, (height * 1/18), (height * 1/42), 5, PI/2);
  // blue start 04
  noStroke();
  fill(0,102,204);
  x = width * 2/3;
  y = height * 5/12;
  star(x, y, (height * 1/18), (height * 1/42), 5, PI/2);
  // blue start 05
  noStroke();
  fill(0,102,204);
  y = height * 7/12;
  star(x, y, (height * 1/18), (height * 1/42), 5, PI/2);
}


//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// int rotate Rotational correction rate
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
