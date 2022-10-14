Cat[] cats;
boolean repel = false;

void setup() {
  size(1280, 720);
  cats = new Cat[100];
  for (int i = 0; i < cats.length; i++) {
    cats[i] = new Cat();
  }
}

void draw() {
  background(220,220,220);
  for (int i = 0; i < cats.length; i++) {
    cats[i].move();
    cats[i].show();
  }
}

void mousePressed() {
  repel = !repel;
}

class Cat {
  int x, y;
  color myColor;
  
  Cat() {
    x = (int)(Math.random()*width);
    y = (int)(Math.random()*height);
    myColor = color((int)(Math.random()*128)+128, (int)(Math.random()*128)+128, (int)(Math.random()*128)+128);
  }
  
  void move() {
    x+=(int)(Math.random()*13)-6;
    y+=(int)(Math.random()*13)-6;
    if (repel) {
      x+=(int)(10*(x-mouseX)/width);
      y+=(int)(10*(y-mouseY)/height);
    } else {
      x-=(int)(10*(x-mouseX)/width);
      y-=(int)(10*(y-mouseY)/height);
    }
  }
  
  void show() {
    fill(myColor);
    
    beginShape(); //left ear
    vertex(x-15, y);
    vertex(x-22, y-22);
    vertex(x-2, y-12);
    endShape();
    
    beginShape(); //right ear
    vertex(x+15, y);
    vertex(x+22, y-22);
    vertex(x+2, y-12);
    endShape();
    
    ellipse(x,y,30,30);
    
    textAlign(CENTER, CENTER);
    fill(0,0,0);
    textSize(15);
    text(">0.0<", x-50, y-20, 100, 40);
  }
}
