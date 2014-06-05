// command for linux terminal
//./processing-java --sketch=/home/andrew/Dropbox/Processing/alex --output=/home/andrew/Downloads/tmp --force --run


PVector iPos;
int resolutionX = 800;
int resolutionY = 450;
float boundary = resolutionY-50;
PImage[] img = new PImage[3];
boolean keyUp = false;
boolean keyRight = false;
boolean keyLeft = false;
boolean keyDown = false;
Joey joey;
boolean still = true;
char movementType;
float change;

void setup() {
  size(resolutionX, resolutionY);
  background(0);
  joey = new Joey();
  iPos = new PVector(resolutionX/2,30);
}

void draw() {
	frameRate(24);
  move();
  background(0);
  if(keyRight)
    movementType = 'm';
  else if(keyLeft)
    movementType = 'r';
  else if (still)
    movementType = 'i';
  joey.render(movementType);
  joey.changePosition(iPos.x, iPos.y);
}

void move() {
  //makes sure that key is an arrow key
  //if (keyPressed==true && key == CODED) {
    change = 6;
    if (keyLeft) {
      if (iPos.x>0) {iPos.x -=change;}
    }
    if (keyRight) {
      if (iPos.x<resolutionX) {iPos.x +=change;}
    }
    if (keyUp && iPos.y>0) {
      if (iPos.x<resolutionX) {iPos.y -=change;}
      //this is where the jump image goes
    }
    //this will change with gravity
    if (keyDown && iPos.y+20<boundary)    {iPos.y +=change;}
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
    if (keyCode == UP) {keyUp = false; }
    if (keyCode == DOWN) {keyDown = false; }
    if (keyCode == LEFT) { keyLeft = false; still = true;}
    if (keyCode == RIGHT) { keyRight = false;still = true;}
  }
}
