class LowBattery extends GameObject
{
  PImage image;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  LowBattery (float x, float y) {
    super(x, y,assetManager.lowBateryImage().width,assetManager.lowBateryImage().height);
    image = assetManager.lowBateryImage();
  }

  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() {
  }

  LowBattery collision() {
    LowBattery bg = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2 ) 
    {
      bg = this;
      hud.setScore(hud.getScore()+500);

      darkning.diameter+=80;
    }
    return bg;
  }
}