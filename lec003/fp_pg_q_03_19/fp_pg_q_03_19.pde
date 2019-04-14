// 問題 3.19 図 3.4(a) に示す描画概念を参考に，外側の頂点が半径 50 画素の円上で内側の頂点が半径 30 画素の円上に
// 存在する★を算術演算子を用いて描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  float height = 300;
  float width = 300;
  noStroke();
  fill(0, 0, 255);
  star(width/2, height/2, 50, 30, 5, PI/2);
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
