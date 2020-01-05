ArrayList<PVector> scale_leaf(float percent){
  ArrayList<PVector> scaled = new ArrayList();
  float sum_x = 0, sum_y = 0;
  boolean too_large = false;
  for (PVector v : leaf){
    v = PVector.mult(v, percent);
    if (v.x >= width - 50 || v.x <= 50 || v.y >= height - 50 || v.y <= 50){
      too_large = true;
    }
    scaled.add(v);
  }
  if (too_large){
    return leaf;
  }
  for (PVector v: scaled){
    sum_x+=v.x;
  }
  float dev_x = width/2 - (sum_x/leaf.size());
  float dev_y = 4 * height / 5 - highY(scaled);
  
  ArrayList<PVector> shifted = new ArrayList();
  for (PVector v: scaled){
    v = v.add(new PVector(dev_x, dev_y));
    shifted.add(v);
  }
  
  return shifted;
}

float highY(ArrayList<PVector> list){
  float highY = 0;
  for (PVector v : list){
    if (v.y > highY){
      highY = v.y;
    }
  }
  return highY;
}
