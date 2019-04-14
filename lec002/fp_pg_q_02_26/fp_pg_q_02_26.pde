void setup() {
  size(600, 400);
}

void draw() {
  float x = 0;
  float y = 0;
  background(255, 255, 255);
  // red rectangle 01
  // https://www.pantone.com/color-finder/Red-032-C
  noStroke();
  fill(239, 51, 64);
  rect(0, 0, 600, 200);
  // white circle 01
  noStroke();
  fill(255, 255, 255);
  ellipse(120,100,140,140);
  // red cercle 01
  noStroke();
  fill(239, 51, 64);
  ellipse(140,100,125,125);
  // white start 01
  // white start 02
  // white start 03
  // white start 04
  // white start 05
  noStroke();
  fill(255, 255, 255);
  for (int i = 0; i < 5; i++){
    x = (40 * cos(radians(360 * i/5) - PI/2)) + 140;
    y = (40 * sin(radians(360 * i/5) - PI/2)) + 100;
    star(x, y, 16, 6, 5, -126);
  }
}

//------------------------------------------------------------------//
// float x Center x coordinate
// float y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// int rotate Rotational correction rate
//------------------------------------------------------------------//
void star(float x, float y, float CircumscribedCircle, float InscribedCircle, int p, int rotatete) {
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
