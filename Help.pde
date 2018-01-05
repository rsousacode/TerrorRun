class Help
{
  PImage title,return2menu;
  PImage return2menu2;
  PVector return2menuShow, titleTitle, helphelp;
  PVector return2menuShow2;
  PImage help;
  int pixelRadius;
  PImage background; 
  Help ()
  {
    title = loadImage("data/images/title.png");
    return2menu = loadImage("data/images/return.png");
    help = loadImage("data/images/help.jpg");
     helphelp = new PVector(width/2, 1 * height/1.6);
    titleTitle = new PVector(width/2, 1 * height/7);
    return2menuShow = new PVector(width/1.1, 4 * height/4.5);
    pixelRadius = 100;
  }
  void display()
  {
    pushMatrix();
     image(background_menu,width/2,height/2,width,height);
 imageMode(CENTER);  
      image(title, titleTitle.x, titleTitle.y, width/1.5, width/3.6);
      image(return2menu, return2menuShow.x, return2menuShow.y);
      image(help, helphelp.x, helphelp.y, width/3,height/1.5);
 popMatrix();
  }
  String checkButtons()
  {
    String result = "";
    PVector mouseVector = new PVector(mouseX, mouseY);
    if(return2menuShow.dist(mouseVector) <= pixelRadius)
      result = "gomenu";
    return result;   
  }
}