PVector location;
PVector vel;
PVector acc;
float mass; 
float x;
float m;
float y;


class Mover {
  PVector location;
  PVector vel;
  PVector acc; 
  float mass;  

Mover(float m, float x, float y) {
  
  location = new PVector(x,y);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
  mass = m;
  
  }  
  
  void ud() {
  vel.add(acc);
  location.add(vel);
  acc.mult(0);
  println (location.x, location.y);
  
}

void disp() {
  circle(location.x, location.y, mass*16); 
  fill(255);
  stroke(255);
}

void applyForce(PVector force) {
  PVector f = PVector.div(force,mass);
  acc.add(f);
}

void CE() {
  if (location.x < 0+x) {
    location.x = 0;
    vel.x = vel.x*-0.9;
  } else if (location.x > width-x) {
    location.x = width-x;
    vel.x = vel.x*-1;
    color(random(1,255), random(1,255),random(1,255));
  }
  
  if (location.y < 0) {
    location.y = 0;
    vel.y = vel.y*-1;
  } else if (location.y > height+y) {
    location.y = height-y;
    vel.y = vel.y*-1;
    
    
    }
  }
    
}


Mover[] movers = new Mover[10]; 

void setup() {
  size(600,600);
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(10,500),10);
  }
}

void draw() {
  
  background(0);
  PVector wind = new PVector(0.01,0);
  PVector gra = new PVector(0,0.982);
  
  for (int i = 0; i < movers.length; i++) {
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gra); 
    movers[i].ud();
    movers[i].disp();
    movers[i].CE();    
    
    
  }
}
  
  
  
