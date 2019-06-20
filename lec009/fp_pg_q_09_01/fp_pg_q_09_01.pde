// 問題 9.1 ボールが壁に反射しながら水平方向に等速直線運動するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとしてボールの色 c，直径 d，位置 x, y，水平方向の速度 vx を持ち，
// メソッドとしてはボールの移動を処理する move メソッド，ボールを描画する draw メソッドを用意せよ．
ReflectionCircle rc;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  rc = new ReflectionCircle(0, 40, 1, 0, 5, width, height);
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2);
  rc.draw();
  rc.move();
}

// 問題 9.1 ボールが壁に反射しながら水平方向に等速直線運動するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとしてボールの色 c，直径 d，位置 x, y，水平方向の速度 vx を持ち，
// メソッドとしてはボールの移動を処理する move メソッド，ボールを描画する draw メソッドを用意せよ．
class ReflectionCircle extends MoveCircle {
  private float c;
  private float d;
  private float x;
  private float y;
  private float vx;
  private float w;
  private float h;

  /*public void setX(float x){
    this.x = x;
  }
  public float getX(){
    return this.x;
  }
  public void setY(float y){
    this.y = y;
  }
  public float getY(){
    return this.y;
  }*/

  ReflectionCircle(float c, float d, float x, float y, float vx, float w, float h){
    super(x, y, vx, 0, 0, 0, 255, w, h, d);
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

  public void setX(float x){
    this.x = x;
  }
  public float getX(){
    return this.x;
  }
  public void setY(float y){
    this.y = y;
  }
  public float getY(){
    return this.y;
  }
  public void setVx(float vx){
    this.vx = vx;
  }
  public float getVx(){
    return this.vx;
  }
  public void setVy(float vy){
    this.vy = vy;
  }
  public float getVy(){
    return this.vy;
  }
  public void setRx(float rx){
    this.rx = rx;
  }
  public float getRx(){
    return this.rx;
  }
  public void setRy(float ry){
    this.ry = ry;
  }
  public float getRy(){
    return this.ry;
  }
  public void setMinX(float rMinX){
    minX = rMinX;
  }
  public float getMinX(){
    return minX;
  }
  public void setMaxX(float rMaxX){
    maxX = rMaxX;
  }
  public float getMaxX(){
    return maxX;
  }
  public void setMinY(float minY){
    this.minY = minY;
  }
  public float getMinY(){
    return minY;
  }
  public void setMaxY(float maxY){
    this.maxY = maxY;
  }
  public float getMaxY(){
    return maxY;
  }


  MoveCircle(float x, float y, float vx, float vy, float r, float g, float b, float w, float h, float d){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.g = g;
    this.b = b;
    this.w = w;
    this.h = h;
    this.d = d;
    this.minX = -(w/2) + d/2;
    this.maxX = (w/2) - d/2;
    this.minY = -(h/2) + d/2;
    this.maxY = (h/2) - d/2;
    this.rx = (this.vx * this.getSpeedRate());
    this.ry = (this.vy * this.getSpeedRate());
    ellipseMode(CENTER);
  }

  public void setRgb(float r, float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  }

  public void move(){
    if(this.x <= this.minX || this.maxX <= this.x || y <= this.minY || this.maxY <= this.y){
      if(this.x <= this.minX){
        this.x = this.minX;
      } else if(this.maxX <= this.x) {
        this.x = this.maxX;
      }
      if(this.y <= this.minY) {
        this.y = this.minY;
      } else if(this.maxY <= this.y) {
        this.y = this.maxY;
      }
      // 速度のx成分とy成分からスカラーを導出する処理
      this.tmpRx = this.rx;
      this.tmpRy = this.ry;
      this.v = (sqrt(sq(this.rx) + sq(this.ry)));
      if(this.x <= this.minX){
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (360 - degrees(acos(abs(this.tmpRx)/this.v)));
        } else {
          this.theta = degrees(acos(abs(this.tmpRx)/this.v));
        }
      } else if(this.maxX <= this.x){
        if(0 < this.tmpRx && this.tmpRy < 0){
          this.theta = (180 + degrees(acos(abs(this.tmpRx)/this.v)));
        } else {
          this.theta = (180 - degrees(acos(abs(this.tmpRx)/this.v)));
        }
      } else if(this.y <= this.minY) {
        if(this.tmpRx < 0 && this.tmpRy < 0){
          this.theta = (180 - degrees(asin(abs(this.tmpRy)/this.v)));
        } else {
          this.theta = (degrees(asin(abs(this.tmpRy)/this.v)));
        }
      } else if(this.maxY <= this.y) {
        if(this.tmpRx < 0 && 0 < this.tmpRy){
          this.theta = (180 + degrees(asin(abs(this.tmpRy)/this.v)));
        } else {
          this.theta = (360 - degrees(asin(abs(this.tmpRy)/this.v)));
        }
      }
      this.rx = (this.v * cos(radians(this.theta)));
      this.ry = (this.v * sin(radians(this.theta)));
    }
    this.x += this.rx;
    this.y += this.ry;
  }

  public void draw(){
    noStroke();
    fill(this.r, this.g, this.b);
    ellipse(this.x, this.y, this.d, this.d);
  }

  private float getSpeedRate(){
    return random(2, 5);
  }
}
