// 問題 4.19 変数を用いて外側の頂点が半径 50 画素の円上で，内側の頂点が半径 30 画素の円上に存在する★を描画
// せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  noStroke();
  fill(0, 0, 255);
  float CircumscribedCircle = 50;
  float InscribedCircle = 30;
  int vertex = 5;
  star(width/2, height/2, CircumscribedCircle, InscribedCircle, vertex, PI/2);
}

//------------------------------------------------------------------//
// flot x Center x coordinate
// flot y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// float rotate Rotational correction rate
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
