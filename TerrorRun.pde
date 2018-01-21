//TERROR-RUN---------------// //<>//
//Use key "O" to use developer-mode
//Use key "Y" to mute sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
boolean allowDevMode = true;
private boolean devmode = false;
private boolean turnOffDarkning = false;
private boolean controlsEnabled=true;
private boolean gamePaused = false;
private boolean soundActivated = true;
boolean jumpActivated = true;

private int state;
final int STATE_MENU=1;
final int STATE_GAMEOVER=2;
final int STATE_HELP=3;
final int STATE_END=4;
final int STATE_CREDITS=5;
final int STATE_GAME=0;
PImage background_menu;
PImage background_help;
Minim audio;
AudioPlayer ghostDieSound;
AudioPlayer bulletSound;
AudioPlayer girlDieSound;
AudioPlayer maleLaughSound;
AudioPlayer useLanternSound;
AudioPlayer backgroundMusic;
AudioPlayer jumpSound;
AudioPlayer getBatterySound;
AudioPlayer girlLoughSound;
AudioPlayer getLanternSound;
AudioPlayer EnemieDiesSound;

Bullet bullet;
Handler handler;
AssetManager assetManager;
Camera camera;
Controller controller;
Player player;
Canon canon;
Menu menu;
Ghost ghost;
Help help;
Credits credits;
Darkning darkning;
GameManager scoreManager;
Rectangle rectangle;
End end;
Map map;

void settings() 
{
  smooth(33);
 fullScreen(P2D); // Tested
//size(800,600, P2D); //Tested, player is more fast but still playable
}

void setup()
{
  audio = new Minim(this);
  assetManager = new AssetManager();
  controller = new Controller();
  frameRate(100);
  setState(STATE_MENU);
}

//initialization states
void setState(int state) 
{
  this.state = state;
  switch(state) 
  {
  case STATE_GAME:
    gamePaused = false;
    controlsEnabled=true;
    map = new Map(this);
    handler = new Handler();
    scoreManager = new GameManager();
    player = new Player(5536, 3040, new PVector(0, 0), ID.Player);
    canon = new Canon();
    camera = new Camera(player.position());
    darkning = new Darkning();
  case STATE_END:

    end = new End();
  case STATE_MENU:
    menu = new Menu();
  case STATE_HELP:
    help = new Help();
  case STATE_CREDITS:
    credits = new Credits();
  }
}

void draw()
{
  if (state== STATE_MENU ) 
  {
    menu.display();
    menu.update();
    controller.apply();
  } else if (state== STATE_HELP ) 
  {
    help.display();
  } else if (state==STATE_CREDITS) 
  {
    credits.display();
  } else if ( state== STATE_GAME) 
  {
    background(0);
    controller.apply();
    if (controlsEnabled);
    player.update();
    canon.render();

    map.update();
    handler.update();
    darkning.update();
    camera.update();
    camera.apply();
    map.display();
    handler.display();
    player.display();

    if (!turnOffDarkning) 
    {
      darkning.apply();
    }
    if (controlsEnabled)
      scoreManager.display();
  } else if (state== STATE_END ) 
  {
    end.display();
  }

  assetManager.Cursordisplay();
}


float sqr(float value) 
{
  return value * value;
}

void StatesInter() {
  if (state == STATE_MENU ) 
  {
    String result = menu.checkButtons();
    switch(result)
    {
    case "play":
      setState(STATE_GAME);

      break;
    } 
    switch(result)
    {
    case "help":
      setState(STATE_HELP);

      break;
    }
    switch(result) {
    case "credits":
      setState(STATE_CREDITS);
      break;
    }
    switch(result) {
    case "sound":
      soundActivated=!soundActivated;
      assetManager.stopAndPlay();
      break;
    }

    switch(result)
    {
    case "exit":
      assetManager.stopAudio();
      exit();
      break;
    }
  } 
  
  
  if (state == STATE_HELP ) 
  {
    String result = help.checkButtons();
    switch(result)
    {
    case "gomenu":
      setState(STATE_MENU);
      break;
    }
  } else if (state == STATE_END ) 
  {
    String result = end.checkButtons();
    switch(result)
    {
    case "gomenu":
      setState(STATE_MENU);

      break;
    }
  } else if (state == STATE_CREDITS ) 
  {
    String result = credits.checkButtons();
    switch(result)
    {
    case "gomenu":
      setState(STATE_MENU);

      break;
    }
  }
}


void keyPressed() 
{
  controller.keyPressed(key);
}

void keyReleased() 
{
  controller.keyReleased(key);
}

void mousePressed() 
{
  StatesInter();
}