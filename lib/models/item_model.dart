class ItemModel{
  String? id ;
  String? name;
  String? discription;
  String? price;
  String? category;
  String? branch;
  String? discount;
  String? ingredients;
  String? images;
  String? nutritionDeclaration;

  ItemModel({
    this.id,
    this.name,
    this.images,
    this.discription,
    this.category,
    this.branch,
    this.price,
    this.discount,
    this.ingredients,
    this.nutritionDeclaration
  });
  
  
   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'images': images,
      'discription': discription,
      'category':category,
      'branch':branch,
      'price':price,
      'discount': discount,
      'ingredients':ingredients,
      'nutritionDeclaration':nutritionDeclaration
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      name: map['name'] ??'',
      images:map['images'] ??'',
      discription:map['discription'] ??'',
      category:map['category'] ??'',
      branch:map['branch'] ??'',
      price:map['price'] ??'',
      discount:map['discount'] ??'',
      ingredients:map['ingredients'] ??'',
      nutritionDeclaration:map['nutritionDeclaration'] ,
    );
  }
  }

 
  


