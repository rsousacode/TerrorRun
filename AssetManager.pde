class AssetManager 
{
  private int numFrames = 38;  // The number of frames in the animation
  private long currentFrame;
  private int counter;
  private boolean removeCursor = false;
  private PImage cursorImage;
  private PImage backgroundMenu;
  private PImage title;
  private PImage helpButton;
  private PImage return2menu;
  private PImage exitSys;
  private PImage play;
  private PImage helpCurrent;
  private PImage transcursor;
  private PImage playerImage;
  private PImage enemyImage;
  private PImage lowBateryImage;
  private PImage highBateryImage;
  private PImage flashlightImage;
  private PImage hudlantern;
  private PImage scarygirlImage;
  private PImage ghostBullet;
  private PImage bullethudImage;
  private PImage packfiveImage;
  private PImage soundMenuButton;
  private PImage soundMenuButtonOff;
  private PImage[] images = new PImage[numFrames];


  AssetManager() 
  {
    cursorImage= loadImage("data/images/cursor.png");
    backgroundMenu =   loadImage("data/images/menu/background4.jpg");
    title = loadImage("data/images/menu/title.png");
    return2menu = loadImage("data/images/menu/return.png");
    helpButton = loadImage("data/images/menu/help21.png");
    helpCurrent = loadImage("data/images/menu/help.png");
    play=loadImage("data/images/menu/play2.png");
    exitSys=loadImage("data/images/menu/exit.png");
    soundMenuButton = loadImage("data/images/menu/sound.png");
    soundMenuButtonOff = loadImage("data/images/menu/soundOff.png");
    transcursor= loadImage("data/images/transcursor.png");
    playerImage =    loadImage("data/images/skeleton.png");
    enemyImage = loadImage("data/images/ghost.png");
    lowBateryImage =   loadImage("data/images/battery.png");
    highBateryImage= loadImage("data/images/battery2.png");
    flashlightImage= loadImage("data/images/flashlight.png");
    scarygirlImage= loadImage("data/images/scarygirl.png");
    ghostBullet = loadImage("data/images/bone.png");
    bullethudImage = loadImage("data/images/bullhd.png");
    hudlantern = loadImage("data/images/hud-flash.png");
    packfiveImage = loadImage("data/images/packfive.png");
    backgroundmusic=audio.loadFile("data/sounds/sample.mp3");
    catchBattery=audio.loadFile("data/sounds/pop.wav");
    scarygirlLaugh = audio.loadFile("data/sounds/scgl.wav");
    catchlantern = audio.loadFile("data/sounds/catchlantern.wav");
    vannish = audio.loadFile("data/sounds/vannish.wav");
    vannishgirl = audio.loadFile (  "data/sounds/vannishgirl.wav");
    backgroundmusic=audio.loadFile(  "data/sounds/sample.mp3");
    catchBattery=audio.loadFile(  "data/sounds/pop.wav");
    scarygirlLaugh = audio.loadFile(  "data/sounds/scgl.wav");
    catchlantern = audio.loadFile(  "data/sounds/catchlantern.wav");
    vannish = audio.loadFile(  "data/sounds/vannish.wav");
    dieghost = audio.loadFile(  "data/sounds/dieghost.wav");
    ghostbullet = audio.loadFile(  "data/sounds/ghostbullet.wav");
    malelaugh = audio.loadFile(  "data/sounds/malelaughsc.wav"); 
    lightson = audio.loadFile(  "data/sounds/lightson.wav"); 
    playMusic();
  }

  void playMusic() 
  {
    backgroundmusic.loop();
  }

  PImage hudLantern() 
  {
    return hudlantern;
  }

  PImage soundMenuButtonOff() 
  {
    return soundMenuButtonOff;
  }

  PImage backgroundMenu() 
  {
    return backgroundMenu.copy();
  }

  PImage title() 
  {
    return title;
  }

  PImage return2menu() 
  {
    return return2menu;
  }

  PImage help() {
    return helpButton;
  }

  PImage soundButton() 
  {

    return soundMenuButton;
  }

  PImage helpCurrent() 
  {
    return helpCurrent;
  }

  PImage exitSys()
  {
    return exitSys;
  }

  PImage play() 
  {
    return play;
  }

  PImage cursorImage() 
  {
    return cursorImage;
  }

  PImage transcursor() 
  {
    return transcursor;
  }

  PImage playerImage() 
  {
    return playerImage;
  }

  int playerHeight() 
  {
    return playerImage.width;
  }

  int playerWidth() 
  {
    return playerImage.height;
  }

  PImage enemyImage() 
  {
    return enemyImage;
  }

  PImage ghostBullet() 
  {
    return ghostBullet;
  }

  PImage lowBateryImage() 
  {
    return lowBateryImage;
  }

  PImage flashlightImage() 
  {
    return flashlightImage;
  }

  PImage highBateryImage() 
  {
    return highBateryImage;
  }

  PImage scarygirlImage() 
  {
    return scarygirlImage;
  }

  PImage packfiveImage() 
  {
    return packfiveImage;
  }

  PImage bullethud() 
  {
    return bullethudImage;
  }

  void soundEquipLantern() 
  {
    if (soundActivated) 
    {
      lightson.rewind();
      lightson.play();
    }
  }

  void soundCatchBattery() 
  {
    if (soundActivated) {
      catchBattery.rewind();
      catchBattery.play();
    }
  }

  void soundCatchLantern() 
  {
    if (soundActivated) {
      catchlantern.rewind();
      catchlantern.play();
    }
  }

  void soundVannish() 
  {
    if (soundActivated) 
    {
      vannish.rewind();
      vannish.play();
    }
  }

  void  soundMaleLaugh() 
  {
    if (soundActivated) 
    {
      malelaugh.rewind();
      malelaugh.play();
    }
  }

  void soundGirlaugh() 
  {

    if (soundActivated) 
    {
      scarygirlLaugh.rewind();
      scarygirlLaugh.play();
    }
  }

  void soundGhostBullet() 
  {
    if (soundActivated) 
    {
      ghostbullet.rewind();
      ghostbullet.play();
    }
  }


  void stopAudio() {

    backgroundmusic.close();
    ghostbullet.close();
    malelaugh.close();
    vannish.close();
    catchlantern.close();
    catchBattery.close();
    lightson.close();
  }

  void stopAndPlay() 
  {
    if (backgroundmusic.isPlaying()) 
    {
      backgroundmusic.pause();
    } else 
    backgroundmusic.loop();
  }


  void animatePlayerSides() {
    if ( !player.coliding || !controller.right && !controller.left && !controller.up || controller.left && controller.up && !controller.right || !controller.left && controller.up && controller.right ||  controller.left && controller.up && controller.right || controller.left && controller.right && !controller.up || controller.up && !controller.left && !controller.right)
      image(assetManager.images[3], 0, 0);
    else   
    image(assetManager.images[counter], 0, 0);
    if (System.currentTimeMillis() - assetManager.currentFrame >= 5) 
    {
      if (controlsEnabled)
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
      cursor((assetManager.cursorImage.copy()));
    }
  }
}