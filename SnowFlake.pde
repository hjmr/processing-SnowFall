class SnowFlake {
    int MIN_RADIUS = 2;
    int MAX_RADIUS = 5;
  
    float MAX_HORIZONTAL_SPEED = 0.5;
  
    float MIN_FALL_SPEED = 1;
    float MAX_FALL_SPEED = 2;
  
    int MIN_INTERVAL =  50;
    int MAX_INTERVAL = 200;
  
    PVector p;
    PVector v;
    float r;
    int timeStep;
    int interval;
  
    SnowFlake() {
        timeStep = 0;
        p = new PVector(random(width), 0);
        v = new PVector(random(-MAX_HORIZONTAL_SPEED, MAX_HORIZONTAL_SPEED),
                        random(MIN_FALL_SPEED, MAX_FALL_SPEED));
        r  = random(MIN_RADIUS, MAX_RADIUS);
        interval = (int)(random(MIN_INTERVAL, MAX_INTERVAL));
    }

    void move() {
        timeStep++;
        p.add(v);
        while( p.x     < 0 ) { p.x += width; }
        while( width < p.x ) { p.x -= width; }
        if( timeStep % interval == 0 ) {
            v.x = random(-MAX_HORIZONTAL_SPEED, MAX_HORIZONTAL_SPEED);
        }
    }
  
    void draw() {
        noStroke();
        fill(255);
//        stroke(255);
//        fill(0);
        ellipse(p.x, p.y, r * 2, r * 2);
    }
}

