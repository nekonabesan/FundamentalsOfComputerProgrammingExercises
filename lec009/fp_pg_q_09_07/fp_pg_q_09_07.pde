// 問題 9.7 等速直線運動および回転をしながら壁で反射する 100 個の★を描画するアニメーションをクラスを用いて作成せよ．
// ただし，★どうしの衝突は考慮しなくてもよい．★の大きさ，移動速度，回転速度，初期位置，色は全てランダムに与えよ．
private Star[] rs = new Star[100];
private float[] rt = new float[100];
private float x = 0;
private float y = 0;
private float vx = 0;
private float vy = 0;
private float r = 0;
private float g = 0;
private float b = 0;
private float d = 10;
private float j = 0;
private float cc = 0;
private float ic = 0;
private float rotate = 0;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  ellipseMode(CENTER);
  frameRate(30);

  for(int i = 0; i < 100; i++){
    x = random(-100, 100);
    y = random(-100, 100);
    vx = random(0.5, 2);
    vy = random(0.5, 2);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    d = random(10, 50);
    cc = random(10, 30);
    ic = cc * 1/2 * 0.75;
    rotate = radians(random(0.05, 0.1));
    /*
    Star(float px, float py, float pvx, float pvy,
      float red, float green, float blue, float pw, float ph,
      float pd, float pCircumscribedCircle, float pInscribedCircle,
      int pp, float protatete, float prate){
    */
    rs[i] = new Star(x, y, vx, vy, r, g, b, width, height, d, cc, ic, 5, rotate, 0.75);
    rt[i] = random(1, 10);
  }
}

void draw(){
  background(255, 255, 255);
  //translate(width/2, height/2);
  for(int i = 0; i < 100; i++){
    j = random(0.1, 1);
    rs[i].draw();
    rs[i].move();
    rs[i].rotation(rs[i].getRotate() + rt[i] + PI/2);
  }
  /*j+=0.05;
  if(j == 360){
    j = 0;
  }*/
}
