
class Enemy
{
  PImage image;
  PVector position;
  float direction;
  float minx, maxx;
  boolean coliding;
  PVector velocity;
  Enemy (Rectangle livingSpace) {
    image = loadImage("data/images/ghost.png");
    position = new PVector(livingSpace.x, livingSpace.y + livingSpace.h - image.height);
    minx = livingSpace.x;
    maxx = livingSpace.x + livingSpace.w - image.width;
    velocity = new PVector(1, 0);
  }
  void display() { 
    PVector mapposition = world.map.canvasToCam(position);
    pushMatrix();
    rectMode(CENTER);
    imageMode(CORNER);
    image(image, mapposition.x, mapposition.y);
    popMatrix();
  }
    void update() {
    position.add(velocity);
    if (position.x <= minx || position.x >= maxx)
    velocity.x = -velocity.x;
  }
  Enemy collision4() {
    Enemy en = null;
    if (dist(player.position.x, player.position.y, position.x, position.y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
     en = this;
     //darkning.diameter-=77;
    }
    return en;
  }
}