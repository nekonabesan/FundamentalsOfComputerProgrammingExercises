void setup() {
  size(300, 300);
  background(255, 255, 255);
}

// 問題 3.13 半径 100 画素の円に内接する正 10 角形を算術演算子を用いて描画せよ．
void draw() {
  //
  strokeWeight(1);
  stroke(153, 153, 153);
  noFill();
  ellipse(150, 150, 200, 200);
  //
  noStroke();
  fill(0, 51, 153);
  Polygon(150, 150, 99, 10, -PI/2);
}

//------------------------------------------------------------------//
// float x Center x coordinate
// float y Center y coordinate
// int r Radius of circumscribed circle
// int ratio  denominator rate
// float  = ; rotate Rotational correction rate
//------------------------------------------------------------------//
void Polygon(float x, float y, float CircumscribedCircle, int p, float rotatete) {
  // http://www.d-improvement.jp/learning/processing/2011-a/08.html
  pushMatrix();
  translate(x, y);
  rotate(rotatete);
  beginShape();
  for (int i = 1; i <= p; i++) {
    vertex(CircumscribedCircle * cos(radians(360 * i/p)), CircumscribedCircle * sin(radians(360 * i/p)));
  }
  endShape(CLOSE);
  popMatrix();
}
