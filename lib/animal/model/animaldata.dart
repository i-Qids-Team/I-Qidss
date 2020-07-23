class AnimalData {
  
  String imagehide;
  String image;
  String audio;
  Map animalalpha;

  AnimalData({
      this.imagehide,
      this.image,
      this.audio,
      this.animalalpha
      });

  AnimalData.copy(AnimalData from) : this( 
    imagehide: from.imagehide, 
    image: from.image, 
    audio: from.audio,
    animalalpha: from.animalalpha);
}
