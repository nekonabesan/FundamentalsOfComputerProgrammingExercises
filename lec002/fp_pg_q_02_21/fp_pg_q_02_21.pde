void setup() {
  size(600, 400);
}

// https://en.wikipedia.org/wiki/Flag_of_Vietnam
void draw() {
  background(255, 255, 255);
  // blue rectangle
  // 0033a0
  // https://encycolorpedia.jp/0033a0
  noStroke();
  fill(0, 51, 106);
  rect(0, 0, 200, 200);
  // red rectangle
  // https://encycolorpedia.jp/c81040
  // #c81040
  noStroke();
  fill(200, 16, 64);
  rect(0, 200, 600, 200);
  // start
  noStroke();
  fill(255, 255, 255);
  star(100, 100, 50, 19, 5, -126);
}

//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// int rotate Rotational correction rate
//------------------------------------------------------------------//
void star(int x, int y, float CircumscribedCircle, float InscribedCircle, int p, int rotatete) {
  int cnt = p * 2;
  float radius = 0;

  // http://www.d-improvement.jp/learning/processing/2011-a/08.html
  pushMatrix();
  translate(x, y);
  rotate(radians(rotatete));
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
