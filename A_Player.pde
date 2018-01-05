
class Player extends GameObject {
  PImage image;
  private  float direction;
  private PVector velocity;

  boolean coliding;

  Player(PVector position, PVector velocity) {
    super(position);
    image = loadImage("data/images/skeleton.png");
    this.velocity = velocity.copy();
    direction = 1;
  }

  void CheckHorizontal(float xi, float objX, float objWidth)
  {
    velocity.x=0;
    if (xi==objX)
    {
      velocity.x=0;
      setPositionXTo(objX-image.width/2);
    } else
    {
      velocity.x=0;
      setPositionXTo(objX+objWidth+image.width/2);
    }
  }
  void CheckCollisionWorld()
  {
    float objY=0, objX=0;
    float objHeight=0, objWidth=0;
    coliding=false;
    for (StringDict obj : world.collisionMap)
    {
      objX = parseFloat(obj.get("x"));
      objY = parseFloat(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));
      float xi = Math.max (position().x-image.width/2, objX);
      float yi = Math.max (position().y-image.height/2, objY);
      float wi = Math.min ((position().x-image.width/2)+ image.width, objX + objWidth) - xi;
      float hi = Math.min ((position().y-image.height/2)+ image.height, objY + objHeight) - yi;
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
      setPositionYTo(objY-image.height/2);
      velocity.y=0;
      coliding=true;
    } else
    {
      setPositionYTo(objY+objHeight+image.height/2);
      velocity.y=0;
    }
  }
  void draw() { 
    scale(player.direction, 1);
    imageMode(CENTER);
    image(player.image, 0, 0);
  }

  void update()
  {
    velocity.add( new PVector(0, 1.2).mult(0.999)); //JUMP Velocity

    moveBy(velocity);

    if (!coliding)
      moveBy(new PVector (0, 1));

    else
      velocity = new PVector(0, 0);
      
    CheckCollisionWorld();
    // println("X:",player.position.x,"Y:",player.position.y);
    //println(player.position.x, player.position.y);
    //println(isOnGround);
  }
}