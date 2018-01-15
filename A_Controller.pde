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
    if (state == STATE_GAME) {

      if ( player.coliding==true && up==true )
      {
        player.velocity.add(new PVector(0, player.jumpSpeed));
        player.coliding = false;
      }
      if (left==true  )
      {
        player.moveBy(-player.WalkSpeed, 0);        
        player.direction= -1;
      }
      if (right==true  )
      {
        player.moveBy(player.WalkSpeed, 0);             
        player.direction= 1;
      }
      if (key == 'K' || key == 'k' ) {
        if (hud.lanterns <= 4 && hud.lanterns!=1) {
          hud.setLanterns(hud.lanterns()-1);
          darkning.diameter = 2 * height;
        }
      }
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