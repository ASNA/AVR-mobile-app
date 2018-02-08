"use strict";

function changeStatus(accountid, status) {
    let json = { cmcustno: accountid, status: status };

    /*
     | url must be iistester/api/changestatus for deployed version! 
     | Something is up with IIS configuration!
     */

    let options = {
        url: '/api/changestatus',
        method: 'POST',
        headers: new Headers({
            'content-type': 'application/json',
            'x-requested-with': 'XMLHttpRequest'
        }),
        credentials: 'same-origin',  // You have no idea how important this is! 
        dataType: 'json',
        body: JSON.stringify(json),
        action: finishStatusChange
    };

    let httpReq = new rp.ajax.HTTPRequest();
    httpReq.submit(options);
}


function finishStatusChange(json, startTime) {
    let thumb = document.querySelector(`aside[data-accountid="${json.cmcustno}"]`);
    thumb.setAttribute('data-status', json.newstatus);
    let iconElement = thumb.firstElementChild.firstElementChild;
    if (json.newstatus == '1') {
        iconElement.classList.remove('fa-thumbs-down', 'big-icon-red');
        iconElement.classList.add('fa-thumbs-up', 'big-icon-green');
    }
    else {
        iconElement.classList.remove('fa-thumbs-up', 'big-icon-green');
        iconElement.classList.add('fa-thumbs-down', 'big-icon-red');
    }
    console.log(json);
    console.log(thumb);

    let elapsedMs = performance.now() - json.__startTime;
    console.log(`Time to change status was ${elapsedMs} milliseconds.`);
}

let thumbs = document.querySelectorAll('.change-status');
for (var i = 0; i < thumbs.length; i++) {
    let thumb = thumbs[i].parentElement;
    thumb.addEventListener('click', function(e) {
        let status = this.parentElement.getAttribute('data-status');
        let accountid = this.parentElement.getAttribute('data-accountid');
        changeStatus(accountid, status);
    });
}

    