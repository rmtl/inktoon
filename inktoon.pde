int i, j, k, l, p = 0;
String colorMode = "blue" ;
float r, g, bpix, opix = 0;
PImage img;
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color green = color(0, 255, 0);

int t = 0; //for test

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
  img = loadImage( "shiro.png" ); //500*500
  if (colorMode == "blue"){
    tint(blue);
  }
  else tint(255,165,0);
  img.resize(i, i);
  translate(mouseX-i/2, mouseY-i/2);
  rotate(radians(t));
  image(img, 0, 0);
  popMatrix();
 
 t += 90;
}

void mouseDragged(){
  //stroke( #0000ff ); //blue
  //strokeWeight( 5 ); //point size
  //point( mouseX, mouseY ); 
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
         if(red(p) == 0 && green(p)== 0 && blue(p) == 114) bpix++;
         if(red(p) == 45 && green(p)== 138 && blue(p) == 0) opix++;
      }
    }
    
    bpix = bpix*100/width/height;
    opix = opix*100/width/height;
    fill(0);
    text("blue:" + nf(bpix, 0, 2) + "%  VS  orange:" + nf(opix, 0, 2) + "%", 0, 595);
}