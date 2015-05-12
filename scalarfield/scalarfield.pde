float sigma = 0;
float dSigma = 0.0000001;
color[] palette = new color[256];

void setup()
{
  size(400,400);
  colorMode(HSB,255,255,255);
  for(int i=0; i < 255; i++)
  {
    palette[i] = color(i, 255, 255);
  }
}

void draw()
{
  loadPixels();
  float scale = 0.009;
  for(int x = 0; x < width; x++)
  for(int y = 0; y < height; y++)
  {{
    if(sigma == 1) {
      sigma = 0;
    } else {
      sigma += dSigma;
    }

    float ref_x = (x - (width/2)) * scale;
    float ref_y = (y - (height/2)) * scale;
    float calc = sin (TWO_PI * (ref_x * ref_y + sigma));
    calc = sin(HALF_PI*(ref_x*ref_y+sigma));
    int pal_index = int(map(calc, -1, 1, 0, 255));
    pixels[x + y * width] = palette[pal_index];
  }}
  updatePixels();
}
