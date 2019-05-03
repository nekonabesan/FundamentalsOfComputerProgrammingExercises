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
