// 問題 8.8 10 個のボールをウインドウ上部に配置する．
// マウスでボールをクリックすると，ボールが自由落下を開始するアニメーションを作成せよ．
private MoveCircle mc = null;
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
  if(mc == null){
    mc = createCircle();
  }
  /*if(mc.getMaxY() <= mc.getY()){
    mc.setX(width);
    mc.setY(height);
    mc.setRgb(255, 255, 255);
    mc = createCircle();
  }*/
  mc.draw();
  if(mousePressed){
    moveMouse(mouseX, mouseY);
  } else {
    mc.setRy(0);
  }
}

private MoveCircle createCircle(){
  x = 0;
  vx = 0;
  vy = random(2, 4);
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
  d = random(10, 50);
  y = -height/2 + d/2;
  mc = new MoveCircle(x, y, vx, vy, r, g, b, width, height, d);
  return mc;
}

private void moveMouse(float mX, float mY){
  mX = mX - width/2;
  mY = mY - height/2;
  if((mc.getX() -d/2 <= mX && mX <= mc.getX() + d/2) && (mc.getY() - d/2 <= mY && mY <= mc.getY() + d/2)){
    println("x : " + mc.getX());
    println("y : " + mc.getY());
    println("mX : " + mX);
    println("mY : " + mY);
    if(mc.getMaxY() + 2 <= mc.getY()) {
      ry = (-1 * random(4, 10));
    } else if (mc.getY() <= mc.getMinY() + 2) {
      ry = (1 * random(4, 10));
    } else {
      if(ry < 0){
        ry = (-1 * random(4, 10));
      } else {
        ry = (1 * random(4, 10));
      }
    }
    mc.setRy(ry);
    mc.move();
  }
}
