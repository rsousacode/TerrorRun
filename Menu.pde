class Menu
{
  private PVector playVector, titleVector, helpVector, exitVector, soundVector, creditsVector;
  private int pixelRadius;
  private boolean   OverHelp=false;
  private boolean   OverPlay=false;
  private boolean   OverTitle=false;
  private boolean overCredits = false;

  Menu ()
  {
    titleVector = new PVector(width/2, 1 * height/7);
    playVector = new PVector(width/2.1, 4 * height/7);
    helpVector = new PVector(width/1.5, 4 * height/7);
    exitVector = new PVector(width/1.05, height/15);
    soundVector = new PVector(width/2.1, 3 * height/9);
    creditsVector= new PVector(width/3.6, 4*height/7);
    pixelRadius = width/15;
  }
  void display()
  {
    imageMode(CENTER);
    showButtons();
    soundMuteButton();
  }

  void soundMuteButton() 
  {
    if (soundActivated)
      image(assetManager.soundButton(), soundVector.x, soundVector.y);
    else 
    image(assetManager.soundMenuButtonOff(), soundVector.x, soundVector.y);
  }

  void showButtons() 
  {
    image(assetManager.backgroundMenu(), width/2, height/2, width, height);
    image(assetManager.exitSysButton(), exitVector.x, exitVector.y);
    image(assetManager.creditsButton(), creditsVector.x, creditsVector.y, width/9, width/9);
  }

  void checkMouseOverButtons() {
    PVector mouseVector2 = new PVector(mouseX, mouseY);
    if (playVector.dist(mouseVector2) <= pixelRadius) {
      overCredits=false; 
      OverHelp=false; 
      OverPlay=true;
    } else if (helpVector.dist(mouseVector2) <= pixelRadius) {
      overCredits=false; 
      OverPlay=false;
      OverTitle=false;

      OverHelp=true;
    } else if (titleVector.dist(mouseVector2) <= pixelRadius) {
      OverTitle=true;
      OverPlay=false;
      OverHelp=false;
      overCredits=false;
    } else if (creditsVector.dist(mouseVector2) <=pixelRadius) {
      OverTitle=false;
      OverPlay=false;
      OverHelp=false;
      overCredits=true;
    } else {
      OverTitle=false;
      OverHelp=false; 
      OverPlay=false;
      overCredits=false;
    }
   
    if ( OverHelp!=false) 
    {
      image(assetManager.helpButton(), helpVector.x, helpVector.y, width/6, width/6);
    } else image(assetManager.helpButton(), helpVector.x, helpVector.y, width/9, width/9);
    if ( OverPlay!=false) 
    {
      image(assetManager.playButton(), playVector.x, playVector.y, width/6, width/6);
    } else image(assetManager.playButton(), playVector.x, playVector.y, width/9, width/9);
    if ( OverTitle!=false) 
    {
      image(assetManager.title(), titleVector.x, titleVector.y, width/1.2, width/2.8);
    } else image(assetManager.title(), titleVector.x, titleVector.y, width/1.5, width/3.6);
    if ( overCredits!=false) 
    {
      image(assetManager.creditsButton(), creditsVector.x, creditsVector.y, width/6, width/6);
    } else     image(assetManager.creditsButton(), creditsVector.x, creditsVector.y, width/9, width/9);
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
  if(creditsVector.dist(mouseVector) <= pixelRadius) {
    result = "credits"; 
    
  }
  return result;
}

void update() 
{
  checkMouseOverButtons();
}
}