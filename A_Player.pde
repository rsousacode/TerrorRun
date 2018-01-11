
class Player  extends GameObject {
  PImage image;
  private  float direction;
  private PVector velocity;


  boolean coliding;

  Player(float x, float y, PVector velocity) {
    super(x,y,assetManager.playerImage().width,assetManager.playerImage().height,1,1);
    
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

    CheckCollisionWorld(0,0,0,0);

  }
}