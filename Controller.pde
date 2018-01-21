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
    if (state == STATE_GAME) 
    {

      if ( player.coliding==true && up==true )
      {
        player.velocity.add(new PVector(0, player.jumpSpeed));
        player.coliding = false;
      }
      if (left==true  )
      { 
        if (controlsEnabled && !gamePaused)
        if (!gamePaused){
          player.moveBy(-player.WalkSpeed, 0);        
          player.direction= -1;
        }
      }
      if (right==true  )
      {
        if (controlsEnabled && !gamePaused) 
        if(!gamePaused)
        {
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
      gamePaused=!gamePaused;
    }

    if (controlsEnabled && !gamePaused) {
      if (key == 'W' || key == 'w'  ) 
      {
        up = true;
      } else if (key == 'D' || key == 'd'  ) 
      {
        right = true;
      } else if (key == 'A' || key == 'a') 
      {
        left = true;
      } else  if (key == 'Q' || key == 'q' ) 
      {
        scoreManager.useLantern();
      } else if (key == ' ') {
        scoreManager.fireBullets();
      } else if (key =='o' || key == 'O') 
      {
        if (turnOffDarkning) {
          turnOffDarkning=!turnOffDarkning;
          devmode=!devmode;
        } else  devmode=!devmode;
      } else if (key =='l' || key == 'L')
      {
        darkning.turnOff();
      }
      if (devmode) {

        if (key =='r' || key =='R') 
        {
          player.setPositionTo(5536, 3040);
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
    if (key == 'Y' || key == 'y') 
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