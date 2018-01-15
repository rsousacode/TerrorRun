class HUD {
  PFont newFont;
  int value, max, x, y, w, h;
  color  bar, backgroundbar;
  private int lanterns = 4; 
  int bateries =0;
  int bullets = 1022;
  int score=0;
  final int marginLantern = width/50;
  PImage hudlantern;
PImage hudbullet;

HUD() {
    value = 50;
    max = 100;
    x = 60;
    y = height/12;
    h = 25;
    bar = color(255, 255, 0, 100);
    backgroundbar=color(255, 255, 0, 50);
    hudlantern=loadImage("data/images/hud-flash.png");
    newFont= createFont("data/Lycanthrope.ttf", 14, true);
    assetManager.Cursordisplay();
  }
  void display() {
    stroke(0);
    resetMatrix();
    rectMode(CORNER);
    fill(backgroundbar);

   // rect(x, y-h/2, 400, h);
    fill(bar);

    rect(x, y-h/2, darkning.smoothedDiameter/8, h);
    textFont(newFont, 16);
    fill(255);
    textAlign(LEFT);

    if (lanterns==1) // actually it's 0 lanterns
    {
    }

    if (lanterns==2) // actually it's 1 lanterns
    {
      image(hudlantern, width-marginLantern-hudlantern.height, y, 32, 32);
    }
    if (lanterns==3) // actually it's 2 lanterns
    {
      image(hudlantern, width-marginLantern-hudlantern.height, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*2, y, 32, 32);
    }
    if (lanterns==4) // actually it's 3 lanterns
    {
      image(hudlantern, width-marginLantern-hudlantern.height, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*2, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*3, y, 32, 32);
    }

    if (lanterns==5) // actually it's 4 lanterns
    {
      image(hudlantern, width-marginLantern-hudlantern.height, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*2, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*3, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*4, y, 32, 32);
    }

    if (lanterns==6) // actually it's 5 lanterns
    {
      image(hudlantern, width-marginLantern-hudlantern.height, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*2, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*3, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*4, y, 32, 32);
      image(hudlantern, width-marginLantern-hudlantern.height*5, y, 32, 32);
    }

    if (darkning.diameter < 700 && hud.lanterns!=1) {
      textSize(32);
      textAlign(CENTER);
      text("Press 'K' to equip a new lantern", width/2, height-height/15);
    }


    textAlign(LEFT);
    textSize(16);

    text("Score: " + score, 60, y+h*1.5);
    image(assetManager.bullethud(), 80,height/5);
    textAlign(LEFT);
    textSize(30);
    text(+ bullets, 80, height/4);
    
  }

int bullets() {
  return bullets;
  
}

void setBullets(int bullets) {
  this.bullets = bullets;
  
}

  public int lanterns() {
    return lanterns;
  }
  public void setLanterns (int lanterns) {
    this.lanterns =lanterns;
  }
  public int getScore() {
    return score;
  }
  public void setScore (int score) {
    this.score =score;
  }
  void update() {
    score++;
    if (hud.lanterns() < 0) {
      setState(STATE_END);
    }
  }
}