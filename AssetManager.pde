class AssetManager {
  private int numFrames = 38;  // The number of frames in the animation
  private boolean removeCursor = false;

  private long currentFrame;
  private int counter;
  private PFont font;
  private PImage cursor;
  private PImage backgroundMenu;
  private PImage title;
  private PImage helpButton;
  private PImage SkullandCupEnd;
  private PImage return2menuButton;
  private PImage exitSysButton;
  private PImage playButton;
  private PImage creditsButton;
  private PImage helpScript;
  private PImage creditsScript;
  private PImage transcursor;
  private PImage skeleton;
  private PImage enemy;
  private PImage lowBatery;
  private PImage highBatery;
  private PImage flashLight;
  private PImage lanternHUD;
  private PImage scaryGirl;
  private PImage bullet;
  private PImage bullethudImage;
  private PImage packfiveImage;
  private PImage soundMenuButton;
  private PImage soundMenuButtonOff;
  private PImage[] images = new PImage[numFrames];

  AssetManager() 
  {    
    font = createFont("data/Lycanthrope.ttf", 14, true);
    cursor= loadImage("data/images/cursor.png");
    backgroundMenu =   loadImage("data/images/menu/background4.jpg");
    title = loadImage("data/images/menu/title.png");
    helpButton = loadImage("data/images/menu/help21.png");
    SkullandCupEnd = loadImage("data/images/menu/you_lost.png");
    return2menuButton = loadImage("data/images/menu/return.png");
    playButton=loadImage("data/images/menu/play2.png");
    creditsButton = loadImage("data/images/menu/creditsButton.png");
    exitSysButton=loadImage("data/images/menu/exit.png");
    helpScript = loadImage("data/images/menu/help.png");
    creditsScript = loadImage("data/images/menu/credits.png");
    transcursor= loadImage("data/images/transcursor.png");
    skeleton =    loadImage("data/images/skeleton.png");
    enemy = loadImage("data/images/ghost.png");
    lowBatery =   loadImage("data/images/battery.png");
    highBatery= loadImage("data/images/battery2.png");
    flashLight= loadImage("data/images/flashlight.png");
    lanternHUD = loadImage("data/images/hud-flash.png");
    scaryGirl= loadImage("data/images/scarygirl.png");
    bullet = loadImage("data/images/bone.png");
    bullethudImage = loadImage("data/images/bullhd.png");
    packfiveImage = loadImage("data/images/packfive.png");
    soundMenuButton = loadImage("data/images/menu/sound.png");
    soundMenuButtonOff = loadImage("data/images/menu/soundOff.png");

  }



  PFont font() 
  {
    return font;
  }

  PImage cursorImage() 
  {
    return cursor;
  }

  PImage backgroundMenu() 
  {
    return backgroundMenu.copy();
  }

  PImage title() 
  {
    return title;
  }

  PImage helpButton() 
  {
    return helpButton;
  }

  PImage SkullandCupEnd() 
  {

    return SkullandCupEnd;
  }

  PImage return2menuButton() 
  {
    return return2menuButton;
  }

  PImage exitSysButton()
  {
    return exitSysButton;
  }


  PImage playButton() 
  {
    return playButton;
  }

  PImage creditsButton() 
  {
    return creditsButton;
  }


  PImage helpscript() 
  {
    return helpScript;
  }

  PImage creditsScript() 
  {

    return creditsScript;
  }

  PImage transcursor() 
  {
    return transcursor;
  }

  PImage skeleton() 
  {
    return skeleton;
  }

  PImage enemy() 
  {
    return enemy;
  }

  PImage lowBattery() 
  {
    return lowBatery;
  }

  PImage highBattery() 
  {
    return highBatery;
  }

  PImage flashLight() 
  {
    return flashLight;
  }

  PImage lanternHUD() 
  {
    return lanternHUD;
  }

  PImage scaryGirl() 
  {
    return scaryGirl;
  }

  PImage ghostBullet() 
  {
    return bullet;
  }

  PImage bullethud() 
  {
    return bullethudImage;
  }

  PImage packfiveImage() 
  {
    return packfiveImage;
  }

  PImage soundButton() 
  {

    return soundMenuButton;
  }

  PImage soundMenuButtonOff() 
  {
    return soundMenuButtonOff;
  }


  void animatePlayerSides() {
    if ( !player.coliding|| !controller.right && !controller.left && !controller.up || controller.left && controller.up && !controller.right &&(jumpActivated) || !controller.left && controller.up && controller.right &&(jumpActivated) ||  controller.left && controller.up && controller.right &&(jumpActivated) || controller.left && controller.right && !controller.up || controller.up && !controller.left && !controller.right &&(jumpActivated))
      image(assetManager.images[3], 0, 0);
    else   
    image(assetManager.images[counter], 0, 0);
    if (System.currentTimeMillis() - assetManager.currentFrame >= 5) 
    {

      if (controlsEnabled && !gamePaused)
        counter ++;
      if (counter > 37)
        counter=0;
    } else image(assetManager.images[counter], 0, 0);
  }





  
  void WalkingAnimationSIdes() 
  {
    for (int i = 0; i < numFrames; i++) 
    {
      images[i] = loadImage("data/images/animation/pl " + (i + 1) + ".png");
    }
  }


  void Cursordisplay() 
  {
    if (state==STATE_GAME) 
    {
      removeCursor =true;
    } else 
    {
      removeCursor =false;
    }

    if (removeCursor)
      cursor((assetManager.transcursor.copy()));
    else 
    {
      cursor((assetManager.cursor.copy()));
    }
  }


  }
