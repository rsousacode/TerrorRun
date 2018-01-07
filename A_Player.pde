
class Player extends GameObject {
  PImage image;
  private  float direction;
  private PVector velocity;

  boolean coliding;

  Player(PVector position, PVector velocity) {
    super(position);
    this.velocity = velocity.copy();
    image = assetManager.playerImage();
    direction = 1;
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

    CheckCollisionWorld(0,0,0,0);
    // println("X:",player.position.x,"Y:",player.position.y);
    //println(player.position.x, player.position.y);
    //println(isOnGround);
  }
}