PShape base;
PShape candles;

PVector pos=new PVector(400,300,0);
system fountain = new system();
system firework = new system();
system fire = new system();
system smoke = new system();
boolean showfirework = false;

public void settings() {
  size(800, 600, "processing.opengl.PGraphics3D");
}
void setup(){
  surface.setTitle("fountain");
  base = loadShape("fountain.obj");
  base.setFill(color(152,255,192));
  candles=loadShape("candles.obj");
  candles.setFill(color(152,152,192));
  frameRate(32);
}
int mode=100;
void keyPressed(){
  if(key == '0' && mode!=0){
     mode = 0; 
 } else if(key == '1' && mode!= 1){
     mode = 1;
 } else if(key == '2' && mode!=2){
     mode = 2; 
 } else if(key == '3' && mode!=3){
     mode = 3; 
 }else if(key == '4' && mode!=4){
     mode = 4; 
 }
}
void draw(){
    background(0);
     fill(255);
     textSize(20); 
     text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",30,300);
     if (mode==0){  //fountain
     camera (mouseX*3, -mouseY*4+1200,2200,400,300, 0, 0, 1, 0);

     float maxvelocity= 12; //max velocity
     textSize(50);
     text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",0,-160);

     text ("Water Foutain Frame rate: " + frameRate + " particleSize: " + fountain.particles.size(), 0, -120);

     fill(255, 255, 255, 150);
     for(int i=0 ; i< 50; i++){
     float temp = maxvelocity* random(0.6,1);
     float vy=-15;
     float zone=40;

            float theta = 2* PI/50*i;
            float px = zone* cos(theta);
            float pz = zone* sin (theta);
            float vx = temp * cos(theta);
            float vz = temp * sin(theta);
            
      PVector pos = new PVector(400+px, 300, 0+pz);

      PVector vel =  new PVector(vx,vy*random(0.8,0.9),vz);
           fountain.particles.add(new particle(pos, vel,200,255*random(0.2,0.6),255*random(0.6,1)));
    }
    fountain.run(mode);
    lights();
    translate(width/2,height/2);
    scale(3);
    shape(base,0,0);
  }
    
    
       
        
 else if (mode== 1){ 
           textSize(50);
       text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",0,-160);//firework
       camera (mouseX*3, -mouseY*4+1200,2200,400,300, 0, 0, 1, 0);
       PVector pos = new PVector(400, 1000, 0);   
       fill(111);
       text ("firework Frame rate: " + frameRate + " particleSize: " + fountain.particles.size(), 0, -120);
       showfirework = true;
       if (showfirework){  
          for(int j=0 ; j< 100; j++){
            PVector vel = new PVector(0,-3,0);
            firework.particles.add(new particle(pos, vel,255,200,0));  
          }
            firework.run(1);
            showfirework = false;              
       }   
     }
   
   
   
   
   
   
   
   
   
   else if(mode ==2){//fire
       camera (400, 300,600,400,300, 0, 0, 1, 0);

      textSize(50);
     text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",0,-160);
    text ("Fire Frame rate: " + frameRate + " particleSize: " + fountain.particles.size(), 0, -120);

     PImage pic = loadImage("fire.png");
     //image(pic, 0, 0);
     //tint(0, 255, 0, 0);
     PVector pos=new PVector(width/2, height,0);
     system fire = new system(pos);
     float dx = map(mouseX, 0, width, -8, 8);
          float dy = -1;
      float dz = map(mouseY, 0, height, -8, 8);

    PVector force = new PVector(0, dy , 0);
     for(int i=0; i<10; i++){
     PVector vel = new PVector(randomGaussian()*1.0, randomGaussian()*3.0,-randomGaussian()*1.0);
     pos = new PVector(400, 300, 0);
     particle a = new particle(pos, vel, 255,i*10, 0,17);
     a.img=pic;
     a.applyForce(force);
     fire.particles.add(a);}
     fire.run(2);

   

    //    translate(width/2,height*2);
    //scale(3);
    //rotate(PI);
    //shape(candles,0,0);
  }

  
    
    if(mode==3){ //smoke   
    camera (400, 300,1000,400,300, 0, 0, 1, 0);
    textSize(50);
    text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",0,-160);
    text ("smoke Frame rate: " + frameRate + " particleSize: " + fountain.particles.size(), 0, -120);
    PImage img = loadImage("Smoke.png");
     float dx = map(mouseX, 0, width, -2, 2);
     float dy = map(mouseY, 0, height, -2, 2);
     PVector force = new PVector(dx, dy , 0);
      for(int i=0; i<10; i++){
     PVector vel = new PVector(randomGaussian()*1.0, randomGaussian()*1.0,randomGaussian()*1.0);
     pos = new PVector(600, 500, 50);
     particle a = new particle(pos, vel, 250, 250, 100,17);
     a.img=img;
     a.applyForce(force);
     smoke.particles.add(a);
 }
           smoke.run(3);

      drawVector(force, new PVector(width/2, 50, 0), 500);
    }
     
     
     
     
     
     
     
     
     
     if(mode==4){ //snow   
         camera (400, 300,2000,400,300, 0, 0, 1, 0);

     system snow= new system(new PVector(0,0,0));

     text ("Press 0 for fountain, 1 for firework, 2 for fire,3 for smoke",0,0);
     text ("smoke Frame rate: " + frameRate + " particleSize: " + snow.particles.size(), 0, 20);
     for(int i=0 ; i< 30; i++){
      PVector pos = new PVector(random(0,800), 200, random(0,800));
      PVector vel =  new PVector(0,0,0);
       PVector acc =  new PVector(0,0.0006,0);

      snow.particles.add(new particle(pos, vel,acc,255,255,255));

    }
      snow.run(mode);

     }
}
    
void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to position to render vector
  translate(loc.x, loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();
}
