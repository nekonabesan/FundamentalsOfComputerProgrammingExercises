// 問題 11.7 ボールとブロックが衝突した時に効果音が鳴るようにせよ．
import ddf.minim.*;
private Block[] blk = new Block[50];
private MoveCircle mc = null;
private float[] hit = new float[2];
private Minim minim;
private AudioSnippet player;
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
  minim = new Minim(this);
  player = minim.loadSnippet("cat-cry1.mp3");
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
        player.rewind();
        player.play();
        this.mc.setRx(hit[int(0)]);
        this.mc.setRy(hit[int(1)]);
      }
    }
  }
  this.mc.draw();
  this.mc.move();
}
