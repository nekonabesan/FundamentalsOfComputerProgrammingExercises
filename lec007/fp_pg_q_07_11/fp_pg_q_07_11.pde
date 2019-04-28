// 問題 7.11 ☆が回転するアニメーションを作成せよ．
private float rad = PI/2;

void setup() {
  size(300, 300);
  smooth();
  background(255, 255, 255);
  frameRate(30);
}

void draw(){
  background(255, 255, 255);
  noStroke();
  fill(152, 251, 152);
  star(width/2, height/2, (width /4), (width / 10), 5, rad);
  rad -= 0.00277;
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
