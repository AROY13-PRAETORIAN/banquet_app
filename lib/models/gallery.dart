class GalleryModel {
  String image;

  GalleryModel(this.image);
}

List<GalleryModel> gallery =
    roomgalleryData.map((item) => GalleryModel(item['image'])).toList();

var roomgalleryData = [
  {
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/meet-and-celebrate/Whitefield_Meet-Celebrate-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg"
  },
  {
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/hotels/images/venues/Generic_ImagesforWeb_3x2-31-Copy.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg"
  },
  {
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/vbt-whitefield/images/work-and-play/Whitefield_Work%20_%20Play-Images-for-Web_3x2-01.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg"
  },
  {
    "image":
        "https://www.vivantahotels.com/content/dam/vivanta/hotels/VBT-Blue_Diamond_Pune/images/Meet_Celebrate/Social_Occaions_Hero_Banner_Web_3x2-28.jpg/jcr:content/renditions/cq5dam.web.512.512.jpeg"
  },
];
