class particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float radius = 10;
  float lifeSpan = 255;
  float cut;
  float R;
  float G;
  float B;
  PImage img;
public boolean foredead = false;

  particle(PVector pos, PVector vel, float r, float g, float b) {
    position = pos;
    velocity = vel;
    R = r;
    G = g;
    B = b;
    cut = 3.2;
    acceleration = new PVector(0,0.55,0);
  }
    particle(PVector pos, PVector vel, float r, float g, float b,float t) {
    position = pos;
    velocity = vel;
    R = r;
    G = g;
    B = b;
    cut = t;
    acceleration = new PVector(0,0.55,0);
  }
  particle(PVector pos, PVector vel,PVector acc, float r, float g, float b) {
    position = pos;
    velocity = vel;
    R = r;
    G = g;
    B = b;
    acceleration = acc;
    
  }
  // particle(PVector l, PImage img_) {
  //  acceleration = new PVector(0, 0, 0);
  //  float vx = randomGaussian()*0.3;
  //  float vy = randomGaussian()*0.3 - 1.0;
  //  velocity = new PVector(vx, vy, 0);
  //  position = l.copy();
  //  lifeSpan = 100.0;
  //  img = img_;
  //}
  
  void update0(){
    if(position.y + radius >= 600) {  
      velocity.y *= -0.5; 
      position.y= 600-radius;
      velocity.add(acceleration);
      position.add(velocity);
      lifeSpan -= 2.0;
    }
    
    else {
      velocity.add(acceleration);
      position.add(velocity);
    }
    lifeSpan -= 2.0;
  }  
  void update2(){
    velocity.add(acceleration);
      position.add(velocity);}
  
   void update3() { //smoke
      velocity.add(acceleration);
      position.add(velocity);      
      lifeSpan = lifeSpan -cut;        
  }
   void update1(){  //firework
     velocity.add(acceleration);
     position.add(velocity);
     if (lifeSpan< 245){
        float theta = 2 * PI * random(0, 1);
        float s = 2 * PI * random(0, 1);  
        // If the particle is within radius 20
        float xV = 90 * sin(theta) * cos(s);
        float zV = 90 * cos(theta);
        float yV = sqrt(8100 - sq(xV) - sq(zV));  
      
        if(!Float.isNaN(yV)){
          if(random(0,1) >= 0.5){
           yV *= -1;
          } 
        position = new PVector(position.x,position.y,0);
        velocity = new PVector(xV*0.2,yV*0.2, zV*0.2);
        acceleration = new PVector(0,0,0);
        velocity.add(acceleration);
        position.add(velocity);
      }           
   }
   
    lifeSpan = lifeSpan - 2; 
   if(random(0,1)>0.8){
          R=255*random(0,1);
          G=255*random(0,1);
          B=255*random(0,1);
      }    
  }
 void update4(){
       if(position.y + radius >= 3000) {  
      position.y= 3000-radius;}
      else{
      velocity.add(acceleration);
      position.add(velocity); 
   
      }
 }
  
void render() {
    imageMode(CENTER);
    image(img, position.x, position.y);
    tint(R,G,B,128);
  }

void run(int mode){
    if(mode==2){
      update2();
      render();
    } else if (mode==0){
    update0();  
    display();}
    else if (mode==1){
      update1();
      display();
    
  }else if(mode==3){
    update3();
    render();}
    else if(mode==4){
      update4();
      display();
    }
}
  void display(){
    stroke(R, G, B, lifeSpan);
    fill(R, G, B,lifeSpan);
    beginShape();      
    vertex(position.x, position.y - radius, position.z);
    vertex(position.x - radius / 2, position.y, position.z);
     vertex(position.x, position.y+radius, position.z );

    vertex(position.x + radius / 2, position.y, position.z );

    endShape();
  }

  boolean dead() {
    if(lifeSpan <= 0){
    return true;}
    return false; 
  }
  
  void setAcc(PVector acc) {
    acceleration = acc;
  }
  
  
  
  
   void applyForce(PVector force) {
    acceleration.add(force);
  }  
  
  
}
