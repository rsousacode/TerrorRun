class FireTrap extends GameObject
{
  PImage image;
  float direction;
  float minx, maxx;
  boolean coliding;
  PVector velocity;
  float getH, getW, getX, getY;
  
  FireTrap (Rectangle fireArea) {
    super(fireArea.x, fireArea.y);
    getH = fireArea.h;
    getW = fireArea.w;
    getX = fireArea.x;
    getY=fireArea.y;
  }
  
  void draw() { 
  }

  void update() {
    world.CheckCollisionTraps();
  }
}