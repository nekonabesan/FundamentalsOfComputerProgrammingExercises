void setup() {
  size(800, 400);
}

// https://en.wikipedia.org/wiki/Flag_of_Panama
void draw() {
  background(255, 255, 255);
  // blue rectangle 01
  noStroke();
  fill(0, 0, 128);
  rect(0, 0, 800, 80);
  // blue rectangle 02
  noStroke();
  fill(0, 0, 128);
  rect(0, 160, 800, 80);
  // blue rectangle 03
  noStroke();
  fill(0, 0, 128);
  rect(0, 320, 800, 80);
  // red triangle
  noStroke();
  fill(200, 16, 46);
  triangle(0, 0, 0, 400, 340, 200);
  // white start
  noStroke();
  fill(255, 255, 255);
  star(113, 200, 60, 23, 5, -126);
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

  // https://en.wikipedia.org/wiki/Flag_of_Cuba
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
