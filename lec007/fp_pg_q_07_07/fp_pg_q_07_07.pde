// 問題 7.7 図 7.8 に示すような凸頂点数が 7 の★を描画せよ．
void setup() {
  size(100, 100);
  background(255, 255, 255);
}

void draw(){
  noStroke();
  fill(200, 255, 200);
  star(width/2, height/2, (width /2), (width / 3), 7, PI/2);
}

//------------------------------------------------------------------//
// float x Center x coordinate
// float y Center y coordinate
// float CircumscribedCircle Radius of circumscribed circle
// float InscribedCircle Radius of inscribed circle
// float p  denominator rate
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
