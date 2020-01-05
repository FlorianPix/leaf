class VeinTree{
  ArrayList<VeinTree> children;
  PVector co;
  float growthrate = 2;
  
  VeinTree(PVector co){
    this.co = co;
    this.children = new ArrayList();
  }
  
  VeinTree(PVector co, VeinTree child){
    this.co = co;
    this.children = new ArrayList();
    children.add(child);
  }
  
  VeinTree(PVector co, ArrayList<VeinTree> children){
    this.co = co;
    this.children = children;
  }
  
  ArrayList<VeinTree> getChildren(){
    return children;
  }
  
  void addChild(VeinTree child){
    children.add(child);
  }
  
  void setChildren(ArrayList<VeinTree> children){
    this.children = children;
  }
  
  void drawTree(float weight){
    stroke(0, 150, 50);
    fill(0, 150, 50);
    circle(co.x, co.y, weight);
    weight = weight - 0.01;
    if (weight < 0.2){
      weight = 0.2;
    }
    for (VeinTree child : children){
      
      child.drawTree(weight);
    }
  }
  
  void grow(ArrayList<Auxin> hormones){
    for (Auxin h : hormones){
      VeinTree t = this.closest(h);
      float x = (h.co.x - t.co.x);
      float y = (h.co.y - t.co.y);
      float r = sqrt(pow(x,2) + pow(y,2));
      x = x * growthrate / r + t.co.x;
      y = y * growthrate / r + t.co.y;
      t.addChild(new VeinTree(new PVector(x, y)));
    }
  }
  
  VeinTree closest(Auxin a){
    float dis = this.dis(a);
    VeinTree clos = this;
    ArrayList<VeinTree> childrenClos = new ArrayList();
    for (VeinTree t : this.children){
      childrenClos.add(t.closest(a));
    }
    for (VeinTree t: childrenClos){
      float childD = t.dis(a);
      if (t.dis(a) < dis){
        dis = childD;
        clos = t;
      }
    }
    return clos;
  }
  
  float dis(Auxin a){
    return PVector.dist(this.co, a.co);
  }
}
