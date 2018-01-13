class FireTrap extends GameObject
{
  PImage image;
  int direction;
  int minx, maxx;
  boolean coliding;
  PVector velocity;
  int getH, getW, getX, getY;

  FireTrap (Rectangle fireArea, ID id) {
    super(fireArea.x, fireArea.y, fireArea.h,fireArea.x,0,0,id);
    getH = fireArea.h;
    getW = fireArea.w;
    getX = fireArea.x;
    getY=fireArea.y;
  }

  void draw() {
  }

  void update() {
    handler.CheckCollisionTraps(0,0,0,0);
  }
}