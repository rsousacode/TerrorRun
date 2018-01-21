class ScoreManager 
{
  private PFont newFont;
  float value, max;
  private float leftMargin, upperMargin, h, barHeight;
  color  bar, backgroundbar;
  private int lanterns = 4; 
  private int bullets = 10;
  private int score=0;
  private final int marginLantern = width/50;
  private PImage image;

  ScoreManager() 
  {
    value = 50;
    barHeight= height/30;
    max = 100;
    leftMargin = width/22;
    upperMargin = height/12;
    h = height/24;
    bar = color(255, 255, 0, 99);
    backgroundbar=color(255, 255, 0, 50);
    image=assetManager.hudLantern();
    newFont= assetManager.font();
  }
  void display() 
  {

    showBar();
    textFont(newFont);
    showLanterns();
    equipLanternTxt();
    showScore();
    imageMode(CORNER);
    image(assetManager.bullethud(), leftMargin, height/9);
    textAlign(LEFT);
    textSize(30);
    if (height < 1000)
      fill(0, 255, 0);
    text(+ bullets, leftMargin +assetManager.bullethud().width+width/100, height/7.5);
    developerMode();
    showPause();
  }

  void showBar() {
    stroke(0);
    resetMatrix();
    rectMode(CORNER);
    fill(bar);
    if (!turnOffDarkning)
      rect(leftMargin, upperMargin-h/3.4, darkning.smoothedDiameter/6, barHeight/1.89);
  }

  void showLanterns() {
    if (!turnOffDarkning) 
    {
      if (lanterns==2) // actually it's 1 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
      }
      if (lanterns==3) // actually it's 2 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*2, upperMargin, 32, 32);
      }
      if (lanterns==4) // actually it's 3 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*2, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*3, upperMargin, 32, 32);
      }

      if (lanterns==5) // actually it's 4 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*2, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*3, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*4, upperMargin, 32, 32);
      }

      if (lanterns==6) // actually it's 5 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*2, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*3, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*4, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*5, upperMargin, 32, 32);
      }

      if (lanterns==7) // actually it's 6 lanterns
      {
        image(image, width-marginLantern-image.height, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*2, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*3, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*4, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*5, upperMargin, 32, 32);
        image(image, width-marginLantern-image.height*6, upperMargin, 32, 32);
      }
    }
  }

  void equipLanternTxt() {
    if (darkning.diameter < 700 && scoreManager.lanterns!=1) 
    {
      textSize(32);
      textAlign(CENTER);
      if (!devmode && controlsEnabled)
        text("Press 'Q' to equip a new lantern", width/2, height-height/15);
    }
  }

  void showScore() {
    textAlign(LEFT);
    textSize(40);
    fill(bar);
    text("Score: " + score, leftMargin, height/1.05);
  }

  void developerMode() {
    if (devmode) 
    {
      textAlign(LEFT);
      textSize(20);
      fill(255);
      text("Levels passed: " +handler.playerIsAt, height/10, height - height/25);
      text(" " +handler.casas[0] +handler.casas[1] +handler.casas[2] +handler.casas[3] +handler.casas[4] +handler.casas[5] +handler.casas[6]+handler.casas[7]+handler.casas[8]+handler.casas[9] 
        +handler.casas[10]
        +handler.casas[11]
        +handler.casas[12]
        +handler.casas[13]
        +handler.casas[14]
        +handler.casas[15]
        +handler.casas[16]
        +handler.casas[17]
        +handler.casas[18]
        +handler.casas[19]
        +handler.casas[20]
        +handler.casas[21]
        +handler.casas[22]
        +handler.casas[23]
        +handler.casas[24]
        +handler.casas[25]
        +handler.casas[26]
        +handler.casas[27]
        +handler.casas[28]
        +handler.casas[29]
        +handler.casas[30]
        +handler.casas[31]
        +handler.casas[32]
        , height/10, height - height/10);
      fill(0, 255, 0);
      text("Dev mode", height/10, height -height/6);
      textAlign(RIGHT);
      textSize(18);
      text("Press 'L' to turn Off Lights", width-width/50, height-height/12);
      text("Press 'R' to respawn", width- width/50, height-height/4);
      text("Press 'X' to increase X velocity", width- width/50, height-height/8);
      text("Press 'Y' to increase Y velocity", width- width/50, height-height/6);
      text("Press 'M' to reset X and Y velocities", width- width/50, height-height/5);
    }
  }

  void showPause() {
    if (gamePaused) {
      textSize(66);
      textAlign(CENTER);
      text("Paused", width/2, height/2);
    }
  }

  int bullets() 
  {
    return bullets;
  }

  void setBullets(int bullets) 
  {
    this.bullets = bullets;
  }

  public int lanterns() 
  {
    return lanterns;
  }

  public void setLanterns (int lanterns) 
  {
    this.lanterns =lanterns;
  }

  public int score() 
  {
    return score;
  }

  public void setScore (int score) 
  {
    this.score =score;
  }

  void killHorrorGirl() {
    scoreManager.setScore(scoreManager.score()+1909);
    assetManager.soundVannish();
  }

  void killGhosts() {

    scoreManager.setScore(scoreManager.score()+998);
    assetManager.soundVannish();
  }

  void useLantern() 
  {  
    if ( scoreManager.lanterns!=1) 
    {
      setLanterns(scoreManager.lanterns()-1);
      darkning.diameter = 2 * height;
      assetManager.soundEquipLantern();
    }
  }

  void catchLowBattery() {
    assetManager.soundCatchBattery();
    scoreManager.setScore(scoreManager.score()+220);
    darkning.diameter+=250;
  }

  void catchHighBattery() {
    assetManager.soundCatchBattery();
    scoreManager.setScore(scoreManager.score()+110);
    darkning.diameter+=400;
  }

  void fireBullets() 
  {
    if (scoreManager.bullets() > 0) {
      scoreManager.setBullets(scoreManager.bullets()-1);
      assetManager.soundGhostBullet();
      canon.fire();
    }
  }
}