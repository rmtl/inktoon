int i, j, k, l, p = 0;
String colorMode = "blue" ;
float r, g, bpix, opix = 0;
PImage img;
color blue = color(0, 0, 255), orange = color(255, 133, 0); 

void setup() {
  size( 600, 600 );
  smooth();
  img = loadImage( "background.png" );
  image(img, 0, 0);
}

void draw() {
  if(mousePressed == true) i++;
  else i = 0;
  displayColorRatio();
}

void mouseClicked() {

}

void mouseReleased(){
  pushMatrix();
  img = loadImage( "shiro.png" ); //900*900
  if (colorMode == "blue"){
    tint(blue);
  }
  else tint(orange);
  img.resize(i, i);
  translate(mouseX, mouseY);
  rotate(radians(random(360)));
  imageMode(CENTER);
  image(img, 0, 0);
  imageMode(CORNER);
  popMatrix();
}

void mouseDragged(){
}

void keyPressed() {
  if ( key == 'c' ) {
  noTint();
  img = loadImage( "background.png" );
  image(img, 0, 0);
  }
  if (key == 'o'){
    colorMode = "orange";
  }
  if (key == 'b'){
    colorMode = "blue";
  }
}

void displayColorRatio(){
    fill(255);
    strokeWeight(0);
    rect(0, 580, 600, 20);
    
    for(k=0; k<width; k++){
      for(l=0; l<height-20; l++){
         p = get(k,l);
         if(red(p) == 0 && green(p)== 0 && blue(p) > 240) bpix++;
         if(red(p) > 240 && green(p) > 130 && blue(p) == 0) opix++;
      }
    }
    
    bpix = bpix*100/width/height;
    opix = opix*100/width/height;
    fill(0);
    text("blue:" + nf(bpix, 0, 2) + "%  VS  orange:" + nf(opix, 0, 2) + "%", 0, 595);
}