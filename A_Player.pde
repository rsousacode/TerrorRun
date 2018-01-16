
class Player  extends GameObject {
  PImage image;
  int direction;
  private PVector velocity;
  boolean coliding;
  int jumpSpeed= -19;
  int WalkSpeed = (int)5.3;
  int numFrames = 38;  // The number of frames in the animation
  long currentFrame;
  PImage[] images = new PImage[numFrames];
  int counter;
  boolean animatingleft = false;
  boolean animatingright = false;



  Player(int x, int y, PVector velocity, ID id) {
    super(x, y, assetManager.playerImage().width, assetManager.playerImage().height, 1, 1, id);

    this.velocity = velocity.copy();
    image = assetManager.playerImage();
    direction = 1;


    for (int i = 0; i < numFrames; i++) {
      images[i] = loadImage("data/images/animation/pl " + (i + 1) + ".png");
    }
  }


  void draw() { 
    scale(player.direction, 1);
    imageMode(CENTER);
    scale(-1, 1);
    if (controller.left || controller.right) {
      image(images[counter], 0, 0);
      animatingright=true;
    }
    if (controller.right && controller.left) {
      image(images[0], 0, 0);
      animatingleft=true;
    }

    if (controller.left==false && controller.right==false)
    image(images[3], 0, 0);







    if (System.currentTimeMillis() - currentFrame >= 5) {
      counter ++;

      currentFrame = System.currentTimeMillis();
      if (counter > 37)
        counter=0;
    }
  }

  void update()
  {
    velocity.add( new PVector(0, .9).mult(0.999)); 

    moveBy(velocity);

    if (!coliding)
      moveBy(new PVector (0, 1));

    else
      moveBy(new PVector (0, 0));

    CheckCollisionWorld(0, 0, 0, 0);
  }
}