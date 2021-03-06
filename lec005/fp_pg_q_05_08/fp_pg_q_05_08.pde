// 問題 5.8 for 文を用いて★を描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  float r = 50;
  float i = (r / 2) * 0.75;
  // draw circle
  strokeWeight(1.0);
  stroke(204, 204, 204);
  noFill();
  ellipse(width/2, height/2, 2 * r, 2 * r);
  // drow star
  noStroke();
  fill(0, 0, 255);
  star(width/2, height/2, r - 1, i, 5, PI/2);
}

//------------------------------------------------------------------//
// flot x Center x coordinate
// flot y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// int p  denominator rate
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
