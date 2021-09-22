class FoodModel{
  Map<String, dynamic> responseBody;

  FoodModel(this.responseBody);
}

List<FoodModel> foods= foodData.map((item) => FoodModel(item['responseBody'],)).toList();

List<Map<String, dynamic>> foodData = [
  {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Chicken","subtitle":"food again"},
      {"category_id": "3", "category_name": "Fish","subtitle":"food again"},
      {"category_id": "7", "category_name": "Eggs","subtitle":"food again"},
      {"category_id": "9", "category_name": "Paneer","subtitle":"food again"},
      {"category_id": "1", "category_name": "Roll","subtitle":"food again"},
      {"category_id": "11", "category_name": "Noodles","subtitle":"food again"},
      {"category_id": "13", "category_name": "Fried Rice","subtitle":"food again"},
      {"category_id": "15", "category_name": "Rice","subtitle":"food again"},
      {"category_id": "17", "category_name": "Curry","subtitle":"food again"}
    ],
    "responseTotalResult": 9 // Total result is 3 here becasue we have 3 categories in responseBody.
  },
  {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Chicken","subtitle":"food again"},
      {"category_id": "3", "category_name": "Fish","subtitle":"food again"},
      {"category_id": "7", "category_name": "Eggs","subtitle":"food again"},
      {"category_id": "9", "category_name": "Paneer","subtitle":"food again"},
      {"category_id": "1", "category_name": "Roll","subtitle":"food again"},
      {"category_id": "11", "category_name": "Noodles","subtitle":"food again"},
      {"category_id": "13", "category_name": "Fried Rice","subtitle":"food again"},
      {"category_id": "15", "category_name": "Rice","subtitle":"food again"},
      {"category_id": "17", "category_name": "Curry","subtitle":"food again"}
    ],
    "responseTotalResult": 9 // Total result is 3 here becasue we have 3 categories in responseBody.
  },
  {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Chicken","subtitle":"food again"},
      {"category_id": "3", "category_name": "Fish","subtitle":"food again"},
      {"category_id": "7", "category_name": "Eggs","subtitle":"food again"},
      {"category_id": "9", "category_name": "Paneer","subtitle":"food again"},
      {"category_id": "1", "category_name": "Roll","subtitle":"food again"},
      {"category_id": "11", "category_name": "Noodles","subtitle":"food again"},
      {"category_id": "13", "category_name": "Fried Rice","subtitle":"food again"},
      {"category_id": "15", "category_name": "Rice","subtitle":"food again"},
      {"category_id": "17", "category_name": "Curry","subtitle":"food again"}
    ],
    "responseTotalResult": 9 // Total result is 3 here becasue we have 3 categories in responseBody.
  },
  {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Chicken","subtitle":"food again"},
      {"category_id": "3", "category_name": "Fish","subtitle":"food again"},
      {"category_id": "7", "category_name": "Eggs","subtitle":"food again"},
      {"category_id": "9", "category_name": "Paneer","subtitle":"food again"},
      {"category_id": "1", "category_name": "Roll","subtitle":"food again"},
      {"category_id": "11", "category_name": "Noodles","subtitle":"food again"},
      {"category_id": "13", "category_name": "Fried Rice","subtitle":"food again"},
      {"category_id": "15", "category_name": "Rice","subtitle":"food again"},
      {"category_id": "17", "category_name": "Curry","subtitle":"food again"}
    ],
    "responseTotalResult": 9 // Total result is 3 here becasue we have 3 categories in responseBody.
  },
];
