abstract class GameObject {

  private PVector position;

  GameObject(PVector position) {
    this.position = position.copy();
  }

  GameObject(float x, float y) {
    this.position = new PVector(x, y);
  }

  PVector position() {
    return position.copy();
  }

  void setPositionXTo(float x) {
    position.x = x;
  }

  void setPositionYTo(float y) {
    position.y = y;
  }

  void moveBy(PVector displacement) {
    position.add(displacement);
  }

  void moveBy(float dx, float dy) {
    position.add(dx, dy);
  }

  abstract void update();

  void display() {
    pushMatrix();
    translate(position.x, position.y);

    pushStyle();

    draw();

    popStyle();

    popMatrix();
  }

  abstract void draw();
}