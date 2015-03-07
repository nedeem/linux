# Remove Cache_control headers
  remove beresp.http.Cache-Control;
  set beresp.http.Cache-Control = "public";


set beresp.ttl = 512s;


# TTL for FrontPAge
     if ((req.url == "/")){
        set beresp.ttl = 120s;
     } else {
        set beresp.ttl = 512s;
  }

# TTL for Kategorije
     if ((req.url ~ "/kategorija/")){
        set beresp.ttl = 180s;
     }

# TTL for Clanak
     if ((req.url ~ "/clanak/")){
        set beresp.ttl = 768s;
     }


# Do not cache white screen of death
     if (beresp.http.Content-Length == "0"){
	  set beresp.saintmode = 10s;
         return(restart);
     }

# Saint Mode
  if (beresp.status >= 500) {
     set beresp.saintmode = 10s;
    return(restart);
  }

# Do not cache 403 Forbidden and 404 Not found
  if (beresp.status == 403) {
     set beresp.saintmode = 10s;
   return(restart);
  }

  if (beresp.status == 404) {
     set beresp.saintmode = 10s;
    return(restart);
  }


# Do not cache

if (req.url ~ "/login" ||
    req.url ~ "/logout" ||
    req.url ~ "/admin" ||
    req.url ~ "/administrator" ||
    req.url ~ "/post" ||
    req.url ~ "/ucp" ||
    req.url ~ "/notify" ||
    req.url ~ "/lessons" ||
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
    return (hit_for_pass);
}
