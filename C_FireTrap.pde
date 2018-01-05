class FireTrap
{
  PImage image;
  PVector position;
  float direction;
  float minx, maxx;
  boolean coliding;
  PVector velocity;
  float getH, getW, getX, getY;
  FireTrap (Rectangle FireArea) {
    position = new PVector(FireArea.x, FireArea.y);
    getH = FireArea.h;
    getW = FireArea.w;
    getX = FireArea.x;
    getY=FireArea.y;
  }
  void display() { 
    pushMatrix();
    rectMode(CORNER);

    popMatrix();
  }
  void update() {
    world.CheckCollisionTraps();
  }
}