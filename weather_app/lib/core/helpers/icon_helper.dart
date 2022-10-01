import 'package:weather_app/core/enums.dart';

String? dayIconPath(String condition) {
  if (condition == DayCondition.blizzard.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == DayCondition.blowingsnow.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == DayCondition.cloudy.name) {
    return weatherIconAssetPath('cloudy');
  }
  if (condition == DayCondition.fog.name) {
    return weatherIconAssetPath('fog');
  }
  if (condition == DayCondition.freezingdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == DayCondition.freezingfog.name) {
    return weatherIconAssetPath('fog');
  }
  if (condition == DayCondition.heavyfreezingdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == DayCondition.heavyrain.name) {
    return weatherIconAssetPath('raindrops');
  }
  if (condition == DayCondition.heavyrainattimes.name) {
    return weatherIconAssetPath('raindrops');
  }
  if (condition == DayCondition.heavysnow.name) {
    return weatherIconAssetPath('snowflake');
  }
  if (condition == DayCondition.icepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == DayCondition.lightdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == DayCondition.lightfreezingrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.lightrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.lightrainshower.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.lightshowersoficepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == DayCondition.lightsleet.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == DayCondition.lightsleetshowers.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == DayCondition.lightsnow.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == DayCondition.lightsnowshowers.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == DayCondition.mist.name) {
    return weatherIconAssetPath('mist');
  }
  if (condition == DayCondition.moderateorheavyfreezingrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.moderateorheavyrainshower.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.moderateorheavyrainwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-rain');
  }
  if (condition == DayCondition.moderateorheavyshowersoficepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == DayCondition.moderateorheavysleet.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == DayCondition.moderateorheavysleetshowers.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == DayCondition.moderateorheavysnowshowers.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == DayCondition.moderateorheavysnowwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == DayCondition.moderaterain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.moderaterainattimes.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == DayCondition.moderatesnow.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == DayCondition.overcast.name) {
    return weatherIconAssetPath('overcast');
  }
  if (condition == DayCondition.partlycloudy.name) {
    return weatherIconAssetPath('partly-cloudy-day');
  }
  if (condition == DayCondition.patchyfreezingdrizzlepossible.name) {
    return weatherIconAssetPath('partly-cloudy-day-drizzle');
  }
  if (condition == DayCondition.patchyheavysnow.name) {
    return weatherIconAssetPath('partly-cloudy-day-snow');
  }
  if (condition == DayCondition.patchylightdrizzle.name) {
    return weatherIconAssetPath('partly-cloudy-day-drizzle');
  }
  if (condition == DayCondition.patchylightrain.name) {
    return weatherIconAssetPath('partly-cloudy-day-rain');
  }
  if (condition == DayCondition.patchylightrainwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-day-rain');
  }
  if (condition == DayCondition.patchylightsnow.name) {
    return weatherIconAssetPath('partly-cloudy-day-snow');
  }
  if (condition == DayCondition.patchylightsnowwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-day-snow');
  }
  if (condition == DayCondition.patchymoderatesnow.name) {
    return weatherIconAssetPath('partly-cloudy-day-snow');
  }
  if (condition == DayCondition.patchyrainpossible.name) {
    return weatherIconAssetPath('partly-cloudy-day-rain');
  }
  if (condition == DayCondition.patchysleetpossible.name) {
    return weatherIconAssetPath('partly-cloudy-day-sleet');
  }
  if (condition == DayCondition.patchysnowpossible.name) {
    return weatherIconAssetPath('partly-cloudy-day-snow');
  }
  if (condition == DayCondition.sunny.name) {
    return weatherIconAssetPath('clear-day');
  }
  if (condition == DayCondition.thunderyoutbreakspossible.name) {
    return weatherIconAssetPath('thunderstorms');
  }
  if (condition == DayCondition.torrentialrainshower.name) {
    return weatherIconAssetPath('rain');
  }
}

