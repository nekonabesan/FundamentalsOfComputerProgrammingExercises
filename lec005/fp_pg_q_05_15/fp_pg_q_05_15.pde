// 問題 5.15 図 5.6(f) に示すように垂直な線分の長さが変化する図を描画せよ．
void setup() {
  size(600, 100);
  background(255, 255, 255);
}

void draw() {
  float r = 6;
  float s = 3.0;
  float y = (height/2 - r);
  float f = 0;
  float cnt = ((width - (2 * r)) / (2 * r));
  float i = cnt;
  strokeWeight(1.0);
  stroke(0, 255, 102);
  for (float x = r; x <= (width - r); x+=r) {
    f = y * sin(radians(360 * i/cnt));
    /*if(f < 0){
      f = f * -1;
    }*/
    line(x, r + y + f, x, r + y - f);
    if(0 <= i){
      i++;
    } else {
      i=0;
    }
  }
}
