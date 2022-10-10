enum Tagtype { trending, newtype , discount , bestseller}
class ProductTag {
  String tagname;
  Tagtype tagtype;
  ProductTag({
    required this.tagname,
    required this.tagtype,
  });

}