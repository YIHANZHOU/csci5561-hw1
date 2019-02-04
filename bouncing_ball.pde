//Global variables
PVector acceleration=new PVector(0,0.95);
PVector velocity=new PVector(3,0);
PVector location=new PVector(100,100);
float radius = 30;

void setup(){
  size(800, 600, P3D);
  surface.setTitle("Bouncing ball");
}


void draw(){

 background(0);
 if(mousePressed) {
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
  } else {
    ortho(-width/2, width/2, -height/2, height/2);
  }
 fill(134,198,255);//volot of the fill 
 shininess(100);
 noStroke();
 setupLights();
 translate(location.x, location.y, 0); 
 sphere(radius);
 update();

}

void setupLights(){
 ambientLight(120,120,120);
 lightSpecular(130,130,250);
 directionalLight(600,650,90,1,-1,0);
}

void update(){
  
    velocity.add(acceleration);
    location.add(velocity);

   //Check if Ball is out off bound
   if((location.x - radius) >= width){
      location.x = -80;   
   }
   if((location.y + radius) >height && velocity.y>0) { 
      velocity.y *= -0.98;
      location.y =height-radius;
   }
   
}
