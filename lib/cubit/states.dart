abstract class NewsStates {}

class NewsChnageModesState extends NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNav extends NewsStates {}

class NewsgetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  late final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsgetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  late final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsgetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  late final String error;
  NewsGetScienceErrorState(this.error);
}


class NewsGetSearchLoadingState extends NewsStates {}

class NewsgetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  late final String error;
  NewsGetSearchErrorState(this.error);
}

