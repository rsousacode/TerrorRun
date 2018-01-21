class End
{
  private PVector return2menuShow, titleTitle;
  PVector return2menuShow2;
  PFont font;
  int pixelRadius;
  End ()
  {
    titleTitle = new PVector(width/2, 1 * height/7);
    return2menuShow = new PVector(width/1.1, 4 * height/4.5);
    font = assetManager.font();

    pixelRadius = 100;
  }
  
    void displayImages() {

    imageMode(CENTER);
    image(assetManager.backgroundMenu(), width/2, height/2, width, height);
    image(assetManager.title(), titleTitle.x, titleTitle.y, width/1.5, width/3.6);
    image(assetManager.return2menu(), return2menuShow.x, return2menuShow.y);
    image(assetManager.youlost(), width/2, height/1.9);
  }

  void  displayScore() {
    textFont(font);
    textAlign(CENTER);
    textSize(44);
    fill(255, 0, 0);
    text("You loss with this score: " + scoreManager.score(), width/2, height/1.2);
  }
  
  void display()
  {
    displayImages();
    displayScore();
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