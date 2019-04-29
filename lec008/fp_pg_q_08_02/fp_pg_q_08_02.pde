// 問題 8.2 等速直線運動をしながら壁で反射する 100 個のボールを描画せよ．
// ただし，ボールどうしの衝突は考慮しなくてもよい．ボールの大きさ，速度，初期位置，色は全てランダムに与えよ．
private MoveCircle[] mc = new MoveCircle[100];

void setup(){
  float x = 0;
  float y = 0;
  float vx = 0;
  float vy = 0;
  float r = 0;
  float g = 0;
  float b = 0;
  float d = 10;
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CENTER);
  frameRate(30);

  for(int i = 0; i < 100; i++){
    x = random(-100, 100);
    y = random(-100, 100);
    vx = random(1, 10);
    vy = random(1, 10);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    d = random(10, 50);
    mc[i] = new MoveCircle(x, y, vx, vy, r, g, b, width, height, d);
  }
}

void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  for(int i = 0; i < 100; i++){
    mc[i].draw();
    mc[i].move();
  }
}
