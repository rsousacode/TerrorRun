class Help
{
  private PVector return2menuPos, titlePos, helpPos;
  private int pixelRadius;
  Help ()
  {
    helpPos = new PVector(width/2, 1 * height/1.6);
    titlePos = new PVector(width/2, 1 * height/7);
    return2menuPos = new PVector(width/1.1, 4 * height/4.5);
    pixelRadius = 100;
  }
  void display()
  {
    pushMatrix();
    image(assetManager.backgroundMenu(), width/2, height/2, width, height);
    imageMode(CENTER);  
    image(assetManager.title(), titlePos.x, titlePos.y, width/1.5, width/3.6);
    image(assetManager.return2menu(), return2menuPos.x, return2menuPos.y);
    image(assetManager.helpCurrent(), helpPos.x, helpPos.y, width/3, height/1.5);
    popMatrix();
  }
  String checkButtons()
  {
    String result = "";
    PVector mouseVector = new PVector(mouseX, mouseY);
    if (return2menuPos.dist(mouseVector) <= pixelRadius)
      result = "gomenu";
    return result;
  }
}