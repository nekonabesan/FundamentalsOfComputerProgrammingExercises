// 問題 6.3 300×300 画素のウインドウを用意し，位置 (x, y) を中心とする半径 50 画素の円に内接する★を描画するメソッドを作成せよ．
// void fiveStar(int x, int y) ただし，(100, 200) の位置に★を描画せよ．
void setup() {
  size(300, 300);
  background(255, 255, 255);
}

void draw(){
  noFill();
  stroke(128, 128, 128);
  ellipse(100, 200, 100, 100);
  noStroke();
  fill(0, 0, 255);
  fiveStar(100, 200);
}

void fiveStar(int x, int y){
  float CircumscribedCircle = 49;
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
