// 問題 11.5 ボールとブロックの衝突判定を行いなさい．
private Block[] blk = new Block[50];
private MoveCircle mc = null;
private float[] hit = new float[2];
float px = random(-50, 50);
float py = random(-50, 50);
float pvx = random(-2, 2);
float pvy = random(-2, 2);
float pd = random(10, 20);

public void setup(){
  size(300, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  translate(width/2, height/2);
  background(255, 255, 255);
  float x = 0 - width/2;
  float y = 0 - height/2;
  Block b = null;
  for(float i = 0; i < this.blk.length; i++){
    b = new Block(x, y, 0, 255, 0, width/10, 20);
    this.blk[int(i)] = b;
    this.blk[int(i)].draw();
    x += width/10;
    if(width/2 < x + width/10){
      x = 0 - width/2;
      y += 20;
    }
  }
  this.mc = new MoveCircle(px, py, pvx, pvy, 0, 0, 255, width, height, pd);
  this.mc.draw();
}

public void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  for(float i = 0; i < this.blk.length; i++){
    if(this.blk[int(i)].getVisible()){
      this.blk[int(i)].draw();
    }
  }
  // 衝突判定
  for(float i = 0; i < this.blk.length; i++){
    if(this.blk[int(i)].getVisible()){
      this.hit = this.blk[int(i)].hit(this.mc.getX(), this.mc.getY(), this.mc.getRx(), this.mc.getRy());
      if(hit[0] != 99999){
        this.mc.setRx(hit[int(0)]);
        this.mc.setRy(hit[int(1)]);
      }
    }
  }
  this.mc.draw();
  this.mc.move();
}

class Block {
  private float x = 0;
  private float y = 0;
  private float r = 0;
  private float g = 0;
  private float b = 0;
  private float bWidth = 0;
  private float bHeight = 0;
  private boolean visible = true;

  public float getX(){
      return this.x;
  }
  public float getY(){
      return this.y;
  }
  public void setR(float red){
    this.r = red;
  }
  public float getR(){
    return this.r;
  }
  public void setG(float green){
    this.g = green;
  }
  public float getG(){
    return this.g;
  }
  public void setB(float blue){
    this.b = blue;
  }
  public float getB(){
    return this.b;
  }
  public float getBwidth(){
    return this.bWidth;
  }
  public float getBheight(){
    return this.bHeight;
  }
  public boolean getVisible(){
    return this.visible;
  }


  Block(float x, float y, float r, float g, float b, float bWidth, float bHeight){
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.setup();
  }

  private void setup(){

  }

  public void draw(){
    stroke(255, 255, 255);
    fill(this.r, this.g, this.b);
    pushMatrix();
    rotate(0);
    beginShape();
    vertex(this.x, this.y);
    vertex(this.x + this.bWidth, this.y);
    vertex(this.x + this.bWidth, this.y + this.bHeight);
    vertex(this.x, this.y + this.bHeight);
    endShape(CLOSE);
    popMatrix();
  }

  public float[] hit(float bx, float by, float tmpRx, float tmpRy){
    float[] array = new float[2];
    float theta = 0;
    float v = v = (sqrt(sq(tmpRx) + sq(tmpRy)));
    boolean flg = false;
    /*if(this.x <= bx && bx <= this.x + this.bWidth
      && y + this.bHeight / 2 <= by
      && by <= (this.bHeight/this.bWidth) * x + y && by <= -(this.bHeight/this.bWidth) * x + y) {
      if(tmpRx < 0 && 0 < tmpRy){
        theta = (180 + degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (360 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    } else if (this.x <= bx && bx <= (this.x + this.bWidth)
      && by <= (y + this.bHeight)
      && (this.bHeight/this.bWidth) * x + y <= by  && -(this.bHeight/this.bWidth) * x + y <= by) {
      if(tmpRx < 0 && tmpRy < 0){
        theta = (180 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    } else if(this.y <= by && by < this.y + this.bHeight
      && -(this.bHeight/this.bWidth) * x + y <= bx && bx < (this.bHeight/this.bWidth) * x + y) {
      if(0 < tmpRx && tmpRy < 0){
        theta = (180 + degrees(acos(abs(tmpRx)/v)));
        flg = true;
      } else {
        theta = (180 - degrees(acos(abs(tmpRx)/v)));
        flg = true;
      }
    } else if(this.y <= by && by < this.y + this.bHeight
      && bx < -(this.bHeight/this.bWidth) * x + y  && (this.bHeight/this.bWidth) * x + y < bx) {
      if(tmpRx < 0 && tmpRy < 0){
        theta = (360 - degrees(acos(abs(tmpRx)/v)));
        flg = true;
      } else {
        theta = degrees(acos(abs(tmpRx)/v));
        flg = true;
      }
    }*/
    if(this.x <= bx && bx <= this.x + this.bWidth
      && this.y <= by && by <= this.y + this.bHeight
      && this.visible == true){
      if(tmpRx < 0 && tmpRy < 0){
        theta = (180 - degrees(asin(abs(tmpRy)/v)));
        flg = true;
      } else {
        theta = (degrees(asin(abs(tmpRy)/v)));
        flg = true;
      }
    }
    if (flg) {
      array[0] = (v * cos(radians(theta)));
      array[1] = (v * sin(radians(theta)));
      this.visible = false;
    } else {
      array[0] = 99999;
      array[1] = 99999;
    }
    return array;
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
