// 問題 6.7 ★を描画するメソッドを用いて，800 画素 × 800 画素のウインドウに半径 50 画素の円に内接する★を充填せよ．
void setup() {
  size(800, 800);
  background(255, 255, 255);
}

void draw(){
  float r = 50;
  for(float x = r; x <= (width - r); x += (r * 2)){
    for(float y = r; y <= (height - r); y += (r * 2)){
      noFill();
      stroke(128, 128, 128);
      ellipse(x, y, (r * 2), (r * 2));
      noStroke();
      fill(0, 0, 255);
      fiveStar(49, x, y);
    }
  }
}

void fiveStar(float r, float x, float y){
  float CircumscribedCircle = r;
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
