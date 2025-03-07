class ApiConstant {
  static const baseUrl = 'https://usvganumjglfxnihjiel.supabase.co/rest/v1/';
  static const getProduct =
      'productes?select=*,rate_product(*),comments_table(*),favorite_product(*)';
  static const productDetails = 'rate_product?select=*&for_product_id=eq.{id}';
  static const addRate = 'rate_product';
  static const updateRate =
      'rate_product?for_user_id=eq.{userId}&for_product_id=eq.{productId}';

  static const getComment = 'comments_table?select=*&for_product_id=eq.{id}';

  static const addComment = 'comments_table';

  static const getCategory = 'productes?select=*&category=eq.{category}';

  static const addFavorite = 'favorite_product';
  static const deleteFavorite =
      'favorite_product?for_user_id=eq.{userId}&for_product_id=eq.{productId}';
  static const getFavorite =
      'favorite_product?select=*,productes(*)&for_user_id=eq.{id}';
  static const getPurchase =
      'purchase_table?select=*,productes(*)&for_user_id=eq.{id}';
}
