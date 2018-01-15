class Scarygirl extends GameObject
{
  PImage image;
  float direction;
  private float minx, maxx;

  Scarygirl (Rectangle livingSpace) {
    super(livingSpace.x, livingSpace.y + livingSpace.h - assetManager.scarygirlImage().height, assetManager.scarygirlImage().width, assetManager.scarygirlImage().height, 1, 0, ID.Scarygirl);
    image = assetManager.scarygirlImage();
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


  Scarygirl collision4() {
    Scarygirl sg = null;
    if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+player.image.height/2)
    {
      scarygirlLaugh.play();
      state=STATE_END;
    }

    for (Bullet b : handler.bullets) {

      if (dist(b.position.x, b.position.y, position().x, position().y +5)< 10) {
        vannishgirl.play();
        sg = this;
      }
    }
    return sg;
  }
}