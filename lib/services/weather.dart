import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'f4057107ca9dcc307b9b8377dd2ee2d2';
const apiServer = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper network = NetworkHelper(
      url: '$apiServer?q=$cityName&appid=$apiKey&units=metric',
    );
    return await network.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location geoLoactor = Location();
    await geoLoactor.getLocation();

    NetworkHelper network = NetworkHelper(
      url:
          '$apiServer?lat=${geoLoactor.latitude}&lon=${geoLoactor.longitude}&appid=$apiKey&units=metric',
    );
    return await network.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
