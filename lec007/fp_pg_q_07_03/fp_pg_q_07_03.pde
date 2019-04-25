// 問題 7.3 ボールが右から左に等速直線運動するアニメーションを作成せよ．
// ただし，ボールが左端で消えたら右端から再度現われるようにせよ．
private float x = 400;
private float vx = 1;
private float spd_rate = 10;
private float d = 20;

void setup(){
  size(400, 20);
  smooth();
  background(255, 255, 255);
  ellipseMode(CORNER);
  frameRate(30);
}

void draw(){
  background(255, 255, 255);
  noStroke();
  fill(200, 255, 200);
  ellipse(x, 0, d, d);
  x -= (vx * spd_rate);
  if(x < 0){
    x = 400;
  }
}
