// 問題 8.9 10 個のボールをウインドウ上部から自由落下させ，マウスでボールをクリックすると，
// クリックしたボールだけ初期化して上から自由落下を再開するアニメーションを作成せよ．
private MoveCircle[] mc = new MoveCircle[10];
private MoveCircle mci = null;
private float d = 40;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  if(mc[0] == null){
    createCircle();
  }
  for(int i = 0; i < 10; i++){
    this.mc[i].move();
    this.mc[i].draw();
    if(mc[i].getMaxY() - d/2 <= mc[i].getY()){
      this.mc[i].setRy(0);
      this.mc[i].setY(height/2 - d/2);
    }
  }
  if(mousePressed){
    this.moveMouse(mouseX, mouseY);
  }
}

private void createCircle(){
  float y = -height/2 + d/2;
  float x = -(width / 2 - d / 2);
  float vx = 0;
  float vy = 0;
  float r = 0;
  float g = 0;
  float b = 0;
  for(int i = 0; i < 10; i++){
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    this.mc[i] = new MoveCircle(x, y, vx, vy, r, g, b, width, height, d);
    this.mc[i].setRx(0);
    this.mc[i].setVx(0);
    this.mc[i].setRy(random(4, 10));
    x = d * (i + 1) + 20 - width/2;
  }
}

private void moveMouse(float mX, float mY){
  mX = mX - width/2;
  mY = mY - height/2;
  for(int i = 0; i < 10; i++){
    if((mc[i].getX() -d/2 <= mX && mX <= mc[i].getX() + d/2) && (mc[i].getY() - d/2 <= mY && mY <= mc[i].getY() + d/2)){
      this.mc[i].setY(-height/2 + d/2);
      this.mc[i].setRy(random(4, 10));
      this.mc[i].draw();
    }
  }
}
