// 問題 4.10 半径の値が簡単に変更可能なように，変数を用いて半径 65 画素の円に内接する正 5 角形を描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  float r = 65;
  //
  strokeWeight(1);
  stroke(153, 153, 153);
  noFill();
  ellipse(width/2, height/2, 2 * r, 2 * r);
  //
  noStroke();
  fill(0, 51, 153);
  Polygon(width/2, height/2, (r - 1), 5, -PI/2);
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
