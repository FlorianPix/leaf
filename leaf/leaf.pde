import java.nio.file.*;

ArrayList<PVector> leaf;
ArrayList<Auxin> hormones;
int spawnrate = 3;
VeinTree veinTree;
int total_frames = 640;
boolean use_testPathFile;

float a;
int counter;
boolean record;
float percent = 1.001;

void setup(){
  size(640,640);
  counter = 0;
  record = false;
  use_testPathFile = true;
  leaf = read_leaf_outline();
  veinTree = new VeinTree(new PVector(width/2, 4 * height / 5));
}

void draw(){
  // ######## BEFORE ########
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();
  
  if (counter >= total_frames){
    exit();
  }
  
  // ####### MAIN ###########
  // Draw Leaf
  beginShape();
  for (PVector v : leaf){
    vertex(v.x, v.y);
  }
  endShape();
  // Draw Hormones
  hormones = spawn(spawnrate);
  for (Auxin a : hormones){
    stroke(150, 0, 0);
    fill(150, 0, 50);
    circle(a.co.x, a.co.y, 5);
  }
  
  // Draw VeinTree
  veinTree.grow(hormones);
  veinTree.drawTree(2);
  
  
  // ########AFTER###########
  
  if (record){
    saveFrame("output/gif-" + counter + ".png");
  }
  leaf = scale_leaf(percent);
  counter++;
}
