// 問題 9.5 ★が回転しながら 2 次元平面内で等速直線運動し壁で反射するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとして★の色 c，★の外接円の直径 d，位置 x, y，速度 vx, vy，回転速度 theta を持ち，
// メソッドとしては★の移動を処理する move メソッド，★を描画する draw メソッドを用意せよ．
private Star rs;
private float i = 0;

void setup(){
  size(400, 400);
  smooth();
  background(255, 255, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  frameRate(30);
  /*
  Star(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle, float pInscribedCircle,
    int pp, float protatete, float prate){
  */
  rs = new Star(0, 0, 1, 1, 0, 0, 128, width, height, 40, 40, 40/2*0.75, 5, PI/2, 0.75);
}

void draw() {
  background(255, 255, 255);
  //translate(width/2, height/2);
  rs.rotation(i + PI/2);
  rs.draw();
  rs.move();
  i+=0.05;
  if(i == 360){
    i = 0;
  }
}
