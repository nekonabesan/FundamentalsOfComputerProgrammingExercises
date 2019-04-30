class Pentagon extends Ball {
  Pentagon(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle,
    int pp, float protate, float prate){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd,
      pCircumscribedCircle, pp, protate, prate);
  }

  public void draw(){
    //noFill();
    //stroke(getR(), getG(), getB());
    noStroke();
    fill(getR(), getG(), getB());
    super.setRotate(radians(-90));
    super.setP(5);
    super.draw();
  }

  public void move(){
    super.move();
  }
}
