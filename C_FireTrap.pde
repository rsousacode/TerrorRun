class FireTrap extends GameObject
{
  PImage image;
  int direction;
  int minx, maxx;
  boolean coliding;
  PVector velocity;
  int getH, getW, getX, getY;
  int collisionOffset = 10;

  FireTrap (Rectangle fireArea, ID id) {
    super(fireArea.x, fireArea.y, fireArea.h, fireArea.x, 0, 0, id);
    getH = fireArea.h;
    getW = fireArea.w;
    getX = fireArea.x;
    getY=fireArea.y;
  }

  void draw() {
  }

  void update() {
    // handler.CheckCollisionTraps(0, 0, 0, 0);
  }

  FireTrap  PlayerColidingTraps()
  {
    FireTrap fa=null;
    float objX =0;
    float objY = 0;
    float objWidth = 0 ;
    float objHeight= 0;

    for (StringDict obj : map.trapsPos)
    {
      objX = parseFloat(obj.get("x"));
      objY = parseFloat(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));

      float xi = Math.max (player.position().x-player.image.width/2+collisionOffset, objX);
      float yi = Math.max (player.position().y-player.image.height/2, objY);
      float wi = Math.min ((player.position().x-player.image.width/2-collisionOffset)+ player.image.width, objX + objWidth) - xi;
      float hi = Math.min ((player.position().y-player.image.height/2)+ player.image.height, objY + objHeight) - yi;
      if (wi >= 0 && hi >= 0)
      {
        if (wi > hi) {
          fa=this;
          //state=STATE_END;
        } else {
          fa=this;

          //state=STATE_END;
        }
      }
    }
    return fa;
  }
}