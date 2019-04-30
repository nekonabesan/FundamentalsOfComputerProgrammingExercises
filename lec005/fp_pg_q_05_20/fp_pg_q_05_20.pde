// 問題 5.20 図 5.7(d) に示すようなに色相が同心円の半径に比例して滑らかに変化させよ．
void setup() {
  size(500, 500);
  background(255, 255, 255);
  colorMode(HSB, (width - width/20));
}

void draw() {
  float x = 0;
  float y = 0;
  float h = 0;
  float s = 0;
  float b = width;
  for(float i = 0; i <= (width - width/20) ; i++){
    noFill();
    stroke(h, width, b);
    ellipse(width/2, height/2, i, i);
    h+=1;
    s+=1;
  }
}
