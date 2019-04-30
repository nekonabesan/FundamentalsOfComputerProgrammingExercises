// 問題 7.8 図 7.9 に示すような凸頂点数が 3 から 10 までの★を描画せよ．
void setup() {
  //size(642, 338);
  size(820, 100);
  background(255, 255, 255);
}

void draw(){
  int r = 50;
  int x = 60;
  int y = height/2;
  for(int i = 3; i <= 10; i++){
    noStroke();
    if(i % 2 == 0){
      //fill(255, 153, 204);
    } else {
      fill(152, 251, 152);
    }
    nStar(i, r, x, y);
    x+=100;
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
