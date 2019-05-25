// 問題 5.17 図 5.7(a) に示すように横方向に色相，縦方向に彩度が変化する円を描画せよ．
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
  /*for(float x = w; x < (w + p) * 25; x+=(w + p)){
    s = 0;
    h += (100/25);
    for(float y = w; y < ((w + p) * 25); y+=(w + p)){
      // 色相 (Hue)H，彩度 (Saturation)S，明度 (Brightness)B
      s += (100/25);
      noStroke();
      fill(h, s, b);
      ellipse(x, y, w, w);
    }
  }*/
  float x = w;
  float y = 0;
  while(x < (w + p) * 25){
    s = 0;
    h += (100/25);
    y = w;
    while(y < ((w + p) * 25)){
      // 色相 (Hue)H，彩度 (Saturation)S，明度 (Brightness)B
      s += (100/25);
      noStroke();
      fill(h, s, b);
      ellipse(x, y, w, w);
      y+=(w + p);
    }
    x+=(w + p);
  }
}
