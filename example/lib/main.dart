import 'package:flutter/material.dart';
import 'package:wordpress_suite/wordpress.dart';
import 'package:wordpress_suite/woocommerce.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var products;
  var users;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    // Initialize WordPress API
    WordPress wp = WordPress(
      endpoint: Endpoint(
        address: 'https://yourwordpress.com',
      ),
      versionPath: "/wp/v2",
      method: AuthMethod.BasicAuthentication,
      username: 'your_username',
      password: 'your_password',
    );
    setState(() async {
      users = await wp.get('/users');
    });

    // Initialize WooCommerce API
    WooCommerce wc = WooCommerce(
      endpoint: Endpoint(
        address: 'https://yourwordpress.com',
      ),
      versionPath: "/wc/v3",
      consumerKey: "ck_your_consumer_key",
      consumerSecret: "cs_your_consumer_secret",
    );

    setState(() async {
      products = await wc.get("/products");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Text('$users\n\n$products'),
      ),
    );
  }
}
