const JWT_PATH = '/jwt-auth/v1';
const AAM_PATH = '/aam/v2';

const JWT_AUTHENTICATE = '$JWT_PATH/token';
const JWT_VALIDATE = '$JWT_PATH/token/validate';

const AAM_AUTHENTICATE = '$AAM_PATH/authenticate';
const AAM_VALIDATE = '$AAM_PATH/jwt/validate';
const AAM_REFRESH = '$AAM_PATH/jwt/refresh';
const AAM_REVOKE = '$AAM_PATH/jwt/revoke';

const WP_USERS = '/users';
const WP_USER_ME = '/users/me';
const WP_CATEGORIES = '/categories';
const WP_COMMENTS = '/comments';
const WP_MEDIA = '/media';
const WP_PAGES = '/pages';
const WP_POSTS = '/posts';
const WP_TAGS = '/tags';

/*
Use with care, some plugins may deprecated with concern!
Wordpress API open access as default, http://[your_wordpress_url]/wp-json
[username] and [password] required for:
ApplicationPasswords, BasicAuthentication, 

Application Passwords - Last updated: Jan 2020
https://wordpress.org/plugins/application-passwords/

Basic Authentication - Last updated: Dec 2017
https://github.com/WP-API/Basic-Auth

JSON Web Tokens - Last updated: 2019
https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/

Advanced Access Manager - Last updated May 2020
https://wordpress.org/plugins/advanced-access-manager/
*/

enum AuthMethod {
  None,
  ApplicationPasswords,
  BasicAuthentication,
  JWT,
  AAM,
}

enum WordPressContext {
  view,
  embed,
  edit,
}

enum Order {
  asc,
  desc,
}

enum PostOrderBy {
  author,
  date,
  id,
  include,
  modified,
  parent,
  relevance,
  slug,
  title,
}
enum PostPageStatus {
  publish,
  future,
  draft,
  pending,
  private,
}
enum PostCommentStatus {
  open,
  closed,
}
enum PostPingStatus {
  open,
  closed,
}
enum PostFormat {
  standard,
  aside,
  chat,
  gallery,
  link,
  image,
  quote,
  status,
  video,
  audio,
}

enum UserOrderBy {
  id,
  include,
  name,
  registered_date,
  slug,
  email,
  url,
}

enum CommentOrderBy {
  date,
  date_gmt,
  id,
  include,
  post,
  parent,
  type,
}
enum CommentStatus {
  all,
  approve,
  hold,
  spam,
  trash,
}
enum CommentType {
  comment,
  //TODO: Add all comment types
}

enum CategoryTagOrderBy {
  id,
  include,
  name,
  slug,
  term_group,
  description,
  count,
}

enum PageOrderBy {
  author,
  date,
  id,
  include,
  modified,
  parent,
  relevance,
  slug,
  title,
  menu_order,
}

enum MediaOrderBy {
  author,
  date,
  id,
  include,
  modified,
  parent,
  relevance,
  slug,
  title,
}
enum MediaStatus {
  inherit,
  publish,
  future,
  draft,
  pending,
  private,
}
enum MediaType {
  image,
  video,
  audio,
  application,
}

/// Converts an enum string to enum value name.
String enumStringToName(String enumString) {
  return enumString.split('.')[1];
}

/// Formats a list of [items] to a comma(,) separated string to pass it as a
/// URL parameter.
String listToUrlString<T>(List<T> items) {
  if (items == null || items.length == 0) return '';

  return items.join(',');
}

/// Formats a [Map] of parameters to a string of URL friendly parameters.
String constructUrlParams(Map<String, String> params) {
  StringBuffer p = new StringBuffer('/?');
  params.forEach((key, value) {
    if (value != '') {
      p.write('$key=$value');
      p.write('&');
    }
  });
  return p.toString();
}
