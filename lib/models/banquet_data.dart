class RoomModel {
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

  RoomModel(
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

List<RoomModel> rooms = roomsData
    .map((item) => RoomModel(
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
    "name": "Tango 1,2",
    "tagLine":
        "Pillar less Hall with access to natural light, and a large dropdown screen",
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    "images": [
      "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
      "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
      "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
      "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    ],
    "images2": [
      "assets/images/tango.jpeg",
    ],
    "description":
        "Enjoy the vast, pillar-less banquet spaces at Vivanta Whitefield, where you can meet and greet or seal the deal. With state of the art AV facilities and sleek furniture, it’s the complete package.\n\nOTHER CONVENIENCES \n - Modular tables \n HOTEL FACILITIES \n - Ballrooms inbuilt AV features (drop-down screen, drop-down projector) \n - Pillar-less halls",
    "entry": 1,
    "area": "511 sq. m.",
    "capacity": "600",
    "capacity1": "Theatre 450",
    "capacity2": "Circular 192",
    "capacity3": "U Shaped 72",
    "capacity4": "Boardroom 96",
    "capacity5": "Classroom 144",
    "capacity6": "Reception 60",
  },
];
