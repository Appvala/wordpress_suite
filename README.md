# WordPress Suite

A dart package to interact with the WordPress Suite, like WooCommerce, LearnPress and etc. Welcome WordPress plugin authors, maintainers, fans to contribute!

## Examples

### WordPress GET request
```dart
WordPress wp = WordPress(
    endpoint: Endpoint(
      address: 'https://yourwordpress.com',
    ),
    versionPath: "/wp/v2",
    method: AuthMethod.BasicAuthentication,
    username: 'your_username',
    password: 'your_password',
  );
  var users = await wp.get('/users');
  print(users);
```

### WooCommerce GET request
```dart
  WooCommerce wc = WooCommerce(
      endpoint: Endpoint(
        address: 'https://yourwordpress.com',
      ),
      versionPath: "/wc/v3",
      consumerKey: "ck_your_consumer_key",
      consumerSecret: "cs_your_consumer_secret");

  // Get data using the "products" endpoint
  var products = await wc.get("/products");
  print(products);
```

# TODO
- Response schemas for WordPress and WooCommerce
- Request schemas for WordPress and WooCommerce
- Better error handling
- Waiting LearnPress API documentation to release
- Other WordPress's plugins, LearnDash

## Issues

Report any issues if you face any

## Contributors
Let's make it a WordPress Suite SDK !!!

| # | Name | Module |
|---|---|---|
| 0 | Me | WordPress, WooCommerce |
