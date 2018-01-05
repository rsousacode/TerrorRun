class BackSpawn
{
  PImage image;
  PVector position;
  float direction;
  float minx, maxx;
  boolean coliding;
  PVector velocity;
  float getH, getW;
  BackSpawn (Rectangle BSpawnArea) {
    position = new PVector(BSpawnArea.x, BSpawnArea.y);
    getH = BSpawnArea.h;
    getW = BSpawnArea.w;
  }
  void display() { 
    PVector mapposition = world.map.canvasToCam(position);
    pushMatrix();
    rectMode(CORNER);
    fill(200);
    rect(mapposition.x, mapposition.y, getW, getH);
    popMatrix();
  }
    void update() {
    }
  BackSpawn collision6() {
    BackSpawn bsp = null;
    if (dist(player.position().x, player.position().y, position.x, position.y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
//     player.position.x=670;
//     player.position.y=3018;
    }
    return bsp;
  }
}