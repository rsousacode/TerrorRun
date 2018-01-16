class BulletsPackFive  extends GameObject
{
  PImage image;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  BulletsPackFive (int x, int y) {
    super(x, y, assetManager.packfiveImage().width, assetManager.packfiveImage().height, 0, 0, ID.Packfivebullets);
    image = assetManager.packfiveImage();
  }

  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() {
  }

  BulletsPackFive collision2() {
    BulletsPackFive bp = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    { 
      coinEffect.rewind();
      coinEffect.play();
      bp = this;
      hud.setBullets(hud.bullets()+5);
    }
    return bp;
  }
}