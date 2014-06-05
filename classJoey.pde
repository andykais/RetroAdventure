class Joey {
	PImage idle;
  PImage idler;
	PImage[] forwardWalk;
  PImage[] reverseWalk;
	PVector position;
	int imgNum;
  int moveCount = 0;
  boolean reverseDir = false;
  int change = 2;
  PImage background;

	Joey() {
		//initial position
		position = new PVector(10, 10);
		//loading the images for forward movement
    forwardWalk = new PImage[4];
    reverseWalk = new PImage[4];
    idle = loadImage("joeyoriginal.png");
    idler = loadImage("joeyoriginalr.png");
    //forwardImg[0] = loadImage("joeym0.png");
  	forwardWalk[0] = loadImage("joeym1.png");
    forwardWalk[1] = loadImage("joeym2.png");
    forwardWalk[2] = loadImage("joeym3.png");
    forwardWalk[3] = loadImage("joeym4.png");
    reverseWalk[0] = loadImage("joeymr1.png");
    reverseWalk[1] = loadImage("joeymr2.png");
    reverseWalk[2] = loadImage("joeymr3.png");
    reverseWalk[3] = loadImage("joeymr4.png");

  	imgNum = 0;
  	}
  	void render(char type) {
  		imageMode(CENTER);
      if (moveCount >= 16) {
        moveCount = 0;
      }
      if (type == 'i') {

        if (!reverseDir)
          image(idle, position.x, position.y);
        else
          image(idler, position.x, position.y);
      }
      //four total positions
      else if (type == 'm') {
        if (position.y < 259) {
          image(idle, position.x, position.y);
        }
        else if (isBetween(moveCount, 0, 4)) {
          image(forwardWalk[0], position.x, position.y);
        }
        else if (isBetween(moveCount, 4, 8)) {
          image(forwardWalk[1], position.x, position.y);
        }
        else if (isBetween(moveCount, 8, 12)) {
          image(forwardWalk[2], position.x, position.y);
        }
        else if (isBetween(moveCount, 12, 16)) {
          image(forwardWalk[3], position.x, position.y);
        }
        reverseDir = false;
      }
      else if (type == 'r') {
        if (position.y < 259) {
          image(idler, position.x, position.y);
        }
        else if (isBetween(moveCount, 0, 4)) {
          image(reverseWalk[0], position.x, position.y);
        }
        else if (isBetween(moveCount, 4, 8)) {
          image(reverseWalk[1], position.x, position.y);
        }
        else if (isBetween(moveCount, 8, 12)) {
          image(reverseWalk[2], position.x, position.y);
        }
        else if (isBetween(moveCount, 12, 16)) {
          image(reverseWalk[3], position.x, position.y);
        }
        reverseDir = true;
      }
	  	//image(forwardImg[imgNum], position.x, position.y);
  	}
  	void changePosition(float x, float y) {
  		//if (imgNum == 1) imgNum = 0;
  		//else imgNum ++;
      moveCount ++;
  		position.x = x;
  		position.y = y;
  	}
    boolean isBetween(int value, int smallest, int largest) {
      if (value >= smallest && value < largest)
        return true;
      return false;
    }
};
