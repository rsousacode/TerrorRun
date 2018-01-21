class HighBattery  extends GameObject
{
  private PImage image;
  HighBattery (int x, int y) {
    super(x, y, assetManager.highBateryImage().width, assetManager.highBateryImage().height, 0, 0, ID.HighBattery);
    image = assetManager.highBateryImage();
  }


  HighBattery collision2() {
    HighBattery bg2 = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    { 

      bg2 = this;

    }
    return bg2;
  }
  
    void draw() 
  { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() 
  {
  }
}