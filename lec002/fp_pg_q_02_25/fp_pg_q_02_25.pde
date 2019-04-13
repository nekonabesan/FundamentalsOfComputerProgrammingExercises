void setup() {
  size(720, 360);
}

// https://en.wikipedia.org/wiki/Flag_of_Panama
void draw() {
  background(255, 255, 255);
  // blue rectangle 01
  noStroke();
  fill(0,102,204);
  rect(0, 0, 720, 120);
  // blue rectangle 02
  noStroke();
  fill(0,102,204);
  rect(0, 240, 720, 120);
  // blue start 01
  noStroke();
  fill(0,102,204);
  star(240, 150, 20, 8, 5, -126);
  // blue start 02
  noStroke();
  fill(0,102,204);
  star(240, 210, 20, 8, 5, -126);
  // blue start 03
  noStroke();
  fill(0,102,204);
  star(360, 180, 20, 8, 5, -126);
  // blue start 04
  noStroke();
  fill(0,102,204);
  star(480, 150, 20, 8, 5, -126);
  // blue start 05
  noStroke();
  fill(0,102,204);
  star(480, 210, 20, 8, 5, -126);
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
