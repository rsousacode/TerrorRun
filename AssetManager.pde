class AssetManager {

  private PImage enemyImage;
  private PImage lowBateryImage;
  private PImage highBateryImage;
  private PImage playerImage;
  private PImage transcursor;
  private PImage cursorImage;
  private PImage backgroundMenu;
  private PImage title;
  private PImage helpButton;
  private PImage return2menu;
  private PImage exitSys;
  private PImage play;
  private PImage helpCurrent;


  AssetManager() {
    backgroundMenu =   loadImage("data/images/background4.jpg");
    title = loadImage("data/images/title.png");
    return2menu = loadImage("data/images/return.png");
    helpButton = loadImage("data/images/help21.png");
    helpCurrent = loadImage("data/images/help.jpg");
    play=loadImage("data/images/play2.png");
    exitSys=loadImage("data/images/exit.png");

    cursorImage= loadImage("data/images/cursor.png");
    transcursor= loadImage("data/images/transcursor.png");
    playerImage =    loadImage("data/images/skeleton.png");
    enemyImage = loadImage("data/images/ghost.png");
    lowBateryImage =   loadImage("data/images/battery.png");
    highBateryImage= loadImage("data/images/battery2.png");
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

  PImage lowBateryImage() {
    return lowBateryImage;
  }

  PImage highBateryImage() {
    return highBateryImage;
  }

  void Cursordisplay() {
    if (state!=STATE_GAME ) {
      cursor((assetManager.cursorImage.copy()));
    } else if (state==STATE_GAME) {
      cursor((assetManager.transcursor.copy()));
    }
  }
}