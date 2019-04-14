// 問題 4.17 ウインドウサイズが簡単に変更可能なように，変数を用いてベトナム社会主義共和国国旗を描画せよ．
void setup() {
  size(600, 400);
  background(218, 37, 29);
}

// https://en.wikipedia.org/wiki/Flag_of_Vietnam
void draw() {
  FlagofVietnam(600, 400);
}

void FlagofVietnam(float width, float height){
  noStroke();
  fill(255, 255, 0);
  star(width/2, height/2, (width / 5), (width / 13), 5, -126);
}

//------------------------------------------------------------------//
// int x Center x coordinate
// int y Center y coordinate
// int r Radius of circumscribed circle
// int p Radius of inscribed circle
// int ratio  denominator rate
// int rotate Rotational correction rate
//------------------------------------------------------------------//
void star(float x, float y, float CircumscribedCircle, float InscribedCircle, int p, int rotatete) {
  int cnt = p * 2;
  float radius = 0;

  // http://www.d-improvement.jp/learning/processing/2011-a/08.html
  pushMatrix();
  translate(x, y);
  rotate(radians(rotatete));
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
