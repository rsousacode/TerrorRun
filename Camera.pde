class Camera {
  private final PVector positionInDisplay;
  private PVector position;
  private final float followMargin = 100.0;

  Camera(PVector position) {
    positionInDisplay = new PVector(width / 2, height / 2);
    this.position = position.copy();
  }

  void reset() {
    position.add(PVector.sub(player.position(), position).mult(0.05));
  }

  void update() {
    PVector playerPosition = player.position();
    if (position.x > playerPosition.x + followMargin)
      position.x = playerPosition.x + followMargin;
    else if (position.x < playerPosition.x - followMargin)
      position.x = playerPosition.x - followMargin;
    if (position.y > playerPosition.y + followMargin)
      position.y = playerPosition.y + followMargin;
    else if (position.y < playerPosition.y - followMargin)
      position.y = playerPosition.y - followMargin;
  }

  void apply() {
    PVector originInWorld = originInWorld();
    translate(-originInWorld.x, -originInWorld.y);
  }

  PVector originInWorld() {
    return PVector.sub(position, positionInDisplay);
  }

  PVector asWorld(PVector display) {
    return PVector.add(display, originInWorld());
  }

  // Not correct. Should account for rotation.
  PVector asDisplay(PVector world) {
    return PVector.sub(world, originInWorld());
  }

  PVector mouseInDisplay() {
    return new PVector(mouseX, mouseY);
  }

  PVector mouse() {
    return asWorld(mouseInDisplay());
  }
}