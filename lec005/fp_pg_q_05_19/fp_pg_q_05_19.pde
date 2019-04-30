// 問題 5.19 図 5.7(c) に示すように色相が同心円の半径に依存して変化させよ
void setup() {
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, width);
}

void draw() {
  float x = 0;
  float y = 0;
  float h = 0;
  float s = 0;
  float b = width;
  for(float i = 0; i < width; i+=(width/20)){
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, i, i);
    h+=width/20;
    s+=width/20;
  }
}
