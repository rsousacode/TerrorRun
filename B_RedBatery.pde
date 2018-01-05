class HighBatery  extends GameObject
{
  PImage image;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  
  HighBatery (float x, float y) {
    super(x, y);
    image = loadImage("data/images/battery2.png");
  }
  
  void draw() { 
    imageMode(CENTER);
    image(image, 0, 0);
  }
  
  void update() {
  }
  
  HighBatery collision2() {
    HighBatery bg2 = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
      bg2 = this;
      hud.setScore(hud.getScore()+1500);
      //sndCoin.trigger();
          darkning.diameter+=150;
    }
    return bg2;
  }
}