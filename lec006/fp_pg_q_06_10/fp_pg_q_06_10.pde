/*
問題 6.10 300×300 画素のウインドウの位置 (x, y) を中心とする半径 r 画素の円に内接する n 頂点の★を描画するメ
ソッドを作成せよ．void nStar(int n, int d, int x, int y) ただし，(150, 150) の位置に半径 70 画素の円に
内接する 7 頂点の★を描画せよ．
*/
void setup() {
  //size(642, 338);
  size(300, 300);
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
  nStar(7, r, x, y);
}

void nStar(int n, int d, int x, int y){
  float CircumscribedCircle = float(d);
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
