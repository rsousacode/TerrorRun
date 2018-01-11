private class Rectangle {
  int x, y, w, h;
  Rectangle(StringDict obj) {
    this.x = int(obj.get("x"));
    this.y = int(obj.get("y"));
    this.w = int(obj.get("width"));
    this.h = int(obj.get("height"));
  }
}