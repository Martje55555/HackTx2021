library global;

bool isWhat = false;
String empty = "";
double light_year = 5879000000000;
String dropDownValue = 'Select';
String secdropDownValue = 'Select';
double SuntoMercury = 36000000;
double SuntoVenus = 67200000;
double SuntoEarth = 93000000;
double SuntoMars = 141600000;
double SuntoJupiter = 483600000;
double SuntoSaturn = 886700000;
double SuntoUranus = 1784000000;
double SuntoNeptune = 2794400000;
double distance1 = 0.0;
double distance2 = 0.0;
String urlfirst = '';
String urlsecond = '';
String url_sun =
      'https://pngimg.com/uploads/sun/sun_PNG13424.png';
String url_earth =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Earth_Western_Hemisphere_transparent_background.png/1200px-Earth_Western_Hemisphere_transparent_background.png';
String url_mercury = 
      'http://assets.stickpng.com/images/580b585b2edbce24c47b2709.png';
String url_venus =
      'https://image.pngaaa.com/733/143733-small.png';
String url_mars = 
      'https://pngimg.com/uploads/mars_planet/small/mars_planet_PNG1.png';

double totalDistance(double x, double y) {
  double result = 0;
  result = (x - y);
  result = result.abs();
  result /= light_year;

  return result;
}
