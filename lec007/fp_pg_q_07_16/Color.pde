class Color {
  private float h = 0;
  private float s = 0;
  private float b = 0;
  private float wid = 0;
  private float hit = 0;
  private boolean flg = true;
  private float cnt = 0;
  private float max = 0;

  public void setH(float h){
    this.h = h;
  }
  public float getH(){
    return this.h;
  }
  public void setS(float s){
    this.s = s;
  }
  public float getS(){
    return this.s;
  }
  public void setB(float b){
    this.b = b;
  }
  public float getB(){
    return this.b;
  }
  public void setWid(float wid){
    this.wid = wid;
  }
  public float getWid(){
    return this.wid;
  }
  public void setHit(float hit){
    this.hit = hit;
  }
  public float getHit(){
    return this.hit;
  }
  public void setFlg(boolean flg){
    this.flg = flg;
  }
  public boolean getFlg(){
    return this.flg;
  }
  public void setMax(float max){
    this.max = max;
  }
  public float getMax(){
    return this.max;
  }
  public void setCnt(float cnt){
    this.cnt = cnt;
  }
  public float getCnt(){
    return this.cnt;
  }

  Color(float h, float s, float b, float wid, float hit, float cnt, float max){
    this.h = h;
    this.s = s;
    this.b = b;
    this.wid = wid;
    this.hit = hit;
    this.cnt = cnt;
    this.max = max;
  }
}
