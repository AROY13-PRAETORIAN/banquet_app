class RoomModel2 {
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

  RoomModel2(
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

List<RoomModel2> rooms2 = roomsData
    .map((item) => RoomModel2(
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
    "name": "Agenda",
    "tagLine":
        "Pillar-less with in-built 62 inch LCD TV, and Video Conferencing facility",
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/work-and-play/Whitefield_Work%20_%20Play-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    "images": [
      "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/work-and-play/Whitefield_Work%20_%20Play-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg",
    ],
    "images2": ["assets/images/agenda.jpeg"],
    "description":
        "Our high-tech boardroom has the best technology on offer, including a Crestron Control System, a 63-inch LCD, audiovisual facilities and more. A complete space for the complete occasion.\n\nOTHER CONVENIENCES \n - 63-inch LCD, video and audio conferencing with session recording capabilities \n - Video conferencing codec \n HOTEL FACILITIES \n - VGA laptop presentation capabilities, motorised screen \n - Polycom, 7 boundary microphones on the table \n - TV Presentations \n - Room control (lights, volume, VC, presentation switching, camera pan, recording, TV controls – all on a touch screen interface)",
    "entry": 1,
    "area": "139 sq. m.",
    "capacity": "16",
    "capacity1": "Theatre NA",
    "capacity2": "Circular NA",
    "capacity3": "U Shaped 16",
    "capacity4": "Boardroom 16",
    "capacity5": "Classroom NA",
    "capacity6": "Reception NA",
  },
];
