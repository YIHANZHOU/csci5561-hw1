import java.util.Iterator;
class system{
   ArrayList<particle> particles;
   float theta;
   PVector pos;
   PVector vel;
   int colorControl =0;
   PImage img;
   
  system(PVector v, PVector p){
    particles = new ArrayList<particle>();  
    pos=p;
    vel=v;
  }
    system(){
    particles = new ArrayList<particle>();  
    
  }
  
     system(PVector p){
    particles = new ArrayList<particle>();  
    pos=p;
  }
 system(PVector v, PImage img_) {
    particles = new ArrayList<particle>();              // Initialize the arraylist
    pos = v;                                   // Store the origin point
    img = img_;
  }
 void run(int mode){
    Iterator<particle> it = particles.iterator();
    while (it.hasNext()) {
      particle p = it.next();
      p.run(mode);
      if(p.dead()){
        it.remove();
      }
    }
  }
    void applyForce(PVector dir) {
    for (particle p : particles) {
      p.applyForce(dir);
    }
  }  
}

  
  
