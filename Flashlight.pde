class Flashlight  extends GameObject
{
  PImage image;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  Flashlight (int x, int y) {
    super(x, y, assetManager.flashlightImage().width, assetManager.flashlightImage().height, 0, 0, ID.Flashlight);
    image = assetManager.flashlightImage();
  }

  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }

  void update() {
  }

  Flashlight collision2() {
    Flashlight fl = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    { 
      catchlantern.play();
      fl = this;
      hud.setLanterns(hud.lanterns()+1);
    }
    return fl;
  }
}