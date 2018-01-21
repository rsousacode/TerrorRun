class Controller 
{
  private boolean up;
  private boolean left;
  private boolean right;

  Controller() 
  {
    up = false;
    left = false;
    right = false;
  }
  void apply()
  {
    if (state == STATE_GAME) {

      if ( player.coliding==true && up==true )
      {
        player.velocity.add(new PVector(0, player.jumpSpeed));
        player.coliding = false;
      }
      if (left==true  )
      { 
        if (controlsEnabled) {
          player.moveBy(-player.WalkSpeed, 0);        
          player.direction= -1;
        }
      }
      if (right==true  )
      {
        if (controlsEnabled) {
          player.moveBy(player.WalkSpeed, 0);             
          player.direction= 1;
        }
      }
    }
  }


  void keyPressed(char key) 
  {

    if (key=='p' || key =='P' && key =='A' )
      player.resetpos();

    if (key=='P' || key =='p' ) {
      controlsEnabled=!controlsEnabled;
    }

    if (controlsEnabled) {
      if (key == 'W' || key == 'w'  ) 
      {
        up = true;
      } else if (key == 'D' && controlsEnabled|| key == 'd' && controlsEnabled  ) {
        right = true;
      } else if (key == 'A'&& controlsEnabled || key == 'a'&& controlsEnabled) {
        left = true;
        if (state==STATE_MENU)
          menu.OverPlay=true;
      } else  if (key == 'Q' || key == 'q' ) {
        if ( scoreManager.lanterns!=1) {
          scoreManager.setLanterns(scoreManager.lanterns()-1);
          darkning.diameter = 2 * height;
          assetManager.soundEquipLantern();
        }
      } else if (key == ' ') {
        if (scoreManager.bullets() > 0) {
          scoreManager.setBullets(scoreManager.bullets()-1);
          canon.fire();
          assetManager.soundGhostBullet();
        }
      } else if (key =='o' || key == 'O') {
        if (turnOffDarkning) {
          turnOffDarkning=!turnOffDarkning;
          devmode=!devmode;
        } else  devmode=!devmode;
      } else if (key =='l' || key == 'L') {
        if (devmode)
          turnOffDarkning=!turnOffDarkning;
      }
      if (devmode) {

        if (key =='r' || key =='R') 
        {
          player.setPositionTo(624, 1184);
        }
        if (key == 'X' || key == 'x')
          player.WalkSpeed++;
        if (key == 'Y' || key == 'y')
          player.jumpSpeed--;
        if (key == 'M' || key == 'm') 

        {
          handler. resetJumpSpeedandWalkSpeed();
        }
      }
    }
    if (key == 'S' || key == 's') 
    {
      soundActivated=!soundActivated;
      assetManager.stopAndPlay();
    }
  }
  void keyReleased(char key)
  {  
    if (key == 'W' || key == 'w' ) {
      up = false;
    } else if (key == 'D' || key == 'd') 
    {
      right = false;
    } else if (key == 'A' || key == 'a'  ) 
    {
      left = false;
    }
  }
}