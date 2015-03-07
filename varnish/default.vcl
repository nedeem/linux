backend localhost {
        .host = "127.0.0.1";
        .port = "8888";
        .connect_timeout= 256s;
        .first_byte_timeout = 256s;
        .between_bytes_timeout = 256s;
        .saintmode_threshold = 999999999;
}



sub vcl_recv {

	include "vcl_recv.vcl";

          set req.grace = 24h;

        return (lookup);
}



sub vcl_fetch {

	include "vcl_fetch.vcl";

          set beresp.grace = 48h;

        return(deliver);
}
