class Auxin{
  PVector co;
  
  Auxin(PVector co){
    this.co = co;
  }
  
  void drawAuxin(){
    circle(co.x, co.y, 4); 
  }
}

ArrayList<Auxin> spawn(int count){
  ArrayList<Auxin> hormones = new ArrayList();
  ArrayList<PVector> possiblePositions = possiblePositions();
  
  if (possiblePositions.size() > 0){
    for (int i = 0; i < count; i++){
      hormones.add(new Auxin(possiblePositions.remove(int(random(0, possiblePositions.size())))));
    }
  }
  return hormones;
}

ArrayList<PVector> possiblePositions(){
  ArrayList<PVector> allPositions = new ArrayList();
  for (float x = 5; x < width; x+= 5){
    for (float y = 5; y < height; y+= 5){
      allPositions.add(new PVector(x, y));
    }
  }
  ArrayList<PVector> kill = new ArrayList();
  for (PVector v: allPositions){
    if (!withinHull(v)){
      kill.add(v);
    }
  }
  for (PVector v: kill){
    allPositions.remove(v);
  }
  return allPositions; 
}

boolean withinHull(PVector test){
  boolean result = false;
  int i;
  int j;
  for (i = 0, j = leaf.size() - 1; i < leaf.size(); j = i++) {
        if ((leaf.get(i).y > test.y) != (leaf.get(j).y > test.y) &&
            (test.x < (leaf.get(j).x - leaf.get(i).x) * (test.y - leaf.get(i).y) / (leaf.get(j).y-leaf.get(i).y) + leaf.get(i).x)) {
          result = !result;
      }
  }
  return result;
}
