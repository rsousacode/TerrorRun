class LowBattery extends GameObject
{
  private PImage image;
  LowBattery (int x, int y, ID id) 
  {
    super(x, y, assetManager.lowBateryImage().width, assetManager.lowBateryImage().height, 0, 0, id);
    image = assetManager.lowBateryImage();
  }

  void draw() 
  { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() 
  {
    
  }

  LowBattery collision() {
    LowBattery bg = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2 ) 
    {

      bg = this;

      
    }
    return bg;
  }
}