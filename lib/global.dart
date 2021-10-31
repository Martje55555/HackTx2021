library global;

import 'dart:math';

//import 'dart:math';

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
String url_sun = 'https://pngimg.com/uploads/sun/sun_PNG13424.png';
String url_earth =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Earth_Western_Hemisphere_transparent_background.png/1200px-Earth_Western_Hemisphere_transparent_background.png';
String url_mercury =
    'http://assets.stickpng.com/images/580b585b2edbce24c47b2709.png';
String url_venus =
    'https://png2.cleanpng.com/sh/077392e99614b6ca9add0293b31d1d9b/L0KzQYi4UsEzN2Q3e5GAYUOzR4fqVPE4PZNnUZC7N0e1Qoi9WcE2OWQ2SqcAN0K5SIa8TwBvbz==/5a3076c4a75bb9.2772276915131255726855.png';
String url_mars =
    'https://pngimg.com/uploads/mars_planet/small/mars_planet_PNG1.png';
String url_jupiter =
    'https://www.pngkey.com/png/full/178-1788130_jupiter-childrens-encyclopedia-of-space-book.png';
String url_saturn =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Saturn_from_Hubble.png/1200px-Saturn_from_Hubble.png';
String url_uranus =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Uranus2-transparent.png/900px-Uranus2-transparent.png';
String url_neptune =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/3D_Neptune.png/243px-3D_Neptune.png';

double totalDistance(double x, double y) {
  double result = 0;
  result = (x - y);
  result = result.abs();
  result /= light_year;

  return result;
}
