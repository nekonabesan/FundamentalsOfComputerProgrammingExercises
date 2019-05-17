// 問題 6.5 ★を描画するメソッドを用いてベトナム国旗を描画せよ．
void setup() {
  size(600, 400);
  background(218, 37, 29);
}

// https://en.wikipedia.org/wiki/Flag_of_Vietnam
void draw() {
  FlagofVietnam();
}

void FlagofVietnam(){
  noStroke();
  fill(255, 255, 0);
  star(width/2, height/2, (width / 5), (width / 13), 5, PI/2);
}

//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// int rotate Rotational correction rate
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
