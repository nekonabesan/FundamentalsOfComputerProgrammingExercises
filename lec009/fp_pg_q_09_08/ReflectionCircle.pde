class ReflectionCircle extends MoveCircle {
  ReflectionCircle(float px, float py, float pvx, float pvy, float red, float green, float blue, float pw, float ph, float pd){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd);
  }

  public void setRgb(float red, float green, float blue){
    super.setRgb(red, green, blue);
  }

  public void move(){
      super.move();
  }

  public void draw(){
    super.draw();
  }
}
