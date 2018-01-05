class AssetManager {

  private PImage enemyImage;

  AssetManager() {
    enemyImage = loadImage("data/images/ghost.png");
  }
  
  PImage enemyImage() {
    return enemyImage;
  }
}