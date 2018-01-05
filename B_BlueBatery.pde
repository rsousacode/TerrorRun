class Batery
{
  PImage image;
  PVector position;
  float direction;
  float lastx, lasty;
  boolean coliding;
  float velY, velX;
  Batery (float x, float y) {
  image = loadImage("data/images/battery.png");
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
  Batery collision() {
    Batery bg = null;
    if (dist(player.position.x, player.position.y, position.x, position.y + player.image.height/2)< player.image.width/2+player.image.height/2 ) 
    {
      bg = this;
      hud.setScore(hud.getScore()+500);

      darkning.diameter+=80;
    }
    return bg;
  }
}