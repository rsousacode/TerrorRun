class Batery extends GameObject
{
  PImage image;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  Batery (float x, float y) {
    super(x, y);
  image = loadImage("data/images/battery.png");
  }
  
  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }
  
  void update() {
  }
  
  Batery collision() {
    Batery bg = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2 ) 
    {
      bg = this;
      hud.setScore(hud.getScore()+500);

      darkning.diameter+=80;
    }
    return bg;
  }
}