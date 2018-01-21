class Rectangle 
{
  int x, y, w, h, getID;
  float collisionOffset=10;
  Rectangle(StringDict obj) {
    this.x = int(obj.get("x"));
    this.y = int(obj.get("y"));
    this.w = int(obj.get("width"));
    this.h = int(obj.get("height"));
  }

  Rectangle collision() 
  {
    Rectangle rec = null; //added w/2 to this collision to polish the teleport method
    if (dist(player.position().x, player.position().y, x+w/2, y + player.image.height/2)< player.image.width/2+player.image.height/2 )
    {
      rec=this;
    }
    return rec;
  }

  Rectangle RectangleAreaCollision() 
  {
    {
      Rectangle rg=null;
      float objX =0;
      float objY = 0;
      float objWidth = 0 ;
      float objHeight= 0;
      if (!devmode)
        for (StringDict obj : map.leftTriggerPos)
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
              rg=this;
            } else {
              rg=this;
            }
          }
        }
      return rg;
    }
  }
}