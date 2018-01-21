class ScoreManager 
{
  PFont newFont;
  float value, max, leftMargin, upperMargin, h, barHeight;
  color  bar, backgroundbar;
  private int lanterns = 4; 
  int bateries =0;
  int bullets = 10;
  private int score=0;
  final int marginLantern = width/50;
  PImage image;
  PImage hudbullet;

  ScoreManager() 
  {
    value = 50;
    barHeight= height/30;
    max = 100;
    leftMargin = width/22;
    upperMargin = height/12;
    h = height/24;
    bar = color(255, 255, 0, 100);
    backgroundbar=color(255, 255, 0, 50);
    image=assetManager.hudLantern();
    newFont= createFont("data/Lycanthrope.ttf", 14, true);
  }
  void display() 
  {
    stroke(0);
    resetMatrix();
    rectMode(CORNER);
    fill(backgroundbar);
    fill(bar);
    if (!turnOffDarkning)
      rect(leftMargin, upperMargin-h/2, darkning.smoothedDiameter/8, barHeight);
    textFont(newFont, 16);
    fill(255);
    textAlign(LEFT);
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

    if (darkning.diameter < 700 && scoreManager.lanterns!=1) 
    {
      textSize(32);
      textAlign(CENTER);
      if (!devmode)

        text("Press 'Q' to equip a new lantern", width/2, height-height/15);
    }
    textAlign(LEFT);
    textSize(16);
    text("Score: " + score, leftMargin, height/20);
    imageMode(CORNER);
    image(assetManager.bullethud(), leftMargin, height/5.33);
    textAlign(LEFT);
    textSize(30);
    if (height < 1000)
      fill(0, 255, 0);
    text(+ bullets, leftMargin, height/4);
    if (devmode) 
    {
      textAlign(LEFT);
      textSize(20);
      fill(255);
      text("Levels passed: " +handler.playerIsAt, height/10, height - height/25);
      text(" " +handler.homes[0] +handler.homes[1] +handler.homes[2] +handler.homes[3] +handler.homes[4] +handler.homes[5] +handler.homes[6]+handler.homes[7]+handler.homes[8]+handler.homes[9] 
        +handler.homes[10]
        +handler.homes[11]
        +handler.homes[12]
        +handler.homes[13]
        +handler.homes[14]
        +handler.homes[15]
        +handler.homes[16]
        +handler.homes[17]
        +handler.homes[18]
        +handler.homes[19]
        +handler.homes[20]
        +handler.homes[21]
        +handler.homes[22]
        +handler.homes[23]
        +handler.homes[24]
        +handler.homes[25]
        +handler.homes[26]
        +handler.homes[27]
        +handler.homes[28]
        +handler.homes[29]
        +handler.homes[30]
        +handler.homes[31]
        +handler.homes[32]
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

    if (paused) {
      textSize(32);
      textAlign(LEFT);
      text("Paused", leftMargin, height/7);
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

  void useLantern() 
  {  
    if ( scoreManager.lanterns!=1) 
    {
      setLanterns(scoreManager.lanterns()-1);
      darkning.diameter = 2 * height;
      assetManager.soundEquipLantern();
    }
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