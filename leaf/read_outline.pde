ArrayList<PVector> read_leaf_outline(){
  String text = "";
  try {
    String filePath = "";
    if (use_testPathFile){
      filePath = "C:\\Users\\Florian Pix\\Processing\\leaf\\leaf\\leaf_outline\\test.txt";
    } else {
      filePath = "C:\\Users\\Florian Pix\\Processing\\leaf\\leaf\\leaf_outline\\path.txt";
    }
    text = new String(Files.readAllBytes(Paths.get(filePath)));
  } catch (IOException e) {
    e.printStackTrace();
  }
  String[] lines = text.split("\n");
  ArrayList<PVector> vertices = new ArrayList();
  String x = "",y = "";
  for (String line : lines){
    String[] buff = line.split(" ");
    vertices.add(new PVector(float(buff[0]), float(buff[1])));
  }
  return vertices;
}
