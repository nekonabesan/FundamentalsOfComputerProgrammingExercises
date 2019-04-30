// 問題 7.10 図 7.11 に示すような徐々に口を開ける packman を描画せよ．
void setup() {
  size(600, 200);
  background(255, 255, 255);
}

void draw(){
  int r = 50;
  translate(60, 0);
  int y = height/2;
  int cnt = 5;
  int offset = 360;
  for(int i = 1; i <= 5; i++){
    stroke(102, 102, 102);
    fill(152, 251, 152);
    ellipse(0, y, r * 2 , r * 2 );
    noStroke();
    fill(255, 255, 255);
    triangle(0, y, r + 2, height /2 + 3 + cnt, r + 2, height /2 - 3 -cnt);
    translate(120, 0);
    cnt+=5;
  }
}
