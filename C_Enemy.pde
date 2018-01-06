class Enemy extends GameObject
{
  PImage image;
  float direction;
  private float minx, maxx;
  PVector velocity;

  Enemy (Rectangle livingSpace) {
    super(livingSpace.x, livingSpace.y + livingSpace.h - assetManager.enemyImage().height);
    image = assetManager.enemyImage();
    minx = livingSpace.x;
    maxx = livingSpace.x + livingSpace.w - image.width;
    velocity = new PVector(1, 0);
  }

  void draw() { 
    imageMode(CORNER);
    image(image, 0, 0);
  }

  void update() {
    moveBy(velocity);
    if (position().x <= minx || position().x >= maxx)
      velocity.x = -velocity.x;
  }
  
  Enemy collision4() {
    Enemy en = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
      en = this;
      //darkning.diameter-=77;
    }
    return en;
  }
}