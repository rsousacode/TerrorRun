
class Player  extends GameObject {
  PImage image;
  int direction;
  private PVector velocity;
  boolean coliding;
  int jumpSpeed;
  int WalkSpeed;
  private int Pheight;
  private int Pwidth;
  boolean collidingHorizontal;

  //int WalkSpeed = (int)8;

  int numFrames = 38;  // The number of frames in the animation
  long currentFrame;
  PImage[] images = new PImage[numFrames];
  int counter;
  Player(int x, int y, PVector velocity, ID id) {
    super(x, y, assetManager.playerImage().width, assetManager.playerImage().height, 1, 1, id);
    WalkSpeed = (int)3.8;
    jumpSpeed= -13;
    this.velocity = velocity.copy();
    image = assetManager.playerImage();
    direction = 1;
    this.Pheight = assetManager.playerImage().height;
    this.Pwidth=assetManager.playerImage().width;


    for (int i = 0; i < numFrames; i++) {
      images[i] = loadImage("data/images/animation/pl " + (i + 1) + ".png");
    }
  }

  int pwidth() {

    return Pwidth;
  }

  int pheight() {

    return Pheight;
  }


  void draw() { 
    scale(player.direction, 1);
    imageMode(CENTER);
    scale(-1, 1);

    if (!coliding || !controller.right && !controller.left && !controller.up || controller.left && controller.up && !controller.right || !controller.left && controller.up && controller.right ||  controller.left && controller.up && controller.right || controller.left && controller.right && !controller.up || controller.up && !controller.left && !controller.right)
      image(images[3], 0, 0);
    else   
    image(images[counter], 0, 0);
    if (System.currentTimeMillis() - currentFrame >= 5) {
      if (controlsEnabled)
        counter ++;
      if (counter > 37)
        counter=0;
    } else image(images[counter], 0, 0);
    
  }

  void CheckCollisionWorld(int objX, int objY, float objHeight, float objWidth)
  {

    player.coliding=false;
    for (StringDict obj : map.collisionMap)
    {
      objX = int(obj.get("x"));
      objY = int(obj.get("y"));
      objWidth = parseFloat(obj.get("width"));
      objHeight = parseFloat(obj.get("height"));
      float xi = Math.max (position().x-Pwidth/2, objX);
      float yi = Math.max (position().y-Pheight/2, objY);
      float wi = Math.min ((position().x-Pwidth/2)+ Pwidth, objX + objWidth) - xi;
      float hi = Math.min ((position().y-Pheight/2)+ Pheight, objY + objHeight) - yi;
      if (wi >= 0 && hi >= 0)
      {
        if (wi > hi) {
          CheckVertical(objY, yi, objHeight);
        } else
          CheckHorizontal(xi, objX, objWidth);
      }
    }
  }

  void checkColliders() { 
    if (controlsEnabled) 
    {
      velocity.add( new PVector(0, .5).mult(0.999)); 
      moveBy(velocity);

      if (!coliding) {
        moveBy(new PVector (0, 0.001));
      } else
        moveBy(new PVector (0, 0));
    }
    CheckCollisionWorld(0, 0, 0, 0);
  }


  void update()
  {
    checkColliders();
  }
}