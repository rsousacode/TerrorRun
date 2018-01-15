public class Canon {

  float fireForce;
  float dir;
  float rot;
  int TILE_SIZE = 32;

  public Canon() {

    fireForce=350;
  }

  public void render() {

    pushMatrix();
    //translate(TILE_SIZE/2, height - 64 - 8);
    rotate(getDir());
    popMatrix();
  }

  public void fire() {
    if (controller.left || controller.right)
      fireForce=600;
    else 
    fireForce=350;

    Bullet s = new Bullet();
    s.position.x = player.position().x;
    s.position.y = player.position().y;
    if (player.direction==1)
      dir = getDir();
    else 
    dir = getOpDir();
    rot = dir + PI/2;
    float x = sin(rot) * fireForce;
    float y = -cos(rot) * fireForce;
    s.applyForce( new PVector(x, y));
    handler.bullets.add(s);
  }

  float getDir() {
    PVector mouse = new PVector(width/2, height/2-height/25 );
    PVector cannon = new PVector(-16, height-72);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }


  float getOpDir() {
    PVector mouse = new PVector(-width/2, height/2 );
    PVector cannon = new PVector(-16, height-72);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }
}