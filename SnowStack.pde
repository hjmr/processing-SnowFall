class SnowStack {
    ArrayList stack;
  
    SnowStack() {
        stack = new ArrayList();
        for( int i = 0 ; i < width / 5 ; i++ ) {
            stack.add(new PVector(i * 5, height));
        }
        stack.add(new PVector(width, height));
    }

    boolean checkFallen(SnowFlake s) {
        boolean yn = false;
        for(int i = 0 ; i < stack.size() - 1 ; i++ ) {
            PVector p1 = (PVector)stack.get(i    );
            PVector p2 = (PVector)stack.get(i + 1);
            float d = p1.dist(p2);
            if( p1.dist(s.p) < d && p2.dist(s.p) < d ) {
                float S = triangleArea(p1, p2, s.p);
                float h = 2 * S / p1.dist(p2);
                if( h < s.r ) {
                    yn = true;
                }
            }
        }
        return yn;
    }

    float triangleArea(PVector p1, PVector p2, PVector p3) {
        float a = p1.dist(p2);
        float b = p2.dist(p3);
        float c = p3.dist(p1);
        float s = (a + b + c) / 2.0;
        return sqrt(s * (s - a) * (s - b) * (s - c));
    }

    void add(SnowFlake s) {
        for(int i = 0 ; i < stack.size() - 1 ; i++ ) {
            PVector p1 = (PVector)stack.get(i    );
            PVector p2 = (PVector)stack.get(i + 1);
            float d = p1.dist(p2);
            if( p1.dist(s.p) < d && p2.dist(s.p) < d ) {
                float r = p1.dist(s.p) / (p1.dist(s.p) + p2.dist(s.p));
                p1.y -= s.r * (1 - r);
                p2.y -= s.r * r;
            }
        }

        for(int i = 0 ; i < stack.size() - 1 ; i++ ) {
            PVector p1 = (PVector)stack.get(i    );
            PVector p2 = (PVector)stack.get(i + 1);
            float h = abs(p1.y - p2.y);
            float w = abs(p1.x - p2.x);
            if( w * 1.3 < h ) {
                p1.y = (p1.y + p2.y) / 2.0;
                p2.y = p1.y;
            }
        }
    }
  
    void draw() {
        noStroke();
        fill(255);
        for( int i = 0 ; i < stack.size() - 1 ; i++ ) {
            PVector p1 = (PVector)stack.get(i    );
            PVector p2 = (PVector)stack.get(i + 1);
            quad(p1.x, p1.y, p1.x, height, p2.x + 1, height, p2.x + 1, p2.y);
        }
    }
}
