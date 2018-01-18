class AssetManager {
  boolean removeCursor = false;
  //***//MENU's IMAGES//***//
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
  private PImage scarygirlImage;
  private PImage ghostBullet;
  private PImage bullethudImage;
  private PImage packfiveImage;
  String path;


  AssetManager() {
    cursorImage= loadImage("data/images/cursor.png");
    backgroundMenu =   loadImage("data/images/background4.jpg");
    title = loadImage("data/images/title.png");
    return2menu = loadImage("data/images/return.png");
    helpButton = loadImage("data/images/help21.png");
    helpCurrent = loadImage("data/images/help.png");
    play=loadImage("data/images/play2.png");
    exitSys=loadImage("data/images/exit.png");
    transcursor= loadImage("data/images/transcursor.png");
    playerImage =    loadImage("data/images/skeleton.png");
    enemyImage = loadImage("data/images/ghost.png");
    lowBateryImage =   loadImage("data/images/battery.png");
    highBateryImage= loadImage("data/images/battery2.png");
    flashlightImage= loadImage("data/images/flashlight.png");
    scarygirlImage= loadImage("data/images/scarygirl.png");
    ghostBullet = loadImage("data/images/bone.png");
    bullethudImage = loadImage("data/images/bullhd.png");
    packfiveImage = loadImage("data/images/packfive.png");
    backgroundmusic=audio.loadFile("data/sounds/sample.mp3");
    coinEffect=audio.loadFile("data/sounds/pop.wav");
    scarygirlLaugh = audio.loadFile("data/sounds/scgl.wav");
    catchlantern = audio.loadFile("data/sounds/catchlantern.wav");
    vannish = audio.loadFile("data/sounds/vannish.wav");
    vannishgirl = audio.loadFile (  "data/sounds/vannishgirl.wav");
    backgroundmusic=audio.loadFile(  "data/sounds/sample.mp3");
    coinEffect=audio.loadFile(  "data/sounds/pop.wav");
    scarygirlLaugh = audio.loadFile(  "data/sounds/scgl.wav");
    catchlantern = audio.loadFile(  "data/sounds/catchlantern.wav");
    vannish = audio.loadFile(  "data/sounds/vannish.wav");
    dieghost = audio.loadFile(  "data/sounds/dieghost.wav");
    ghostbullet = audio.loadFile(  "data/sounds/ghostbullet.wav");
    malelaugh = audio.loadFile(  "data/sounds/malelaughsc.wav"); 
    lightson = audio.loadFile(  "data/sounds/lightson.wav"); 
    backgroundmusic.loop();
  }


  PImage backgroundMenu() {
    return backgroundMenu.copy();
  }

  PImage title() {
    return title;
  }

  PImage return2menu() {
    return return2menu;
  }

  PImage help() {
    return helpButton;
  }

  PImage helpCurrent() {
    return helpCurrent;
  }

  PImage exitSys() {
    return exitSys;
  }

  PImage play() {
    return play;
  }

  PImage cursorImage() {
    return cursorImage;
  }

  PImage transcursor() {
    return transcursor;
  }

  PImage playerImage() {
    return playerImage;
  }

  int playerHeight() {
    return playerImage.width;
  }

  int playerWidth() {
    return playerImage.height;
  }

  PImage enemyImage() {
    return enemyImage;
  }

  PImage ghostBullet() {
    return ghostBullet;
  }

  PImage lowBateryImage() {
    return lowBateryImage;
  }

  PImage flashlightImage() {
    return flashlightImage;
  }

  PImage highBateryImage() {
    return highBateryImage;
  }

  PImage scarygirlImage() {
    return scarygirlImage;
  }

  PImage packfiveImage() {
    return packfiveImage;
  }

  PImage bullethud() {
    return bullethudImage;
  }


  void Cursordisplay() {
    if (state==STATE_GAME) {
      removeCursor =true;
    } else {
      removeCursor =false;
    }

    if (removeCursor)
      cursor((assetManager.transcursor.copy()));
    else {
      cursor((assetManager.cursorImage.copy()));
    }
  }

  void removeCursor() {
    noCursor();
    
  }


  //void stop() {

  //  backgroundmusic.close();
  //  coinEffect.close();
  //  audio.stop();
  //}
}