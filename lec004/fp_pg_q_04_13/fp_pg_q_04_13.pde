// 半径の値が簡単に変更可能なように，変数を用いて★を描画するプログラムを作成せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  float r = 100;
  //
  strokeWeight(1);
  stroke(153, 153, 153);
  noFill();
  ellipse(width/2, height/2, 2 * r, 2 * r);
  //
  noStroke();
  fill(0, 51, 153);
  star(width/2, height/2, (r - 1), (r*0.75)/2, 5, PI/2);
}

//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// int p denominator rate
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
