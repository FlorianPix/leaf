ArrayList<PVector> leaf;
float a;
int counter;
boolean record, mouse, once = true;

void setup(){
  size(640,640);
  counter = 0;
  record = false;
  leaf = new ArrayList();
  mouse = true;
}

void mousePressed(){
  if (leaf.size() == 0){
    leaf.add(new PVector(width/2, mouseY));
    leaf.add(new PVector(width/2, mouseY));
  }
  int s = int(leaf.size()/2);
  leaf.add(s, new PVector(width - mouseX, mouseY));
  leaf.add(s, new PVector(mouseX, mouseY));
}

void keyPressed(){
  int s = int(leaf.size()/2);
  leaf.add(s, new PVector(width/2, mouseY));
  PrintWriter file;
  try {
    file = new PrintWriter("C:\\Users\\Florian Pix\\Processing\\leaf\\leaf\\leaf_outline\\test.txt");
    for (PVector v : leaf){
      file.println(v.x + " " + v.y);
    }
    file.close();
  } catch (Exception e){
    e.printStackTrace();
  }
}

void draw(){
  // ######## BEFORE ########
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  line(width/2, 0, width/2, height);
  
  // ####### MAIN ###########
  
  // Draw Leaf
  beginShape();
  for (PVector v : leaf){
    vertex(v.x, v.y);
  }
  endShape();
  
  // ########AFTER###########
  
  if (record){
    saveFrame("output/gif-" + counter + ".png");
  }
  counter++;
}
