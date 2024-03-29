class Scarygirl extends GameObject
{
  private float minx, maxx;

  Scarygirl (Rectangle livingSpace) 
  {
    super(livingSpace.x, livingSpace.y + livingSpace.h - assetManager.scaryGirl().height, assetManager.scaryGirl().width, assetManager.scaryGirl().height, 1, 0, ID.Scarygirl);
    minx = livingSpace.x;
    maxx = livingSpace.x + livingSpace.w - assetManager.scaryGirl().width;
  }

  void draw() 
  { 
    imageMode(CORNER);
    image(assetManager.scaryGirl(), 0, 0);
  }

  void update() 
  {
    if (controlsEnabled && !gamePaused) 
    {
      moveBy(velocity());
      if (position().x <= minx )
        setVelocityXTo(1);
      if (position().x >= maxx)
        setVelocityXTo(-1);
    }
  }

  Scarygirl collisionPlayer() 
  {
    Scarygirl sg = null;

    if (!devmode) 
    {
      if (dist(player.position().x, player.position().y, position().x, position().y + player.image.height/2)< player.image.width+10)
      {
        sg=this;
      }
    }

    return sg;
  }

  Scarygirl collisionBullets() 
  {
    Scarygirl bs = null;


    for (Bullet b : handler.bullets) 
    {
      if (dist(b.position.x, b.position.y, position().x+5, position().y + 5)< 10) {
        bs = this;
      }
    }
    return bs;
  }
}