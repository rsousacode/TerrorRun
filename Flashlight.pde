class Flashlight  extends GameObject
{
  private PImage image;

  Flashlight (int x, int y) 
  {
    super(x, y, assetManager.flashLight().width, assetManager.flashLight().height, 0, 0, ID.Flashlight);
    image = assetManager.flashLight();
  }

  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() 
  {
  }

  Flashlight collision2() 
  {
    Flashlight fl = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    { 

      fl = this;
      scoreManager.setLanterns(scoreManager.lanterns()+1);
    }
    return fl;
  }
}