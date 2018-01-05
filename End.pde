class End
{
  PImage title, return2menu;
  PImage return2menu2;
  PVector return2menuShow, titleTitle, helphelp;
  PVector return2menuShow2;
  PImage end;
  PFont font;
  int pixelRadius;
  PImage background; 
  End ()
  {
    title = loadImage("data/images/title.png");
    return2menu = loadImage("data/images/return.png");
    helphelp = new PVector(width/2, 1 * height/1.6);
    titleTitle = new PVector(width/2, 1 * height/7);
    return2menuShow = new PVector(width/1.1, 4 * height/4.5);
    font = createFont("Verdana", 55, true);

    pixelRadius = 100;
  }
  void display()
  {
    pushMatrix();

    image(background_menu, width/2, height/2, width, height);
    imageMode(CENTER);
    image(title, titleTitle.x, titleTitle.y, width/1.5, width/3.6);
    image(return2menu, return2menuShow.x, return2menuShow.y);
    textFont(font, 33);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("You loss with this score: " + hud.getScore(), width/2, height/3);
    popMatrix();
  }
  String checkButtons()
  {
    String result = "";
    PVector mouseVector = new PVector(mouseX, mouseY);
    if (return2menuShow.dist(mouseVector) <= pixelRadius)
      result = "gomenu";
    return result;
  }
}