// 問題 9.6 等速直線運動をしながら壁で反射する 100 個のボールを描画するアニメーションをクラスを用いて作成せよ．
// ただし，ボールどうしの衝突は考慮しなくてもよい．ボールの大きさ，速度，初期位置，色は全てランダムに与えよ．
private MoveCircle[] mc = new MoveCircle[100];
private float x = 0;
private float y = 0;
private float vx = 0;
private float vy = 0;
private float r = 0;
private float g = 0;
private float b = 0;
private float d = 10;

void setup(){
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

class MoveCircle {
  private float x = 0;
  private float y = 0;
  private float vx = 0;
  private float vy = 0;
  private float rx = 0;
  private float ry = 0;
  private float w = 0;
  private float h = 0;
  private float d = 20;
  private boolean flg = true;
  private float v = 0;
  private float theta = 0;
  private float minX = 0;
  private float maxX = 0;
  private float minY = 0;
  private float maxY = 0;
  private float tmpRx = 0;
  private float tmpRy = 0;
  private float r = 0;
  private float g = 0;
  private float b = 0;


  MoveCircle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float pd){
    x = px;
    y = py;
    vx = pvx;
    vy = pvy;
    r = red;
    g = green;
    b = blue;
    w = pw;
    h = ph;
    d = pd;
    minX = -(w/2) + d/2;
    maxX = (w/2) - d/2;
    minY = -(h/2) + d/2;
    maxY = (h/2) - d/2;
    rx = (vx * getSpeedRate());
    ry = (vy * getSpeedRate());
    ellipseMode(CENTER);
  }

  public void move(){
    if(x <= minX || maxX <= x || y <= minY || maxY <= y){
      if(x <= minX){
        x = minX;
      } else if(maxX <= x) {
        x = maxX;
      }
      if(y <= minY) {
        y = minY;
      } else if(maxY <= y) {
        y = maxY;
      }
      // 速度のx成分とy成分からスカラーを導出する処理
      tmpRx = rx;
      tmpRy = ry;
      v = (sqrt(sq(rx) + sq(ry)));
      if(x <= minX){
        if(tmpRx < 0 && tmpRy < 0){
          theta = (360 - degrees(acos(abs(tmpRx)/v)));
        } else {
          theta = degrees(acos(abs(tmpRx)/v));
        }
      } else if(maxX <= x){
        if(0 < tmpRx && tmpRy < 0){
          theta = (180 + degrees(acos(abs(tmpRx)/v)));
        } else {
          theta = (180 - degrees(acos(abs(tmpRx)/v)));
        }
      } else if(y <= minY) {
        if(tmpRx < 0 && tmpRy < 0){
          theta = (180 - degrees(asin(abs(tmpRy)/v)));
        } else {
          theta = (degrees(asin(abs(tmpRy)/v)));
        }
      } else if(maxY <= y) {
        if(tmpRx < 0 && 0 < tmpRy){
          theta = (180 + degrees(asin(abs(tmpRy)/v)));
        } else {
          theta = (360 - degrees(asin(abs(tmpRy)/v)));
        }
      }
      rx = (v * cos(radians(theta)));
      ry = (v * sin(radians(theta)));
    }
    x += rx;
    y += ry;
  }

  public void draw(){
    noStroke();
    fill(r, g, b);
    ellipse(x, y, d, d);
  }

  private float getSpeedRate(){
    return random(2, 5);
  }
}
