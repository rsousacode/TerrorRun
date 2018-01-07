abstract class GameObject {

  private PVector position;

  GameObject(PVector position) {
    this.position = position.copy();
  }

  GameObject(float x, float y) {
    this.position = new PVector(x, y);
  }

  PVector position() {
    return position.copy();
  }

  void setPositionXTo(float x) {
    position.x = x;
  }

  void setPositionYTo(float y) {
    position.y = y;
  }

  void moveBy(PVector displacement) {
    position.add(displacement);
  }

  void moveBy(float dx, float dy) {
    position.add(dx, dy);
  }
  

  abstract void update();
  
  void CheckHorizontal(float xi, float objX, float objWidth)
  {
    player.velocity.x=0;
    if (xi==objX)
    {
     player.velocity.x=0;
      setPositionXTo(objX-player.image.width/2);
    } else
    {
      player.velocity.x=0;
      setPositionXTo(objX+objWidth+player.image.width/2);
    }
  }
  //
 

  void CheckCollisionWorld(float objX, float objY, float objHeight, float objWidth)
  {

    player.coliding=false;
    for (StringDict obj : map.collisionMap)
    {
      objX = parseFloat(obj.get("x"));
      objY = parseFloat(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));
      float xi = Math.max (position().x-player.image.width/2, objX);
      float yi = Math.max (position().y-player.image.height/2, objY);
      float wi = Math.min ((position().x-player.image.width/2)+ player.image.width, objX + objWidth) - xi;
      float hi = Math.min ((position().y-player.image.height/2)+ player.image.height, objY + objHeight) - yi;
      if (wi >= 0 && hi >= 0)
      {
        if (wi > hi)
          CheckVertical(objY, yi, objHeight);
        else
          CheckHorizontal(xi, objX, objWidth);
      }
    }
  }

  void CheckVertical(float objY, float yi, float objHeight)
  {
    if (yi==objY )
    {
      setPositionYTo(objY-player.image.height/2);
      player.velocity.y=0;
      player.coliding=true;
    } else
    {
      setPositionYTo(objY+objHeight+player.image.height/2);
      player.velocity.y=0;
    }
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);

    pushStyle();

    draw();

    popStyle();

    popMatrix();
  }

  abstract void draw();
}