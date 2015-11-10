//declare variables
float [] x = new float[30];
float [] y = new float[30];
float [] velX = new float[30];
float [] velY = new float[30];
float gravity;
float diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for(int i = 0; i < 30; i++){
    x[i] = width/2;
    y[i] = height/2;
    velX[i] = random(-5,5);
    velY[i] = random(-5,5);
    gravity = 0.2;
    diam = 80;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
   for (int i = 0; i < 30; i++){
  //draw ball
    ellipse(x[i], y[i], diam, diam); 
    //add velocity to position
    velY[i] += gravity;
    x[i] += velX[i];
    y[i] += velY[i];
   
  
  //bounce ball if it hits walls
  if (x[i] + diam/2 >= width) {
    velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam/2 <= 0) {
    velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam/2 >= height) {
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  if (y[i] + diam/2 >= height) {
    y[i] = height - diam/2;
  }
 }
}