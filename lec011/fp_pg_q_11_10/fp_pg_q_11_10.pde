// 問題 11.10 ブロック崩しを行ったユーザ名，点数，日時をファイルに追記せよ．
import ddf.minim.*;
import processing.awt.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

private Button bt = null;
private Container ct = new Container();
private TextField input = new TextField("AA");
private Block[] blk = new Block[50];
private MoveCircle mc = null;
private float[] hit = new float[2];
private MoveRectangle mr = null;
private Minim minim;
private AudioSnippet player;
private float px = random(-50, 50);
private float py = random(-50, 50);
private float pvx = random(-2, 2);
private float pvy = random(-2, 2);
private float pd = random(10, 20);
private float btm = 0;
private float prw = 40;
private float prh = 10;
private String name;
private int point = 0;
private float btX = 0;
private float btY = 0;
private float btW = 100;
private float btH = 20;
private boolean inputFlg = false;

public void setup(){
  size(300, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  frameRate(30);
  translate(width/2, height/2);
  background(255, 255, 255);
  textFont(createFont("Harrington", 24));
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
  this.btm = height/2 - 30;
  this.mr = new MoveRectangle(0, btm, 1, 0, 0, 0, 255, width, height, prw, prh);
  minim = new Minim(this);
  player = minim.loadSnippet("cat-cry1.mp3");
  this.initializedText();
  this.write();
  this.bt = new Button("save", btX, btY, btW, btH);
  this.input.setBounds(0, -50, 200, 20);
}

public void draw(){
  background(255, 255, 255);
  translate(width/2, height/2);
  if(inputFlg){
    //
    if(mc == null){
      createMc();
    }
    if(this.btm - 2 -this.pd/2 <= this.mc.getY() && this.mc.getY() <= this.prh + this.btm) {
      if(this.mr.getX() - this.prw/2 <= this.mc.getX() && this.mc.getX() <= this.mr.getX() + this.prw/2){
        this.reflection();
      }
    }
    //
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
          player.rewind();
          player.play();
          this.mc.setRx(hit[int(0)]);
          this.mc.setRy(hit[int(1)]);
          this.point+=(abs(mc.getRx()) + abs(mc.getRy()));
          this.write();
        }
      }
    }
    if(height/2 <= this.mc.getY()) {
      this.mc.setX(width);
      this.mc.setY(height);
      this.mc.setRgb(255, 255, 255);
      createMc();
    }
    this.initializedText();
    this.mc.draw();
    this.mc.move();
    this.mr.draw();
    if(mousePressed){
      moveMouse(mouseX, 0);
    }
  } else {
    this.bt.draw();
    if(mousePressed){
      if(btX - btW/2 <= mouseX - width/2  && mouseX - width/2 <= btX + btW/2
        && btY - btH/2 <= mouseY - height/2 && mouseY - height/2 <=btY + btH/2){
        this.name = this.input.getText();
        inputFlg = true;
      }
    }
  }
}

public void reflection(){
  float rcX = this.mc.getX();
  float rcY = this.mc.getY();
  float rcRx = this.mc.getRx();
  float rcRy = this.mc.getRy();
  float tmpRx = rcRx;
  float tmpRy = rcRy;
  float theta = 0;
  float v = (sqrt(sq(rcRx) + sq(rcRy)));
  //
  if(tmpRx < 0 && 0 < tmpRy){
    theta = (180 + degrees(asin(abs(tmpRy)/v)));
  } else {
    theta = (360 - degrees(asin(abs(tmpRy)/v)));
  }
  //
  rcRx = (v * cos(radians(theta)));
  rcRy = (v * sin(radians(theta)));
  rcX += rcRx;
  rcY += rcRy;
  this.mc.setX(rcX);
  this.mc.setY(rcY);
  this.mc.setRx(rcRx);
  this.mc.setRy(rcRy);
}

private void createMc(){
  float x = random(-width/2, width/2);
  float y = random(-100, 100);
  float vx = random(-2, 2);
  float vy = random(0, 3);
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float d = random(10, 20);
  this.mc = new MoveCircle(x, y, vx, vy, r, g, b, width, height, d);
  this.mc.setMaxY((height/2) + d);
}

public void moveMouse(float mX, float mY){
  mX-=(width/2);
  float mrx = this.mr.getX();
  float maxX = this.mr.getMaxX();
  float minX = this.mr.getMinX();
  float rx = this.mr.getRx();
  if(mrx < mX){
    if(mrx <= maxX && mrx < maxX) {
      mrx+=rx;
      mr.setX(mrx);
    }
  } else if ((mX + rx) < mrx && minX < mrx) {
    if(minX <= mrx){
      mrx-=rx;
      this.mr.setX(mrx);
    }
  }
}

private void initializedText(){
  fill(0,0,102);
  text(this.point, -120, -120);
}

private void write(){
  PrintWriter output = createWriter("scores.txt");
  //String s = this.bt.getTextInput() + str(year()) + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + this.point;
  String s = this.name + "\t" + str(this.point);
  output.println(s);
  output.flush();
  output.close();
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

class MoveRectangle {
  private float x = 0;
  private float y = 0;
  private float vx = 0;
  private float vy = 0;
  private float rx = 0;
  private float ry = 0;
  private float w = 0;
  private float h = 0;
  private float rw = 20;
  private float rh = 20;
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
  public float getMinX(){
    return this.minX;
  }
  public float getMaxX(){
    return this.maxX;
  }

  MoveRectangle(float x, float y, float vx, float vy, float r, float g, float b, float w, float h, float rw, float rh){
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.r = r;
    this.g = g;
    this.b = b;
    this.w = w;
    this.h = h;
    this.rw = rw;
    this.rh = rh;
    this.minX = -(this.w/2) + this.rw/2;
    this.maxX = (this.w/2) - this.rw/2;
    this.minY = -(this.h/2) + this.rh/2;
    this.maxY = (this.h/2) - this.rh/2;
    this.rx = (this.vx * this.getSpeedRate());
    this.ry = (this.vy * this.getSpeedRate());
    rectMode(CENTER);
  }

  public void move(){
    if(this.x <= this.minX || this.maxX <= this.x || this.y <= this.minY || this.maxY <= this.y){
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
          this.theta = (360 - degrees(acos(abs(this.tmpRx)/v)));
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
          this.theta = (180 + degrees(asin(abs(this.tmpRy)/v)));
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
    rect(this.x, this.y, this.rw, this.rh);
  }

  private float getSpeedRate(){
    return random(4, 10);
  }
}

import java.awt.Rectangle;
import java.awt.TextField;

class Button extends Rectangle {
  private float x;
  private float y;
  private float w = 100;
  private float h = 20;
  private String str;
  private String textInput;
  private boolean status;

  public boolean getStatus(){
    return this.status;
  }
  public String getTextInput(){
    return this.textInput;
  }

  Button(String s, float x, float y, float w, float h){
    this.str = new String(s);
    width = (int)(textWidth(str)) + 8;
    height = (int)(textAscent()) + 8;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.status = false;
    this.setRect(this.x, this.y, this.w, this.h);
    this.setup();
  }

  private void setup(){
  }

  public void clicked(String s){
    this.status = true;
    this.textInput = new String(s);
  }

  public void draw(){
    stroke(0);
    fill(255, 255, 255);
    rect(this.x, this.y, this.w, this.h);
    fill(0);
    textAlign(CENTER);
    text(this.str, this.x, this.y + this.h / 2);
    noStroke();
  }
}
