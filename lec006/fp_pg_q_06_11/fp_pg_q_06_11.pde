// 問題 6.11 ★を描画するメソッドを用いて半径 10, 20, 30, 40, 50 画素の円に内接する★を 5 個横に並べて描画せよ．
void setup() {
  //size(642, 338);
  size(300, 300);
  background(255, 255, 255);
}

void draw(){
  int r = 0;
  int x = 0;
  int pos = 0;
  int y = width/2;
  int[] array = {10, 20, 30, 40, 50};
  for(int i = 0; i < 5; i++){
    pos+=array[i] * 2;
    x = pos - array[i];
    r = array[i];
    noFill();
    stroke(128, 128, 128);
    ellipse(x, y, (r * 2), (r * 2));
    noStroke();
    fill(0, 0, 255);
    nStar(5, r, x, y);
  }
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
