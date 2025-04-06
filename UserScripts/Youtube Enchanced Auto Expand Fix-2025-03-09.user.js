// ==UserScript==
// @name         Youtube Enchanced Auto Expand Fix
// @namespace    http://tampermonkey.net/
// @version      2025-03-09
// @description  Automatically clicks the Expand button once a tab is loaded.
// @author       SAS41
// @match        https://*.youtube.com/watch*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// ==/UserScript==

(new MutationObserver(check)).observe(document, {childList: true, subtree: true});

function check(changes, observer) {
    if(document.getElementById("efyt-size")) {
        observer.disconnect();
        setTimeout(function() {
            document.getElementById("efyt-size").click();
        }, 2000);
    }
}