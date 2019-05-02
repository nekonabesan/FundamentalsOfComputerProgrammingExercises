// 問題 11.5 ボールとブロックの衝突判定を行いなさい．
private Block[] blk = new Block[50];
private Ball ball = null;
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
  /*
  Ball(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protate, float prate){
  */
  this.ball = new Ball(px, py, pvx, pvy, 0, 0, 255, width, height, pd, 0, 0, 0, 0);
  this.ball.draw();
  //println(this.ball.getX());
}

public void draw(){
  translate(width/2, height/2);
  println(this.ball.getY());
  this.ball.draw();
  // 衝突判定
  for(float i = 0; i < this.blk.length; i++){
    //println(this.blk[int(i)].getX());
    this.hit = this.blk[int(i)].hit(this.ball.getX(), this.ball.getY(), this.ball.getRx(), this.ball.getRy());
    if(hit[0] != 99999){
      this.ball.setRx(hit[int(0)]);
      this.ball.setRy(hit[int(1)]);
    }
  }
  this.ball.move();
}
