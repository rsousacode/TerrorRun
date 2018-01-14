class LowBattery extends GameObject
{
  PImage image;
  int direction;
  int lastx, lasty;
  boolean coliding;
  int velY, velX;
  LowBattery (int x, int y, ID id) {
    super(x, y, assetManager.lowBateryImage().width, assetManager.lowBateryImage().height, 0, 0, id);
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
      coinEffect.rewind();
      coinEffect.play();
      bg = this;
      hud.setScore(hud.getScore()+500);
      darkning.diameter+=150;
    }
    return bg;
  }
}