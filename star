float startcount;
float tilewide1;
float tilewide2 = 100;
float tilehight;
float endsize1 = 160;
float endsize2 = 280;
float endoffset = 30;

int tilecountX = 4;
int tilecountY = 4;

void setup(){
  size(800,800);
  
  noFill();
  stroke(#f0768b);
  strokeWeight(2);
  tilewide1 = width/tilecountX;
  tilehight = height/tilecountY;
}

void draw(){
  background(#ffc0cb);
  push();
  play(width/2/2, height/2/2);
  pop();
  
  push();
  play((width*2/3)+70, (height*2/3)+60);
  pop();
  
  push();
  play(width/2/2, (height*2/3)+60);
  pop();
  
  push();
  play((width*2/3)+70, height/2/2);
  pop();
  }

void play(float xzhou, float yzhou){
  randomSeed(0);
  translate(xzhou,yzhou);
  endsize1 = map(mouseX,0,max(width,mouseX), tilewide1/2,0);
  endsize2 = map(mouseX,0,max(width,mouseX), tilewide2/2,0);
  endoffset = map(mouseY,0,max(height,mouseY), -100,(tilewide2-endsize2));
  startcount = (mouseX+mouseY)/100 + 1;
 
  int angle = int(random(0,4));
  if(angle == 0) rotate(-HALF_PI);
  if(angle == 1) rotate(0);
  if(angle == 2) rotate(HALF_PI);
  if(angle == 4) rotate(PI);
  
  for(int i = 0;i< startcount; i++ ){
    float set1 = map(i,0,startcount,tilewide1,endsize1);
    float set2 = map(i,0,startcount,tilewide2,endsize2);
    float difficen = map(i,0,startcount,0,endoffset);
  rotate(frameCount / -1000.0);
  star(difficen,0,set1,set2,5);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  //this method is from processing.org
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
