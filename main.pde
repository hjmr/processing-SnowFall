float SNOW_FALL_INTERVAL = 2;

Snow snow;
SnowStack stack;

void setup() {
    size(window.innerWidth - 10, window.innerHeight - 10);
//    size(400,400);
    frameRate(20);
    background(0);
    snow = new Snow();
    stack = new SnowStack();
}

void draw() {
    fadeToBlack();
    snow.draw();
    stack.draw();
  
    snow.newFlake(SNOW_FALL_INTERVAL);
    snow.checkFallen(stack);
}

void fadeToBlack() {
    fill(0,95);
    rectMode(CORNER);
    rect(0,0,width,height);
}