String? nightIconPath(String condition) {
  if (condition == NightCondition.blizzard.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == NightCondition.blowingsnow.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == NightCondition.cloudy.name) {
    return weatherIconAssetPath('cloudy');
  }
  if (condition == NightCondition.fog.name) {
    return weatherIconAssetPath('fog');
  }
  if (condition == NightCondition.freezingdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == NightCondition.freezingfog.name) {
    return weatherIconAssetPath('fog');
  }
  if (condition == NightCondition.heavyfreezingdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == NightCondition.heavyrain.name) {
    return weatherIconAssetPath('raindrops');
  }
  if (condition == NightCondition.heavyrainattimes.name) {
    return weatherIconAssetPath('raindrops');
  }
  if (condition == NightCondition.heavysnow.name) {
    return weatherIconAssetPath('snowflake');
  }
  if (condition == NightCondition.icepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == NightCondition.lightdrizzle.name) {
    return weatherIconAssetPath('drizzle');
  }
  if (condition == NightCondition.lightfreezingrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.lightrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.lightrainshower.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.lightshowersoficepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == NightCondition.lightsleet.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == NightCondition.lightsleetshowers.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == NightCondition.lightsnow.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == NightCondition.lightsnowshowers.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == NightCondition.mist.name) {
    return weatherIconAssetPath('mist');
  }
  if (condition == NightCondition.moderateorheavyfreezingrain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.moderateorheavyrainshower.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.moderateorheavyrainwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-rain');
  }
  if (condition == NightCondition.moderateorheavyshowersoficepellets.name) {
    return weatherIconAssetPath('hail');
  }
  if (condition == NightCondition.moderateorheavysleet.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == NightCondition.moderateorheavysleetshowers.name) {
    return weatherIconAssetPath('sleet');
  }
  if (condition == NightCondition.moderateorheavysnowshowers.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == NightCondition.moderateorheavysnowwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-snow');
  }
  if (condition == NightCondition.moderaterain.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.moderaterainattimes.name) {
    return weatherIconAssetPath('rain');
  }
  if (condition == NightCondition.moderatesnow.name) {
    return weatherIconAssetPath('snow');
  }
  if (condition == NightCondition.overcast.name) {
    return weatherIconAssetPath('overcast');
  }
  if (condition == NightCondition.partlycloudy.name) {
    return weatherIconAssetPath('partly-cloudy-night');
  }
  if (condition == NightCondition.patchyfreezingdrizzlepossible.name) {
    return weatherIconAssetPath('partly-cloudy-night-drizzle');
  }
  if (condition == NightCondition.patchyheavysnow.name) {
    return weatherIconAssetPath('partly-cloudy-night-snow');
  }
  if (condition == NightCondition.patchylightdrizzle.name) {
    return weatherIconAssetPath('partly-cloudy-night-drizzle');
  }
  if (condition == NightCondition.patchylightrain.name) {
    return weatherIconAssetPath('partly-cloudy-night-rain');
  }
  if (condition == NightCondition.patchylightrainwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-night-rain');
  }
  if (condition == NightCondition.patchylightsnow.name) {
    return weatherIconAssetPath('partly-cloudy-night-snow');
  }
  if (condition == NightCondition.patchylightsnowwiththunder.name) {
    return weatherIconAssetPath('thunderstorms-night-snow');
  }
  if (condition == NightCondition.patchymoderatesnow.name) {
    return weatherIconAssetPath('partly-cloudy-night-snow');
  }
  if (condition == NightCondition.patchyrainpossible.name) {
    return weatherIconAssetPath('partly-cloudy-night-rain');
  }
  if (condition == NightCondition.patchysleetpossible.name) {
    return weatherIconAssetPath('partly-cloudy-night-sleet');
  }
  if (condition == NightCondition.patchysnowpossible.name) {
    return weatherIconAssetPath('partly-cloudy-night-snow');
  }
  if (condition == NightCondition.clear.name) {
    return weatherIconAssetPath('clear-night');
  }
  if (condition == NightCondition.thunderyoutbreakspossible.name) {
    return weatherIconAssetPath('thunderstorms');
  }
  if (condition == NightCondition.torrentialrainshower.name) {
    return weatherIconAssetPath('rain');
  }
}

String weatherIconAssetPath(String text) => 'assets/weather_icons/$text.svg';

String conditionFormat(String condition) => condition.toLowerCase().replaceAll(' ', '');
