# WordPress Suite

A Dart and Flutter package to interact with the WordPress Suite, like WooCommerce, LearnPress and etc. Welcome WordPress plugin authors, maintainers, fans to contribute!

## Examples

Use with care, some plugins may deprecated with concern!

Wordpress API open access as default, http://yourwordpress.com/wp-json

### WordPress Authentication Method

Application Passwords - Last updated: Jan 2020

https://wordpress.org/plugins/application-passwords/

Basic Authentication - Last updated: Dec 2017

https://github.com/WP-API/Basic-Auth

JSON Web Tokens - Last updated: 2019

https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/

Advanced Access Manager - Last updated May 2020

https://wordpress.org/plugins/advanced-access-manager/

```
[username] and [password] required for:
ApplicationPasswords, BasicAuthentication, 
```

### WordPress GET request
```dart
WordPress wp = WordPress(
    endpoint: Endpoint(
      address: 'https://yourwordpress.com',
    ),
    versionPath: "/wp/v2",
    method: AuthMethod.BasicAuthentication,
    username: 'username',
    password: 'password',
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
