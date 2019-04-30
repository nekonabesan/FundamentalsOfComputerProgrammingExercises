// 問題 6.8 ★を描画するメソッドを用いてアメリカ国旗を描画せよ．
// https://americancenterjapan.com/aboutusa/profile/2770/
void setup() {
  //size(642, 338);
  size(950, 500);
  background(255, 255, 255);
}

void draw(){
  // draw red stripes
  // https://www.pantone.com/color-finder/193-C
  for(float y = 0; y < height; y += ((height * 0.0769)) * 2){
    noStroke();
    fill(191, 13, 62);
    rect(0, y, width, height * 0.0769);
  }
  // draw blue rectangle
  // https://www.pantone.com/color-finder/282-C
  noStroke();
  fill(4, 30, 66);
  rect(0, 0, height * 0.76, height * 0.5383);
  // draw white starts 01
  for(float x = (height * 0.063); x <= ((height * 0.063) + (height * 0.063 * 10)); x += (height * 0.063 * 2)){
    for(float y = height * 0.054; y <= (height * 0.054) + (height * 0.054 * 2 * 4); y += (height * 0.054 * 2)){
      noStroke();
      fill(255, 255, 255);
      fiveStar((height * 0.0616) / 2, x, y);
    }
  }
  // draw white starts 02
  for(float x = (height * 0.063 * 2); x <= ((height * 0.063) + (height * 0.063 * 9)); x += (height * 0.063 * 2)){
    for(float y = (height * 0.054 * 2); y <= (height * 0.054) + (height * 0.054 * 2 * 4); y += (height * 0.054 * 2)){
      noStroke();
      fill(255, 255, 255);
      fiveStar((height * 0.0616) / 2, x, y);
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
