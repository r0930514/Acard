class WeatherJson {
  final String rainyValue;
  final String temperature;
  final String weatherWx;
  final List locations;

  WeatherJson(
      {required this.rainyValue,
      required this.temperature,
      required this.weatherWx,
      required this.locations});

  factory WeatherJson.fromJson(Map<String, dynamic> weatherJsonData) {
    return WeatherJson(
        rainyValue: weatherJsonData['records']['locations'][0]['location'][6]
            ['weatherElement'][0]['time'][0]['elementValue'][0]['value'],
        temperature: weatherJsonData['records']['locations'][0]['location'][6]
            ['weatherElement'][3]['time'][0]['elementValue'][0]['value'],
        weatherWx: weatherJsonData['records']['locations'][0]['location'][6]
            ['weatherElement'][1]['time'][0]['elementValue'][0]['value'],
        locations: weatherJsonData['records']['locations'][0]['location']);
  }
}
