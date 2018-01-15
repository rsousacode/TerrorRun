class Bullet {

  PVector position;
  PVector acceleration;
  PVector velocity;
  PImage img;
  boolean colliding=false;

  Bullet() {
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    img = loadImage("data/images/bone.png");
  }

  void update(float delta) {
    velocity.add(acceleration);
    position.x += velocity.x * delta;
    position.y += velocity.y * delta;

    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    pushStyle();
    rotate(atan2(velocity.y, velocity.x));
    image(img, 0, 0);
    popStyle();
    popMatrix();
  }

  Bullet collision1() {
    Bullet bl = null;
    if ( position.y > camera.position.y+height/2)
    {
      bl = this;
    }
    return bl;
  }
}