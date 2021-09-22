class RoomModel1 {
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

  RoomModel1(
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

List<RoomModel1> rooms1 = roomsData
    .map((item) => RoomModel1(
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
    "name": "Tango 3",
    "tagLine": "Access to abundant natural light.",
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/hotels/images/venues/Generic_ImagesforWeb_3x2-31-Copy.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    "images": [
      "https://www.vivantahotels.com/content/dam/vivanta/hotels/images/venues/Generic_ImagesforWeb_3x2-31-Copy.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    ],
    "images2": ["assets/images/tango3.jpeg"],
    "description":
        "Suitable for private events, trainings, workshops, as it has access to abundant natural light.\n\nOTHER CONVENIENCES \n - AUDIO-VISUAL EQUIPMENT \n - GENERAL SERVICES \n - INTERNET ACCESS",
    "entry": 1,
    "area": "111 sq. m.",
    "capacity": "50",
    "capacity1": "Theatre 50",
    "capacity2": "Circular 24",
    "capacity3": "U Shaped 18",
    "capacity4": "Boardroom 18",
    "capacity5": "Classroom 24",
    "capacity6": "Reception 70",
  },

];
