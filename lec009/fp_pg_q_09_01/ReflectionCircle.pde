// 問題 9.1 ボールが壁に反射しながら水平方向に等速直線運動するアニメーションをクラスを用いて作成せよ．
// ただし，フィールドとしてボールの色 c，直径 d，位置 x, y，水平方向の速度 vx を持ち，
// メソッドとしてはボールの移動を処理する move メソッド，ボールを描画する draw メソッドを用意せよ．
class ReflectionCircle extends MoveCircle {
  ReflectionCircle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float pd){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd);
  }
}
