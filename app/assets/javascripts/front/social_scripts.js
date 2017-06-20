// <!-- Yandex.Metrika counter -->
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter45005131 = new Ya.Metrika({
                id:45005131,
                clickmap:true,
                trackLinks:true,
                accurateTrackBounce:true,
                webvisor:true,
                trackHash:true,
                ecommerce:"dataLayer"
            });
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = "https://mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");

// <!-- /Yandex.Metrika counter -->


// Google
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-101093258-1', 'auto');
ga('send', 'pageview');

// Google end


// Facebook pixel
if (typeof __GetI === "undefined") {
    __GetI = [];
}
(function () {
    var p = {
        type: "VIEW",
        /* config START */
        site_id: "3018",
        product_id: "",
        product_price: "",
        category_id: "",
        pixel_id: ""
        /* config END */
    };
    __GetI.push(p);
    var domain = (typeof __GetI_domain) == "undefined" ? "px.adhigh.net" : __GetI_domain;
    var src = ('https:' == document.location.protocol ? 'https://' : 'http://') + domain + '/p.js';
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = src;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(script, s);
})();

// Facebook pixel end