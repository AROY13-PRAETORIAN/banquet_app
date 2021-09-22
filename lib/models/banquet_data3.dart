class RoomModel3 {
  String name;
  String tagLine;
  String image;
  List<String> images;
  List<String> images2;
  String description;
  int entry;
  String area;
  String capacity;
  String capacity1;
  String capacity2;
  String capacity3;
  String capacity4;
  String capacity5;
  String capacity6;

  RoomModel3(
      this.name,
      this.tagLine,
      this.image,
      this.images,
      this.images2,
      this.description,
      this.entry,
      this.area,
      this.capacity,
      this.capacity1,
      this.capacity2,
      this.capacity3,
      this.capacity4,
      this.capacity5,
      this.capacity6);
}

List<RoomModel3> rooms3 = roomsData
    .map((item) => RoomModel3(
          item['name'],
          item['tagLine'],
          item['image'],
          item['images'],
          item['images2'],
          item['description'],
          item['entry'],
          item['area'],
          item['capacity'],
          item['capacity1'],
          item['capacity2'],
          item['capacity3'],
          item['capacity4'],
          item['capacity5'],
          item['capacity6'],
        ))
    .toList();

var roomsData = [
  {
    "name": "Tease Lawns",
    "tagLine":
        "Unique sloping lawns, with a breathtaking view of the International tech park, and the Swimming pool",
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/hotels/VBT-Blue_Diamond_Pune/images/Meet_Celebrate/Social_Occaions_Hero_Banner_Web_3x2-28.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    "images": [
      "https://www.vivantahotels.com/content/dam/vivanta/hotels/VBT-Blue_Diamond_Pune/images/Meet_Celebrate/Social_Occaions_Hero_Banner_Web_3x2-28.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    ],
    "images2": ["assets/images/teaselawns.jpeg"],
    "description":
        "Located above the lobby level, Tease has a reflective water body and open-air seating. This makes it among the most premium open air venues in Bangalore, offering a dramatic view of the International tech park, the facade of the award winning hotel, and landscaped lawns on either side. Perfect location for Corporate and Social events.\n\nOTHER CONVENIENCES \n - AUDIO-VISUAL EQUIPMENT \n - GENERAL SERVICES \n - INTERNET ACCESS",
    "entry": 3,
    "area": "465 sq. m.",
    "capacity": "700",
    "capacity1": "Theatre 300",
    "capacity2": "Circular 200",
    "capacity3": "U Shaped NA",
    "capacity4": "Boardroom NA",
    "capacity5": "Classroom NA",
    "capacity6": "Reception 700",
  },
];
