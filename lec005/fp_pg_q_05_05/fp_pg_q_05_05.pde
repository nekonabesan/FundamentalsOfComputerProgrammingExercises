// 問題 5.5 変数を用いて★を描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  float o = 50;
  float i = (o / 2) * 0.75;
  noStroke();
  fill(0, 0, 255);
  //star(width/2, height/2, o, i, 5, PI/2);
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/2);
  beginShape();
  vertex(o * cos(radians(360 * 0)), o * sin(radians(360 * 0)));
  vertex(i * cos(radians(360 * 1/10)), i * sin(radians(360 * 1/10)));
  vertex(o * cos(radians(360 * 2/10)), o * sin(radians(360 * 2/10)));
  vertex(i * cos(radians(360 * 3/10)), i * sin(radians(360 * 3/10)));
  vertex(o * cos(radians(360 * 4/10)), o * sin(radians(360 * 4/10)));
  vertex(i * cos(radians(360 * 5/10)), i * sin(radians(360 * 5/10)));
  vertex(o * cos(radians(360 * 6/10)), o * sin(radians(360 * 6/10)));
  vertex(i * cos(radians(360 * 7/10)), i * sin(radians(360 * 7/10)));
  vertex(o * cos(radians(360 * 8/10)), o * sin(radians(360 * 8/10)));
  vertex(i * cos(radians(360 * 9/10)), i * sin(radians(360 * 9/10)));
  endShape(CLOSE);
  popMatrix();
}

//------------------------------------------------------------------//
// flot x Center x coordinate
// flot y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// int p  denominator rate
// float rotatete Rotational correction rate
//------------------------------------------------------------------//
/*void star(float x, float y, float CircumscribedCircle, float InscribedCircle, int p, float rotatete) {
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
}*/
