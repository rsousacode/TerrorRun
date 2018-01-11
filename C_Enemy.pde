class Enemy extends GameObject
{
  PImage image;
  float direction;
  private float minx, maxx;

  Enemy (Rectangle livingSpace) {
    super(livingSpace.x, livingSpace.y + livingSpace.h - assetManager.enemyImage().height, assetManager.enemyImage().width, assetManager.enemyImage().height, 1, 0);
    image = assetManager.enemyImage();
    minx = livingSpace.x;
    maxx = livingSpace.x + livingSpace.w - image.width;
  }

  void draw() { 
    imageMode(CORNER);
    image(image, 0, 0);
  }

  void update() {
    moveBy(velocity());
    if (position().x <= minx )
      setVelocityXTo(1);
    if (position().x >= maxx)
      setVelocityXTo(-1);
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