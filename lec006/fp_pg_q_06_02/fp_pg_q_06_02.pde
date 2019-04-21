// 問題 6.2 例題 6.2 を参考にして，正方形のウインドウ内に★を描画するメソッドを作成せよ．void fiveStar(int r)
// ただし，r は★の外接円の半径で，メソッドは fiveStar(width / 2) で呼び出すこと．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw(){
  noStroke();
  fill(0, 0, 255);
  fiveStar(width/2);
}

void fiveStar(float CircumscribedCircle) {
  float x = width/2;
  float y = height/2;
  float InscribedCircle = (CircumscribedCircle / 2) * 0.77;
  int p = 5;
  int cnt = p * 2;
  float radius = 0;
  float rotatete = PI/2;
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
