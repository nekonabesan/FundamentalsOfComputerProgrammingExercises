// 問題 5.16 変数を用いて直径 100 画素の円に内接する★型を 5 個横に並べて描画せよ．
void setup() {
  size(500, 300);
  background(255, 255, 255);
}

void draw() {
  int cnt = 5;
  float r = 50;
  float o = 49;
  float i = (o / 2) * 0.77;

  for(float x = (width/2 - ((2 * r) * (cnt / 2))); x <= (width/2 + ((2 * r) * (cnt / 2))); x+=2*r) {
    // draw circle
    strokeWeight(1.0);
    stroke(204, 204, 204);
    noFill();
    ellipse(x, height/2, 2 * r, 2 * r);
    // drow star
    noStroke();
    fill(0, 0, 255);
    star(x, height/2, o, i, 5, PI/2);
  }
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
