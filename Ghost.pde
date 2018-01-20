class Ghost extends GameObject
{
  PImage image;
  float direction;
  private float minx, maxx;

  Ghost (Rectangle livingSpace) {
    super(livingSpace.x, livingSpace.y + livingSpace.h - assetManager.enemyImage().height, assetManager.enemyImage().width, assetManager.enemyImage().height, 1, 0, ID.Ghost);
    image = assetManager.enemyImage();
    minx = livingSpace.x;
    maxx = livingSpace.x + livingSpace.w - image.width;
  }

  void draw() { 
    imageMode(CORNER);
    image(image, 0, 0);
  }

  void update() {
    if (controlsEnabled) {
      moveBy(velocity());
      if (position().x <= minx )
        setVelocityXTo(1);
      if (position().x >= maxx)
        setVelocityXTo(-1);
    }
  }


  Ghost collision4() {
    Ghost en = null;
    if (!devmode) 
    {
      if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width/2+10)
      {
        malelaugh.play();
        if (!devmode)
          state=STATE_END;
      }
    }

    for (Bullet b : handler.bullets) {

      if (dist(b.position.x, b.position.y, position().x+5, position().y + 5)< 10) {
        en = this;
        vannish.rewind();
        vannish.play();
      }
    }

    return en;
  }
}