PShape base;
PShape candles;
PShape match;


PVector pos=new PVector(400,300,0);
system fountain = new system();
system firework = new system();
system fire = new system();

system smoke = new system();
system cottoncandy = new system();

boolean showfirework = false;
int distance=2200;
public void settings() {
  size(800, 600, "processing.opengl.PGraphics3D");
}
void setup(){
  surface.setTitle("fountain");
  base = loadShape("fountain.obj");
  base.setFill(color(152,255,192));
  candles=loadShape("candles.obj");
  match= loadShape("Match_Created_By_Tyro_Smith.obj");
  candles.setFill(color(152,152,192));
  //dragon=loadShape("Predator_Solid_OBJ.obj");
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
 } else if(keyCode == UP){
     distance -= 200; 
 }   else if(keyCode == DOWN){
     distance += 200; 
 }else if(key == '5' && mode!=5){
     mode = 5; 
 } 
}
void mouseClicked(){
  showfirework = true;
}
void draw(){
    background(0);
     fill(255);
     textSize(20); 
     text ("Press 0 for Fountain, 1 for Firework, 5 for Bonus,3 for Smoke",0,50);
     if (mode==0){  //fountain
     camera (mouseX*3, -mouseY*4+1200,distance,400,300, 0, 0, 1, 0);
    

     float maxvelocity= 12; //max velocity
     textSize(50);
     text ("Press 0 for Fountain, 1 for Firework, 5 for Fire,3 for Smoke",0,-160);

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
    
    
       
        
 else if (mode== 1){ //fire work
       textSize(50);
       text ("Press 0 for Fountain, 1 for Firework, 2 for Fire, 3 for Smoke, 5 for bonus,",0,-160);//firework
        text ("Click to show fire work",0,-200);//firework

       camera (mouseX*3, -mouseY*4+1200,distance,400,300, 0, 0, 1, 0);
       PVector pos = new PVector(400, 1600, 0);   
       fill(111);
       text ("firework Frame rate: " + frameRate + " particleSize: " + firework.particles.size(), 0, -120);
       if (showfirework){  
          for(int j=0 ; j< 3000; j++){

            PVector vel = new PVector(0,-0.125,0);
            firework.particles.add(new particle(pos, vel,new PVector(0,0.005,0),255,200,0));  
             showfirework = false;              

          }
       }  
        firework.run(1);

     }            
  
   else if(mode ==5){// beautiful bonus 
   textSize(50);
       text ("Press 0 for Fountain, 1 for Firework, 2 for Fire, 3 for Smoke, 5 for bonus,",0,-160);//firework
       camera (mouseX*3, -mouseY*4+1200,distance-700,400,300, 0, 0, 1, 0);
       PVector pos = new PVector(400, 1000, 0);   
       fill(111);
       text ("Beatiful Bonus Frame rate: " + frameRate + " particleSize: " + cottoncandy.particles.size(), 0, -120);
       showfirework = true;

       if (showfirework){  
          for(int j=0 ; j< 100; j++){
            PVector vel = new PVector(0,-3,0);
            particle a =new particle(pos, vel,255,200,0);
            a.theta= 2 * PI * random(0, 1);
            a.s= 2 * PI * random(0, 1);
            cottoncandy.particles.add(a);  
          }
            showfirework = false;              
       }
       cottoncandy.run(5);

     }
   
   else if (mode==2){ //fire
       camera (400,  -mouseY*4+1200,1000,400,300, 0, 0, 1, 0);
     textSize(50);

       text ("Press 0 for Fountain, 1 for Firework, 2 for Fire, 3 for Smoke, 5 for bonus,",0,-160);//firework
    text ("Fire Frame rate: " + frameRate + " particleSize: " + fire.particles.size(), 0, -120);

     PImage pic = loadImage("Smoke.png");
     PVector pos=new PVector(width/2, height,0);
    float dx = map(0, 0, width, -2, 2)-random(0,1);
     float dy = -random(0.55,0.75);
     PVector force1 = new PVector(dx*0.03, dy*0.022-0.55, 0);
     PVector force2 = new PVector(dx*0.0325, dy*0.028-0.55 , 0);
     PVector force3 = new PVector(dx*0.035, dy-0.55*0.027-0.55 , 0);
     PVector force4 = new PVector(dx*0.0315, dy-0.55*0.025-0.55 , 0);

    for(int i=0; i<100; i++){
     PVector vel = new PVector(0, 0,0);
     pos = new PVector(400, 300, 0);
     particle c = new particle( new PVector(390,290,0), vel, 255,0,0);
     c.applyForce(force1);
          c.img=pic;

     fire.particles.add(c);
     
     particle a = new particle(new PVector(395,295,0), vel, 255,i*0.7,0);
     a.img=pic;
     a.applyForce(force2);
     fire.particles.add(a);
     particle b = new particle(pos, vel, 255,70+i*0.7,0);
     b.applyForce(force3);
               b.img=pic;

     fire.particles.add(b);
     
     particle d = new particle(new PVector(385,285,0), vel, 255,70+i*0.7,0);
     d.applyForce(force4);
      d.img=pic;

     fire.particles.add(d);
   }
     fire.run(2);
     lights();

   

   translate(width/2-3,height/2+10,70);
    rotate(PI);
    scale(100);
    shape(match,0,0);
  
   }
  
    
    if(mode==3){ //smoke   
    camera (400, 300,distance-1000,400,300, 0, 0, 1, 0);
    textSize(30);
       text ("Press 0 for Fountain, 1 for Firework, 2 for Fire, 3 for Smoke, 5 for bonus,",-50,-160);//firework
    text ("Smoke Frame rate: " + frameRate + " particleSize: " + smoke.particles.size(), 0, -120);
    PImage img = loadImage("Smoke.png");
     float dx = map(mouseX, 0, width, -2, 2);
     float dy = map(mouseY, 0, height, -2, 2);
     PVector force = new PVector(dx, dy , 0);
      for(int i=0; i<100; i++){
     PVector vel = new PVector(randomGaussian()*1.0, randomGaussian()*1.0,randomGaussian()*1.0);
     pos = new PVector(random(450,470), 500, 50);
     particle a = new particle(pos, vel, 250, 120, 250,17);
     a.acceleration=new PVector(0,0,0);
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

     text ("Press 0 for Fountain, 1 for Firework, 2 for Fire,3 for Smoke",0,0);
     text ("Snow Frame rate: " + frameRate + " particleSize: " + snow.particles.size(), 0, 20);
     for(int i=0 ; i< 300; i++){
      PVector pos = new PVector(random(-1600,1600), -200, random(-2000,2000));
      PVector vel =  new PVector(0,0.000000000001,0);
       PVector acc =  new PVector(0,0,0);

      snow.particles.add(new particle(pos,vel,acc,255,255,255));

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
