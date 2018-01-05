class Menu
{
  PImage title, play, play0, background, help0, help, exit;
  PVector playVector, titleVector, helpVector, exitVector;
  int pixelRadius;
  boolean   OverHelp=false;
  boolean   OverPlay=false;
  boolean   OverTitle=false;
  int playNornal=0;
  Menu ()
  {
    title = loadImage("data/images/title.png");
    play = loadImage("data/images/play.png");
    play0=loadImage("data/images/play2.png");
    //help0 = loadImage("help22.png");
    help = loadImage("data/images/help21.png");
    play0=loadImage("data/images/play2.png");
    exit=loadImage("data/images/exit.png");
    titleVector = new PVector(width/2, 1 * height/7);
    playVector = new PVector(3*width/8, 4 * height/7);
    helpVector = new PVector(5*width/9, 4 * height/7);
    exitVector = new PVector(width/1.05, height/15);
    pixelRadius = width/15;
  }
  void display()
  {
    pushMatrix();
    imageMode(CENTER);
    image(background_menu, width/2, height/2, width, height);
    popMatrix();
    image(exit, exitVector.x, exitVector.y);
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
    return result;
  }

  void update() {
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
      image(help, helpVector.x, helpVector.y, width/6, width/6);
    } else image(help, helpVector.x, helpVector.y, width/9, width/9);
    if ( OverPlay!=false) {
      image(play0, playVector.x, playVector.y, width/6, width/6);
    } else image(play0, playVector.x, playVector.y, width/9, width/9);
    if ( OverTitle!=false) {
      image(title, titleVector.x, titleVector.y, width/1.2, width/2.8);
    } else image(title, titleVector.x, titleVector.y, width/1.5, width/3.6);
  }
  

}