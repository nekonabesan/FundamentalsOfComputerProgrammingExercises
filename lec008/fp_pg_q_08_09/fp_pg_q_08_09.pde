// 問題 8.9 10 個のボールをウインドウ上部から自由落下させ，マウスでボールをクリックすると，
// クリックしたボールだけ初期化して上から自由落下を再開するアニメーションを作成せよ．
private MoveCircle[] mc = new MoveCircle[10];
private MoveCircle mci = null;
private float x = 0;
private float y = 0;
private float vx = 0;
private float vy = 0;
private float rx = 0;
private float ry = 0;
private float r = 0;
private float g = 0;
private float b = 0;
private float d = 20;


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
  /*if(mc.getMaxY() <= mc.getY()){
    mc.setX(width);
    mc.setY(height);
    mc.setRgb(255, 255, 255);
    mc = createCircle();
  }*/
  for(int i = 0; i < 10; i++){
    mc[i].draw();
  }
  if(mousePressed){
    moveMouse(mouseX, mouseY);
  } else {
    for(int i = 0; i < 10; i++){
      mc[i].setRy(0);
    }
  }
}

private void createCircle(){
  for(int i = 0; i < 10; i++){
    y = 0;
    vx = 0;
    vy = random(2, 4);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    d = 40;
    x = d * i + 20 - width/2;
    mc[i] = new MoveCircle(x, y, vx, vy, r, g, b, width, height, d);
  }
}

private void moveMouse(float mX, float mY){
  mX = mX - width/2;
  mY = mY - height/2;
  for(int i = 0; i < 10; i++){
    if((mc[i].getX() -d/2 <= mX && mX <= mc[i].getX() + d/2) && (mc[i].getY() - d/2 <= mY && mY <= mc[i].getY() + d/2)){
      println("x : " + mc[i].getX());
      println("y : " + mc[i].getY());
      println("mX : " + mX);
      println("mY : " + mY);
      if(mc[i].getMaxY() + 2 <= mc[i].getY()) {
        ry = (-1 * random(4, 10));
      } else if (mc[i].getY() <= mc[i].getMinY() + 2) {
        ry = (1 * random(4, 10));
      } else {
        if(ry < 0){
          ry = (-1 * random(4, 10));
        } else {
          ry = (1 * random(4, 10));
        }
      }
      mc[i].setRy(ry);
      mc[i].move();
    }
  }
}
