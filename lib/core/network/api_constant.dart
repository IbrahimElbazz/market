class ApiConstant {
  static const baseUrl = 'https://usvganumjglfxnihjiel.supabase.co/rest/v1/';

  static const getProduct =
      'productes?select=*,rate_product(*),comments_table(*),favorite_product(*)';

  static const productDetails = 'rate_product?select=*&for_product_id=eq.{id}';
}
