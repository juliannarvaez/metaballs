Blob[] blobs = new Blob[10];
Blob[] blobs1 = new Blob[10];
PImage img;

void setup() {
  size(600, 800);
  img = loadImage("Desktop/check2.png");
  colorMode(RGB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
    blobs1[i] = new Blob(random(width), random(height));
  }
}

void draw() {
  //background(60, 199, 36);
  image(img,0,0);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      float sum1 = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
      }
      for (Blob b : blobs1) {
        float q = dist(x,y, b.pos.x, b.pos.y);
        sum1 += 10 * b.r / q;
      }
      
      if(sum<150) {
        pixels[index] = color(209,66,3);
      }
      if(sum>150&&sum<180) {
        //252, 186, 3
        float radd = map(sum,150,180,209,252); 
        float gadd = map(sum,150,180,66,6); 
        float badd = map(sum,150,180,3,6); 
        pixels[index] = color(radd,gadd,badd);
      }      
    }
  }
  updatePixels();
  
  for (Blob b : blobs) {
    b.update();
  }
  for (Blob b : blobs1) {
    b.update();
  }
  
  saveFrame();
  
}
