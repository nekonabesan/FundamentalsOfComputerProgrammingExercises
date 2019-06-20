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
