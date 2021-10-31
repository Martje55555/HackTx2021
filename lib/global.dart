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
String url_sun =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9tBOxVKudwCNBvFdMFNVucgQrvIk-aN0VUQ&usqp=CAU';

double totalDistance(double x, double y) {
  double result = 0;
  result = (x - y);
  result = result.abs();
  result /= light_year;

  return result;
}
