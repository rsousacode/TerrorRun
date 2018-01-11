class Controller {
  private boolean up;
  private boolean down;
  private boolean left;
  private boolean right;

  Controller() {
    up = false;
    down = false;
    left = false;
    right = false;
  }
  void apply()
  {    
    if ( player.coliding==true && up==true )
    {
      player.velocity.add(new PVector(0, player.jumpSpeed));
      player.coliding = false;
    }
    if (left==true && state == STATE_GAME )
    {
      player.moveBy(-player.WalkSpeed, 0);        
      player.direction= -1;
    }
    if (right==true && state == STATE_GAME )
    {
      player.moveBy(player.WalkSpeed, 0);             
      player.direction= 1;
    }
  }


  void keyPressed(char key) {
    if (key == 'W' || key == 'w'  ) {
      up = true;
    } else if (key == 'S' || key == 's') {
      down = true;
    } else if (key == 'D' || key == 'd'  ) {
      right = true;
    } else if (key == 'A' || key == 'a') {
      player.direction = -1;
      left = true;
    }
  }
  void keyReleased(char key)
  {  
    if (key == 'W' || key == 'w' ) {
      up = false;
    } else if (key == 'S' || key == 's' ) {
      down = false;
    } else if (key == 'D' || key == 'd') {
      right = false;
    } else if (key == 'A' || key == 'a'  ) {
      left = false;
    }
  }
}