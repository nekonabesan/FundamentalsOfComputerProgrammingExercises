// 問題 7.2 ボールが上から下に等速直線運動するアニメーションを作成せよ．ただし，
// ボールが下端に消えたらプログラムを終了するようにせよ
private float x = 0;
private float y = 1;
private float vy = 1;
private float spd_rate = 1;
private float d = 20;

void setup(){
  size(20, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CORNER);
  frameRate(30);
}

void draw(){
  background(255, 255, 255);
  noStroke();
  fill(200, 255, 200);
  ellipse(x, y, d, d);
  y += (vy * spd_rate);
  if(height < y){
    //y = 1;
    exit();
  }
}
