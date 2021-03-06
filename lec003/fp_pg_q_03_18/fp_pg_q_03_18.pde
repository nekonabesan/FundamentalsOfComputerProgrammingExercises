
// 問題 3.18 図 2.15 の仕様に示したホンジュラス共和国国旗を算術演算子を用いて描画せよ．
void setup() {
  size(360, 180);
  background(255, 255, 255);
}

// https://en.wikipedia.org/wiki/Flag_of_Honduras
void draw() {
  int x = 0;
  int y = 0;
  // blue rectangle 01
  // https://www.color-sample.com/colors/00008b/
  noStroke();
  fill(0, 0, 139);
  rect(x, y, 360, 60);
  // blue rectangle 02
  noStroke();
  fill(0, 0, 139);
  y+=120;
  rect(x, y, 360, 60);
  // blue start 01
  noStroke();
  fill(0, 0, 139);
  x+=120;
  y-=45;
  star(x, y, 10, 4, 5, PI/2);
  // blue start 02
  noStroke();
  fill(0, 0, 139);
  y+=30;
  star(x, y, 10, 4, 5, PI/2);
  // blue start 03
  noStroke();
  fill(0, 0, 139);
  x+=60;
  y-=15;
  star(x, y, 10, 4, 5, PI/2);
  // blue start 04
  noStroke();
  fill(0, 0, 139);
  x+=60;
  y-=15;
  star(x, y, 10, 4, 5, PI/2);
  // blue start 05
  noStroke();
  fill(0, 0, 139);
  y+=30;
  star(x, y, 10, 4, 5, PI/2);
}

//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// int p denominator rate
// float rotatete Rotational correction rate
//------------------------------------------------------------------//
void star(int x, int y, float CircumscribedCircle, float InscribedCircle, int p, float rotatete) {
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
