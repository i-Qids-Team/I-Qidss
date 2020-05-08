class AnimalData
{
  String name;
  String imagehide;
  String image;
  String audio;
  double height;
  Map animalalpha;
  
  AnimalData(this.name,this.imagehide,this.image,this.audio,this.height,this.animalalpha);
   AnimalData.copy(AnimalData from) : this(from.name, from.imagehide,from.image,from.audio,from.height,from.animalalpha);  
}