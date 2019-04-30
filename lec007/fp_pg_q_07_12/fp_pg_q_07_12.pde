// 問題 7.12 packman が口を開けたり閉じたりするアニメーションを作成
private float cnt = 0;
private boolean flg = true;

void setup() {
  size(120, 120);
  smooth();
  background(255, 255, 255);
  frameRate(30);
}

void draw(){
  int r = 50;
  translate(60, 0);
  int y = height/2;
  stroke(102, 102, 102);
  fill(152, 251, 152);
  ellipse(0, y, r * 2 , r * 2 );
  noStroke();
  fill(255, 255, 255);
  triangle(0, y, r + 2, height /2 + 3 + cnt, r + 2, height /2 - 3 - cnt);
  if(cnt <= -60){
    flg = true;
  } else if (60 <= cnt) {
    flg = false;
  }
  if(flg){
    cnt+=1;
  } else {
    cnt-=1;
  }
}
