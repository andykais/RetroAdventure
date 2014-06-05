PVector iPos;
int resolutionX = 480;
int resolutionY = 320;
float boundary = resolutionY-60;
boolean keyUp = false;
boolean keyRight = false;
boolean keyLeft = false;
boolean keyDown = false;
boolean keyShift = false;
int tapCount = 0;
boolean startCount = false;
Joey joey;
char movementType;
float speed = 0;
float gravity = 2;          //constants
float jumpResistance = 15;  //constants
float friction = 1.9;       //constants
float speedr = 0;
float speedl = 0;

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

  if(!keyLeft && !keyRight)
    movementType = 'i';
  else if(keyLeft)
    movementType = 'r';
  else if (keyRight)
    movementType = 'm';
  joey.render(movementType);
  joey.changePosition(iPos.x, iPos.y);
}

void move() {
  //makes sure that key is an arrow key
  //if (keyPressed==true && key == CODED) {

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
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT){keyShift = true; keyRight = false; keyLeft = false;}
    if (!keyShift) {
      if (keyCode == UP)   {keyUp = true;} 
      if (keyCode == DOWN) {keyDown = true;} 
      if (keyCode == LEFT) {keyLeft = true;}
      if (keyCode == RIGHT){keyRight = true;}
    }
      
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP)   {keyUp = false;}
    if (keyCode == DOWN) {keyDown = false;}
    if (keyCode == LEFT) {keyLeft = false;}
    if (keyCode == RIGHT){keyRight = false;}
    if (keyCode == SHIFT){keyShift = false;}
  }
}
