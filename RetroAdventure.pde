PVector iPos;
int resolutionX = 480;
int resolutionY = 320;
float boundary = resolutionY-60;
PImage[] img = new PImage[3];
boolean keyUp = false;
boolean keyRight = false;
boolean keyLeft = false;
boolean keyDown = false;
Joey joey;
boolean still = true;
char movementType;
float change;
float y = 0;
float x = 0;
float speed = 0;
float gravity = 2;
float jumpResistance = 15;
float friction = 1.9;
float speedr = 0;
float speedl = 0;
boolean onFall = false;

void setup() {
  size(resolutionX, resolutionY);
  background(0);
  joey = new Joey();
  iPos = new PVector(resolutionX/2,30);
  
}

void draw() {
	frameRate(32);
  move();
  background(loadImage("Background.png"));
  if(keyRight)
    movementType = 'm';
  else if(keyLeft)
    movementType = 'r';
  else if (!keyLeft && !keyRight)
    movementType = 'i';
  joey.render(movementType);
  joey.changePosition(iPos.x, iPos.y);
}

void move() {
  //makes sure that key is an arrow key
  //if (keyPressed==true && key == CODED) {
    change = 10;
    if (keyLeft) {
      if (iPos.x>0) {
        speedl = 10;
        iPos.x -= speedl;
     }
    }
    if (!keyLeft && speedl > 0){
      iPos.x -= speedl;
      speedl -= friction;
    }
    if (keyRight) {
      if (iPos.x<resolutionX) {
      speedr = 10;
      iPos.x += speedr;
      }
    }
    if (!keyRight && speedr > 0 ) {
      iPos.x += speedr;
      speedr -= friction;
    }
    if (keyUp && iPos.y == boundary) {
      if (iPos.x<resolutionX+5) {
        speed = (-jumpResistance);
        iPos.y += speed;
      }
      //this is where the jump image goes
    }
    //this will change with gravity
    /*if (keyDown && iPos.y+40<boundary){iPos.y +=change;}*/
    if (iPos.y < boundary) {
      iPos.y += speed;
      speed += gravity;
    }
    else {
      iPos.y = boundary;
    }
    // if (speed == 0 && !onFall) {
    //   iPos.y = boundary;
    //   onFall = false;
    // }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyUp = true; 
    if (keyCode == DOWN) keyDown = true; 
    if (keyCode == LEFT) keyLeft = true; 
    if (keyCode == RIGHT) keyRight = true;
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP)   {keyUp = false; }
    if (keyCode == DOWN) {keyDown = false; }
    if (keyCode == LEFT) { keyLeft = false; still = true;}
    if (keyCode == RIGHT){ keyRight = false;still = true;}
  }
}
