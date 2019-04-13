void setup() {
  size(600, 400);
}

// https://en.wikipedia.org/wiki/Flag_of_Panama
void draw() {
  background(255, 255, 255);
  // red rectangle
  noStroke();
  fill(200, 16, 46);
  rect(300, 0, 300, 200);
  // red start
  noStroke();
  fill(200, 16, 46);
  star(450, 300, 50, 19, 5, -126);
  // blue rectangle
  noStroke();
  fill(0, 0, 128);
  rect(0, 200, 300, 200);
  // bulue start
  noStroke();
  fill(0, 0, 128);
  star(150, 100, 50, 19, 5, -126);
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
