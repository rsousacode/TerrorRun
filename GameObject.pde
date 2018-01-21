abstract class GameObject 
{

  private PVector position;
  private PVector velocity;
  private float w;
  private float h;
  protected ID id;

  GameObject(PVector position) 
  {
    this.position = position.copy();
    this.velocity = velocity.copy();
  }

  GameObject(int x, int y, int w, int h, int velX, int velY, ID id) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(velX, velY);
    this.w =w;
    this.h=h;
    this.id = id;
  }

  PVector position() 
  {
    return position.copy();
  }
  PVector velocity() 
  {
    return velocity.copy();
  }

  void setVelocityXTo(float velX) 
  {
    velocity.x = velX;
  }

  void setVelocityYTo(float velY) 
  {
    position.y = velY;
  }

  void setPositionXTo(float x) 
  {
    position.x = x;
  }

  void setPositionYTo(float y) 
  {
    position.y = y;
  }

  void setPositionTo( float x, float y) 
  {
    position = new PVector (x, y);
  }

  void resetpos() 
  {
    position = new PVector (position.x, position.y);
  }

  void moveBy(PVector displacement) 
  {
    position.add(displacement);
  }

  void moveBy(float dx, float dy) 
  {
    position.add(dx, dy);
  }

  void setSizeTo(float w, float h) 
  {
    this.w=w;
    this.h=h;
  }

  float width() 
  {
    return w;
  }

  float height() 
  {
    return h;
  }

  void CheckHorizontal(float xi, float objX, float objWidth)
  {
    
    player.velocity.x=0;
    if (xi==objX)
    {
      player.velocity.x=0;
      setPositionXTo(objX-w/2);
    } else
    {
      player.velocity.x=0;
      setPositionXTo(objX+objWidth+w/2);
    }
  }



  void CheckVertical(float objY, float yi, float objHeight)
  {
    if (yi==objY )
    {
      setPositionYTo(objY-h/2);
      player.velocity.y=0;
      player.coliding=true;
    } else
    {
      setPositionYTo(objY+objHeight+h/2);
      player.velocity.y=0;
    }
  }


  abstract void update();


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