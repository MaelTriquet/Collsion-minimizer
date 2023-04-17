ArrayList<Ball> balls = new ArrayList<Ball>();
PVector center;
float gravity = .00005;
int times_per_frame = 1;
void setup() {
  size(800, 800);
  center = new PVector(width/2, height/2);
}

void draw() {
  background(0);
  for (int k = 0; k < times_per_frame; k++) {
    for (int i = 0; i < balls.size(); i++) {
      Ball b = balls.get(i);
      b.update(i);
      b.show();
      b.isStable--;
    }
  }
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, random(5, 35)));
}

void keyPressed() {
  if (key == '-') {
    if (times_per_frame > 1) {
      times_per_frame--;
    }
  } else if (key == '+') {
    times_per_frame++;
  }
}
