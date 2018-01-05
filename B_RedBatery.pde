class Batery2 
{
  PImage image;
  PVector position;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  Batery2 (float x, float y) {
    image = loadImage("data/images/battery2.png");
    position = new PVector(x, y);
  }
  void display() { 
    PVector mapposition = world.map.canvasToCam(position);
    pushMatrix();
    rectMode(CENTER);
    image(image, mapposition.x, mapposition.y);
    popMatrix();
  }
  void update() {
  }
  Batery2 collision2() {
    Batery2 bg2 = null;
    if (dist(player.position.x, player.position.y, position.x, position.y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
      bg2 = this;
      hud.setScore(hud.getScore()+1500);
      //sndCoin.trigger();
          darkning.diameter+=150;
    }
    return bg2;
  }
}