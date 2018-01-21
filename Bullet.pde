class Bullet {

  PVector position;
  PVector acceleration;
  PVector velocity;
  PImage image;
  boolean colliding=false;

  Bullet() 
  {
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    image = assetManager.ghostBullet();
  }

  void update(float delta) 
  {
    if (controlsEnabled) 
    {
      velocity.add(acceleration);
      position.x += velocity.x * delta;
      position.y += velocity.y * delta;

      acceleration.mult(0);
    }
  }

  void applyForce(PVector force) 
  {
    if(controlsEnabled)
    acceleration.add(force);
  }

  void display() 
  {
    pushMatrix();
    translate(position.x, position.y);
    pushStyle();
    rotate(atan2(velocity.y, velocity.x));
    image(image, 0, 0);
    popStyle();
    popMatrix();
  }

  Bullet removeBullets() 
  {
    Bullet bl = null;
    if ( position.y > camera.position.y+height/2)
    {
      bl = this;
    }
    return bl;
  }
}