class Joey {
	PImage idle;
  PImage idler;
	PImage[] forwardWalk;
  PImage[] reverseWalk;
	PVector position;
	int imgNum;
  int moveCount = 0;
  boolean reverseDir = false;
  int change = 24;

	Joey() {
		//initial position
		position = new PVector(10, 10);
		//loading the images for forward movement
    forwardWalk = new PImage[3];
    reverseWalk = new PImage[3];
    idle = loadImage("joeyoriginal.png");
    idler = loadImage("joeyoriginalr.png");
    //forwardImg[0] = loadImage("joeym0.png");
  	forwardWalk[0] = loadImage("joeym3.png");
  	forwardWalk[1] = loadImage("joeym1.png");
    forwardWalk[2] = loadImage("joeym2.png");
    reverseWalk[0] = loadImage("joeymr3.png");
    reverseWalk[1] = loadImage("joeymr1.png");
    reverseWalk[2] = loadImage("joeymr2.png");
  	imgNum = 0;
  	}
  	void render(char type) {
      println(moveCount);
  		imageMode(CENTER);
      if (type == 'i') {
        if (!reverseDir) {
          image(idle, position.x, position.y);
        }
        else {
          image(idler, position.x, position.y);
        }
      }
      //four total positions
      else if (type == 'm') {
        if (moveCount <= change) {
          image(forwardWalk[0], position.x, position.y);
        }
        else if (moveCount > change && moveCount <= change*2) {
          image(forwardWalk[1], position.x, position.y);
        }
        else if (moveCount > change*2 && moveCount <= change*3) {
          image(forwardWalk[2], position.x, position.y);
        }
        else {
          image(forwardWalk[1], position.x, position.y);
        }
        reverseDir = false;
      }
      else if (type == 'r') {
        if (moveCount < change) {
          image(reverseWalk[0], position.x, position.y);
        }
        else if (moveCount >= change && moveCount < change*2) {
          image(reverseWalk[1], position.x, position.y);
        }
        else if (moveCount >= change*2 && moveCount < change*3) {
          image(reverseWalk[2], position.x, position.y);
        }
        else {
          image(reverseWalk[1], position.x, position.y);
        }
        reverseDir = true;
      }
      if (moveCount >= change*4) {
        moveCount = 0;
      }
	  	//image(forwardImg[imgNum], position.x, position.y);
  	}
  	void changePosition(float x, float y) {
  		//if (imgNum == 1) imgNum = 0;
  		//else imgNum ++;
      moveCount += abs(position.x - x);
  		position.x = x;
  		position.y = y;
  	}
}
