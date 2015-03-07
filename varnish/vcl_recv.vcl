# Varnish 3
# Unseret headers
	unset req.http.Cache-Control;
	unset req.http.Max-Age;
	unset req.http.Pragma;
        remove req.http.Cache-Control;
        remove req.http.X-Forwarded-For;
        set req.http.X-Forwarded-For = client.ip;
        remove req.http.X-Forwarded-For;
        set req.http.X-Forwarded-For = client.ip;

# Decide whether or not to serve the request, how to do it, and, if applicable, which backend to use.
# In vcl_recv you can also alter the request. Typically you can alter the cookies and add and remove request headers.

  if (req.request != "GET" &&
    req.request != "HEAD" &&
    req.request != "PUT" &&
    req.request != "POST" &&
    req.request != "TRACE" &&
    req.request != "OPTIONS" &&
    req.request != "DELETE") {
      return (pipe);
  }


# Enable login to admin backend - Pass action does not cache
       if (req.http.Authorization || req.http.Cookie) {
               return (pass);
       }

# Do not cache
if (req.url ~ "/login" ||
    req.url ~ "/logout" ||
    req.url ~ "/admin" ||
    req.url ~ "/administrator" ||
    req.url ~ "/notify" ||
    req.url ~ "/lessons" ||
    req.url ~ "/post" ||
    req.url ~ "/ucp" ||
    req.url ~ "/register" ||
    req.url ~ "/search" ||
    req.url ~ "/order" ||
    req.url ~ "/client" ||
    req.url ~ "/upload" ||
    req.url ~ "/manager" ||
    req.url ~ "/wp-admin" ||
    req.url ~ "/wp-login" ||
    req.url ~ "/add" ||
    req.url ~ "/edit" ||
    req.url ~ "/user" ||
    req.url ~ "/androidapi" ||
    req.url ~ "/ajax" ||
    req.url ~ "/comments" ||
    req.url ~ "/polls" ||
    req.url ~ "/komentari" ||
    req.url ~ "/media" ||
    req.url ~ "/images_uploader" ||
    req.url ~ "/image_galleries" ||
    req.url ~ "/mail")
     {
    return (pass);
}

#



if (!(req.url ~ "^/admin/")) {
    unset req.http.Cookie;
}
