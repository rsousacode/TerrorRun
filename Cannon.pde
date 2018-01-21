public class Canon 
{

  float fireForce;
  float direction;
  float rotation;

  public Canon() 
  {
    fireForce=350;
  }

  public void render() 
  {

    pushMatrix();
    rotate(getDir());
    popMatrix();
  }

  public void fire() 
  {
    if (controller.left || controller.right)
      fireForce=400;
    else 
    fireForce=350;

    Bullet s = new Bullet();
    s.position.x = player.position().x;
    s.position.y = player.position().y;
    if (player.direction==1)
      direction = getDir();
    else 
    direction = getOpDir();
    rotation = direction + PI/2;
    float x = sin(rotation) * fireForce;
    float y = -cos(rotation) * fireForce;
    s.applyForce( new PVector(x, y));
    handler.bullets.add(s);
  }

  float getDir() 
  {
    PVector mouse = new PVector(width/2, height/2-height/25 );
    PVector cannon = new PVector(-16, height-72);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }


  float getOpDir() 
  {
    PVector mouse = new PVector(-width/2, height/2 );
    PVector cannon = new PVector(-16, height-72);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }
}