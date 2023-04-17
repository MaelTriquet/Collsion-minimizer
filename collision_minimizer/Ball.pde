class Ball{
  PVector pos, vel;
  int max_hist;
  PVector[] pos_hist = new PVector[max_hist];
  float r;
  int isStable = 0;
  Ball(float x, float y, float r_) {
    pos = new PVector(x, y);
    r = r_;
    vel = new PVector(random(-1, 1), random(-1, 1));
  }
  
  void show() {
    fill(0, 255, 0);
    if (isStable > 0) {
      fill(255, 0, 0);
    }
    noStroke();
    circle(pos.x, pos.y, 2*r);
  }
  
  void update(int i) {
    PVector to_center = center.copy().sub(pos);
    vel.add(to_center.copy().mult(gravity));
    
    for (int j = i + 1; j < balls.size(); j++) {
      Ball collider = balls.get(j);
      PVector collision_vec = pos.copy().sub(collider.pos);
      float actual_dist = collision_vec.mag();
      float min_dist = r + collider.r;
      
      if (actual_dist < min_dist) {
        pos.add(collision_vec.copy().normalize().mult((r/min_dist) * (min_dist - actual_dist)));
        collider.pos.sub(collision_vec.copy().normalize().mult((collider.r/min_dist) * (min_dist - actual_dist)));
        isStable = 100;
        collider.isStable = 100;
      }
    }
    pos.add(vel);
  }
}
