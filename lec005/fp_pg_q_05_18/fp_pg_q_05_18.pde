// 問題 5.18 図 5.7(b) に示すように直線の色変化で，色相環を表現せよ．
void setup() {
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, 360);
}

void draw() {
  float p = 5.0;
  float w = (width - (p * 26)) / 25;
  float h = 0;
  float s = 180;
  float b = 360;
  float x1 = 0;
  float y1 = 0;
  float x2 = 0;
  float y2 = 0;
  for(float i = 0; i < 360; i+=3.6){
    // 色相 (Hue)H，彩度 (Saturation)S，明度 (Brightness)B
    x1 = width/2 + (width/6 * cos(radians(360 * i/360)));;
    y1 = height/2 + (height/6 * sin(radians(360 * i/360)));
    x2 = width/2 + (width/2.4 * cos(radians(360 * i/360)));
    y2 = height/2 + (height/2.4 * sin(radians(360 * i/360)));
    strokeWeight(1.0);
    stroke(h, s, b);
    line(x1, y1 , x2, y2);
    if(i <= 356.4){
      h += 3.6;
    }
    if(i <= 180){
      s += 3.6;
    }else{
      s -= 3.6;
    }
  }
}
