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
  float theta;
  float s;
  PImage img;
  PVector center;// THE CENTER OF THE FIREWORK
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
  void update2(){ //fire
    velocity.add(acceleration);
      position.add(velocity);
      lifeSpan -=20;
    }
  
   void update3() { //smoke
      velocity.add(acceleration);
      position.add(velocity);      
      lifeSpan = lifeSpan -cut;        
  }
   void update5(){  //bonus senery
     velocity.add(acceleration);
     position.add(velocity);
     if (lifeSpan< 245){
        // If the particle is within radius 20
        float xV = 90 * sin(theta) * cos(s);
        float zV = 90 * sin(theta) * sin(s);
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
  void update1(){  //firework
     velocity.add(acceleration);
     position.add(velocity);
     
     if (lifeSpan< 240 && foredead ==false){
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
        position=new PVector(position.x,position.y,position.z);
        center = new PVector(position.x,position.y,position.z);
        velocity = new PVector(xV*0.2,yV*0.2, zV*0.2);
        acceleration = new PVector(0,0.005,0);
        velocity.add(acceleration);
        position.add(velocity);
        foredead=true;
      }           
   }
   
        lifeSpan = lifeSpan - 5; 
    if(foredead){
     
          R+=25*random(-2,2);
          G+=25*random(-2,2);
          B+=255*random(0,2);
      }
     
  }
 void update4(){
       if(position.y >= 60000) {  
      position.y= 60000;}
      else{
      velocity.add(acceleration);
      position.add(velocity); 
   
      }
 }
  
void render() {
    imageMode(CENTER);
    image(img, position.x, position.y);
    tint(R,G,B,lifeSpan);
  }

void run(int mode){
    if(mode==2){
      update2();
      display();
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
    else if(mode==5){
      update5();
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
    void display2(){
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
