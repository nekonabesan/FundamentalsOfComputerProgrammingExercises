// 問題 5.18 図 5.7(b) に示すように直線の色変化で，色相環を表現せよ．
void setup() {
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, 100);
}

void draw() {
  float p = 5.0;
  float w = (width - (p * 26)) / 25;
  float h = 0;
  float s = 0;
  float b = 100;
  float x1 = 0;
  float y1 = 0;
  float x2 = 0;
  float y2 = 0;
  for(float i = 0; i < 360; i+=5){
    //h += (100/25);
    // 色相 (Hue)H，彩度 (Saturation)S，明度 (Brightness)B
    //s += (100/25);
    x1 = width/2 + (width/4 * cos(radians(360 * i/360)));;
    y1 = height/2 + (height/4 * sin(radians(360 * i/360)));
    x2 = width/2 + (width/2.4 * cos(radians(360 * i/360)));
    y2 = height/2 + (height/2.4 * sin(radians(360 * i/360)));
    strokeWeight(1.0);
    stroke(0, 255, 102);
    //stroke(h, s, b);
    line(x1, y1 , x2, y2);
  }
}
