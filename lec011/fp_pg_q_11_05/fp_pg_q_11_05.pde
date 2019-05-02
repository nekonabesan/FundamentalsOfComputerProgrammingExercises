// 問題 11.5 ボールとブロックの衝突判定を行いなさい．
private Block[] blk = new Block[100];
private Ball ball = null;

public void setup(){
  size(300, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  translate(width/2, height/2);
  background(255, 255, 255);
  float x = 0 - width/2;
  float y = 0 - height/2;
  Block b = null;
  for(int i = 0; i < 50; i++){
    b = new Block(x, y, 0, 255, 0, width/10, 20);
    blk[int(i)] = b;
    blk[int(i)].draw();
    x += width/10;
    if(width/2 < x + width/10){
      println(y);
      x = 0 - width/2;
      y += 20;
    }
  }

}

public void draw(){

}
