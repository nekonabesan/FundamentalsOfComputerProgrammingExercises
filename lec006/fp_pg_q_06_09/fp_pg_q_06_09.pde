// 問題 6.9 100×100 画素のウインドウに内接する n 頂点の★を描画するメソッドを作成せよ．
// ただし，頂点数 n を引数とすること．void nStar(int n)
void setup() {
  size(100, 100);
  background(255, 255, 255);
}

void draw(){
  int r = 70;
  int x = 150;
  int y = 150;
  noFill();
  stroke(128, 128, 128);
  ellipse(x, y, (r * 2), (r * 2));
  noStroke();
  fill(0, 0, 255);
  nStar(5);
}

void nStar(int n) {
  int x = width/2;
  int y = height/2;
  float CircumscribedCircle = width/2;
  float InscribedCircle = (CircumscribedCircle / 2) * 0.75;
  int p = n;
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
