class Star extends ReflectionStar {
  Star(float px, float py, float pvx, float pvy,
    float red, float green, float blue, float pw, float ph,
    float pd, float pCircumscribedCircle, float pInscribedCircle,
    int pp, float protatete, float prate){
    super(px, py, pvx, pvy, red, green, blue, pw, ph, pd,
      pCircumscribedCircle, pInscribedCircle, pp, protatete, prate);
  }

  public void drawStar() {
    float cnt = getP() * 2;
    float radius = 0;
    float rotate = getRotate();
    float x = getX();
    float y = getY();
    // http://www.d-improvement.jp/learning/processing/2011-a/08.html
    pushMatrix();
      translate(x, y);
    rotate(rotate);
    beginShape();
    for (int i = 1; i <= cnt; i++) {
      if (i % 2 == 0) {
        radius = getInscribedCircle();
      } else {
        radius = getCircumscribedCircle();
      }
      vertex(radius * cos(radians(360 * i/cnt)), radius * sin(radians(360 * i/cnt)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  public void draw(){
    noStroke();
    fill(getR(), getG(), getB());
    drawStar();
  }

  public void rotation(float protate){
    setRotate(protate);
  }
}
