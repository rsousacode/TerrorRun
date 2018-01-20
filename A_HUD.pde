class HUD {
  PFont newFont;
  float value, max, leftMargin, upperMargin, h, barHeight;
  color  bar, backgroundbar;
  private int lanterns = 4; 
  int bateries =0;
  int bullets = 10;
  int score=0;
  final int marginLantern = width/50;
  PImage hudlantern;
  PImage hudbullet;

  HUD() {
    value = 50;
    barHeight= height/30;
    max = 100;
    leftMargin = width/22;
    upperMargin = height/12;
    h = height/24;
    bar = color(255, 255, 0, 100);
    backgroundbar=color(255, 255, 0, 50);
    hudlantern=loadImage("data/images/hud-flash.png");
    newFont= createFont("data/Lycanthrope.ttf", 14, true);
  }
  void display() {
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
    if (!turnOffDarkning) {
      if (lanterns==2) // actually it's 1 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
      }
      if (lanterns==3) // actually it's 2 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*2, upperMargin, 32, 32);
      }
      if (lanterns==4) // actually it's 3 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*2, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*3, upperMargin, 32, 32);
      }

      if (lanterns==5) // actually it's 4 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*2, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*3, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*4, upperMargin, 32, 32);
      }

      if (lanterns==6) // actually it's 5 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*2, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*3, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*4, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*5, upperMargin, 32, 32);
      }

      if (lanterns==7) // actually it's 6 lanterns
      {
        image(hudlantern, width-marginLantern-hudlantern.height, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*2, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*3, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*4, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*5, upperMargin, 32, 32);
        image(hudlantern, width-marginLantern-hudlantern.height*6, upperMargin, 32, 32);
      }
    }

    if (darkning.diameter < 700 && hud.lanterns!=1) 
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

    if (!controlsEnabled) {
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

  public int getScore() 
  {
    return score;
  }

  public void setScore (int score) 
  {
    this.score =score;
  }

  void update() 
  {
    if (!devmode && controlsEnabled)
      score++;
    if (hud.lanterns() < 0) {
      setState(STATE_END);
    }
  }
}