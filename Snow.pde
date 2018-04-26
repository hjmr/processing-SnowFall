class Snow {
    ArrayList snow;

    Snow() {
        snow = new ArrayList();
    }

    void checkFallen(SnowStack stack) {
        for( int i = 0 ; i < snow.size() ; i++ ) {
            SnowFlake s = (SnowFlake)snow.get(i);
            if( stack.checkFallen(s) ) {
                snow.remove(s);
                stack.add(s);
            }
        }
    }

    void newFlake(float interval) {
        if( random(interval) < 1.0 ) {
            snow.add(new SnowFlake());
        }
    }

    void draw() {
        for( int i = 0 ; i < snow.size() ; i++ ) {
            SnowFlake s = (SnowFlake)snow.get(i);
            s.move();
            s.draw();
        }
    }
}

