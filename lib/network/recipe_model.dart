import 'package:json_annotation/json_annotation.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class APIRecipeQuery{
  //TODO: Add APIRecipeQuery.fromjson
  factory APIRecipeQuery.fromJson(Map<String, dynamic> json) => _$APIRecipeQueryFromJson(json);
  Map<String, dynamic> toJson() => _$APIRecipeQueryToJson(this);

  @JsonKey(name: "q")
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;

  APIRecipeQuery({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits
});
}

//TODO: Add @jsonSerializable() class APIHits
@JsonSerializable()
class APIHits{
  APIRecipe recipe;

  APIHits({
    required this.recipe,
});

  factory APIHits.fromJson(Map<String, dynamic> json) => _$APIHitsFromJson(json);
  Map<String, dynamic> toJson() => _$APIHitsToJson(this);
}
//TODO: Add @jsonSerializable() class APIRecipe
@JsonSerializable()
class APIRecipe{
  String label;
  String image;
  String url;

  List<APIIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  APIRecipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime
  });

  factory APIRecipe.fromJson(Map<String, dynamic> json) => _$APIRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$APIRecipeToJson(this);
}
//TODO: Add global Helper Functions
String getCalories(double? calories){
  if(calories == null){
    return '0 KCAL';
  }
  return calories.floor().toString() + 'KCAL';
}
String getWeight(double? weight){
  if(weight == null){
    return '0g';
  }
  return weight.floor().toString() + 'g';
}

//TODO: Add @jsonSerializable() class APIIngredients
@JsonSerializable()
class APIIngredients{
  String name;
  String weight;

  APIIngredients({
    required this.name,
    required this.weight,
  });

  factory APIIngredients.fromJson(Map<String, dynamic> json) => _$APIIngredientsFromJson(json);
  Map<String, dynamic> toJson() => _$APIIngredientsToJson(this);
}