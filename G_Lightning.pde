class Darkning {
  PVector position;
  private float diameter;
  public float acceltime = 128/2;
  private float smoothedDiameter;
  boolean CollidingWithBateries;
  PGraphics darkning;
  float DiameterRate = (float)width/2500;

  Darkning() {
    diameter = 2 * height;
    smoothedDiameter = 2 * height;
    int size = min(width, height) / 9;
    darkning = createGraphics(size, size);
    darkning.beginDraw();
    darkning.loadPixels();
    float radius = size / 4.0;
    for (int line = 0; line != darkning.height; line++)
      for (int column = 0; column != darkning.width; column++) {
        int pixel = line * darkning.width + column;
        float distance = dist(column, line, darkning.width / 2, darkning.height / 2);
        float factor = exp(-sqr(distance / radius));
        darkning.pixels[pixel] = color(factor * 255);
      }
    darkning.updatePixels();
    darkning.endDraw();
    diameter = max(width, height);
    position = new PVector(width / 2, height / 2);
  }

  void apply(PVector center, float radius) {
    pushStyle();

    rectMode(CORNER);
    fill(0);
    stroke(0);
    if (center.y - radius > 0)
      rect(0, 0, width, center.y - radius);
    if (center.y + radius < height)
      rect(0, center.y + radius, width, height - center.y - radius);

    if (center.x - radius > 0)
      rect(0, 0, center.x - radius, height);
    if (center.x + radius < width)
      rect(center.x + radius, 0, width - center.x - radius, height);
    blendMode(MULTIPLY);
    imageMode(CENTER);
    image(darkning, center.x, center.y, 2 * radius, 2 * radius);
    popStyle();
  }
  
  float getDiameterRate() {
    return DiameterRate;
    
  }

  void update() {
    diameter-=getDiameterRate();
    diameter = constrain(diameter, 0, height*2);
    smoothedDiameter = 0.95 * smoothedDiameter + 0.05 * diameter;
    if ( smoothedDiameter<=70) {
      hud.setLives(hud.lives()-1);
      diameter = 2 * height;
    }
          //println(getDiameterRate());

  }

  void apply() {
    resetMatrix();
    apply(camera.asDisplay(player.position()), smoothedDiameter / 2);
  }
}