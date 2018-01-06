class HUD {
  PFont font;
  float value, max, x, y, w, h;
  color  bar;
  private int lives = 3; 
  int bateries =0;
  int score=0;
  HUD() {
    value = 50;
    max = 100;
    x = 60;
    y = 50;
    h = 25;
    bar = color(244, 235, 66, 90);
  }
  void display() {
    stroke(0);
    resetMatrix();
    rectMode(CORNER);
    fill(bar);
    rect(x, y, darkning.smoothedDiameter/5-7, h);
    font=createFont("Arial", 16, true);
    textFont(font, 16);
    fill(255);
    textAlign(LEFT);

    text("Lives: " + lives, 60, 100);
    text("Score: " + score, 60, 120);
    assetManager.Cursordisplay();
  }
  public int lives() {
    return lives;
  }
  public void setLives (int lives) {
    this.lives =lives;
  }
  public int getScore() {
    return score;
  }
  public void setScore (int score) {
    this.score =score;
  }
  void update() {
    score++;
    if (hud.lives() == 0) {
      setState(STATE_END);
    }
  }
}