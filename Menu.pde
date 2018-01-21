class Menu
{
  PVector playVector, titleVector, helpVector, exitVector, soundVector;
  int pixelRadius;
  boolean   OverHelp=false;
  boolean   OverPlay=false;
  boolean   OverTitle=false;

  Menu ()
  {
    titleVector = new PVector(width/2, 1 * height/7);
    playVector = new PVector(3*width/7.77, 4 * height/7);
    helpVector = new PVector(5*width/8.88, 4 * height/7);
    exitVector = new PVector(width/1.05, height/15);
    soundVector = new PVector(width/2.1, height/1.2);
    pixelRadius = width/15;
  }
  void display()
  {
    pushMatrix();
    imageMode(CENTER);
    image(assetManager.backgroundMenu(), width/2, height/2, width, height);
    popMatrix();
    image(assetManager.exitSys(), exitVector.x, exitVector.y);
    if(soundActivated)
    image(assetManager.soundButton(), soundVector.x, soundVector.y);
    else 
    image(assetManager.soundMenuButtonOff(), soundVector.x, soundVector.y);
  }

  void checkMouseOverButtons() {
    PVector mouseVector2 = new PVector(mouseX, mouseY);
    if (playVector.dist(mouseVector2) <= pixelRadius) {
      OverHelp=false; 
      OverPlay=true;
    } else if (helpVector.dist(mouseVector2) <= pixelRadius) {
      OverPlay=false;
      OverTitle=false;

      OverHelp=true;
    } else if (titleVector.dist(mouseVector2) <= pixelRadius) {
      OverTitle=true;
      OverPlay=false;
      OverHelp=false;
    } else {
      OverTitle=false;
      OverHelp=false; 
      OverPlay=false;
    }
    if ( OverHelp!=false) {
      image(assetManager.help(), helpVector.x, helpVector.y, width/6, width/6);
    } else image(assetManager.help(), helpVector.x, helpVector.y, width/9, width/9);
    if ( OverPlay!=false) {
      image(assetManager.play(), playVector.x, playVector.y, width/6, width/6);
    } else image(assetManager.play(), playVector.x, playVector.y, width/9, width/9);
    if ( OverTitle!=false) {
      image(assetManager.title(), titleVector.x, titleVector.y, width/1.2, width/2.8);
    } else image(assetManager.title(), titleVector.x, titleVector.y, width/1.5, width/3.6);
  }

  String checkButtons()
  {
    String result = "";
    PVector mouseVector = new PVector(mouseX, mouseY);

    if (playVector.dist(mouseVector) <= pixelRadius) {
      result = "play";
    }
    if (helpVector.dist(mouseVector) <= pixelRadius) {
      result = "help";
    }
    if (exitVector.dist(mouseVector) <= pixelRadius/2) {
      result = "exit";
    }
    if (soundVector.dist(mouseVector) <= pixelRadius) {
      result = "sound";
    }
    return result;
  }

  void update() {

    checkMouseOverButtons();
  }
}