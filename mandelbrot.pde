// this is a project that plots the mandelbrot set using the escape time algorithm

int max_iterations = 1000;
float scale = (float).001;
float m_x;
float m_y;
double x0 = 0;
double y0 = 0;
double xz = 0;
double yz = 0;
void setup(){
  size(800, 600);
  m_x = width/2;
  m_y = height/2;
  plot();
}

void mousePressed(){
  m_x = mouseX;
  m_y = mouseY;
  xz = scale*(m_x-(width/2));
  yz = scale*(m_y-(height/2));
  scale /= 2;
  plot();
  //System.out.println(x0 + ", " + y0);
}

void draw(){
}

void plot(){
  for (float i = 0; i < height; i++) {
    //i = map(i, 0, height, 1, height-1);
    for (float j = 0; j < width; j++){
      double x2 = 0;
      double y2 = 0;
      // x0 and y0 form the complex number at the point (j, i)
      x0 = ((j - width/2.0)*4.0/width);
      y0 = ((i - height/2.0)*4.0/width);
      x0 += xz;
      y0 += yz;
      double x = 0;
      double y = 0;
      int k = 0; // the current number of iterations
      // the mandlebrot set lies within a circle of radius two
      while(x2 + y2 <= 4 && k < max_iterations){
        y = 2*x*y + y0;
        x = x2 - y2 + x0;
        x2 = x*x;
        y2 = y*y;
        k++;
      }
      if (k < max_iterations) set((int)j, (int)i, color(k));
      else set((int)j, (int)i, color(0));
    }
  }
}
