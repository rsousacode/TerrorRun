
class Player  extends GameObject {
  PImage image;
    int direction;
  private PVector velocity;
  boolean coliding;
  int jumpSpeed= -19;
  int WalkSpeed = (int)5.3;

  Player(int x, int y, PVector velocity, ID id) {
    super(x, y, assetManager.playerImage().width, assetManager.playerImage().height, 1, 1,id);

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
    velocity.add( new PVector(0, 1.2).mult(0.999)); 

    moveBy(velocity);

    if (!coliding)
      moveBy(new PVector (0, 1));

    else
      moveBy(new PVector (0, 0));

    CheckCollisionWorld(0, 0, 0, 0);
  }
}