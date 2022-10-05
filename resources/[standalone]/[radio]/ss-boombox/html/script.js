// made with 💓 by SAHIL#8908

let playlist = [ //default playlist you can add more. First 3 will be considered as Top Songs
    {
        name: 'Call Me By Your Name',
        author: 'Lil Nas',
        image: 'https://i.ytimg.com/vi/GHRnsRDjlUk/maxresdefault.jpg',
        url: 'https://www.youtube.com/watch?v=GHRnsRDjlUk'
    },
    {
        name: 'Summertime Sadness',
        author: 'Lana Del Rey',
        image: 'https://i.ytimg.com/vi/arbv5HHOA0A/maxresdefault.jpg',
        url: 'https://www.youtube.com/watch?v=arbv5HHOA0A'
    },
    {
        name: '♫ Best Party Mix ♫',
        author: 'Magic Music',
        image: 'https://i.ytimg.com/vi/W9iUh23Xrsg/maxresdefault.jpg',
        url: 'https://www.youtube.com/watch?v=W9iUh23Xrsg'
    },
    {
        name: 'Masked Wolf - Astronaut In The Ocean',
        author: 'Masked Wolf',
        image: 'https://i.ytimg.com/vi/MEg-oqI9qmw/maxresdefault.jpg',
        url: 'https://www.youtube.com/watch?v=j73FogG0Iiw'
    },
]

$(document).ready(function () {
    $('button.btn-extend').click(function () {
        $('.player-screen').addClass("active");
    });
    $('button.btn-close').click(function () {
        $('.player-screen').removeClass("active");
    });
    $('#playlist').click(function () {
        $('.player-screen').removeClass("active");
    });
});

$('#shutdownbutton').click(function () {
    $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
        action: 'exit'
    }));
})

$('#playPause').click(function () {
    var x = $("#playPause")
    if (x.attr('class') === 'pause-button') {
        x.addClass('play-button')
        $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
            action: 'pause'
        }));
    } else {
        x.removeClass('play-button')
        $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
            action: 'play'
        }));
    }
})

$('#infoPlayButton').click(function () {
    var x = $("#infoPlayButton")
    if (x.attr('class') === 'btn btn-play paused') {
        x.html(`<svg fill="currentColor" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
        stroke-width="2" class="feather feather-skip-forward" width="14" height="14"
        viewBox="0 0 24 24">
        <defs />
        <path d="M5 3l14 9-14 9V3z" />
        </svg>`)
        x.addClass('playing')
        $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
            action: 'pause'
        }));
    } else {
        x.html(`<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
        class="feather feather-play" fill="currentColor">
        <path d="M5 3 5 21 22 21 22 3 5 3" />
        </svg>`)
        x.removeClass('playing')
        $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
            action: 'play'
        }));
    }
})


$('#loop').click(function () {
    $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
        action: 'loop'
    }));
})

$('#back').click(function () {
    $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
        action: 'back'
    }));
})

$('#forward').click(function () {
    $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
        action: 'forward'
    }));
})

document.querySelector('#volumeChange')
    .addEventListener('input', evt => {
        let changedVolume = evt.target.value
        changedVolume = Math.round(changedVolume * 10) / 1000;
        $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
            action: 'volumeChanged',
            volume: changedVolume
        }))
    });

var vidname = "Name not Found";
var authorName = "";
var thumbUrl = "";

for (let i = 0; i < 3; i++) {
    let content = `<div class="album-wrapper">
    <a onclick='PlayMusic("${playlist[i].url}",${i})' ><img src=${playlist[i].image}
        alt="album" class="album-cover">
    <div class="list-item-info">
        <div class="info-title">${playlist[i].name}</div>
    </div>
    </a>
    </div>`
    $('.album-list').append(content)
}



function refreshPlaylist() {
    $('.playlist').html('')
    playlist.forEach((song, i) => {
        let content = `<li class="list-item">
        <img class="list-item-image"
            src=${song.image}
            alt="song">
        <div class="list-item-info">
            <div class="info-title">${song.name}</div>
            <div class="info-subtitle">${song.author}</div>
        </div>
        <button onclick='PlayMusic("${song.url}", ${i})' class="btn-add">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-plus">
                <path d="M12 5v14M5 12h14" />
            </svg>
        </button>
        <button onclick='DeleteMusic("${song.url}",${i})' class="btn-add">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-plus">
                <path d="M 8 19 Q 8 17 6 7 C 9 4 15 4 18 7 Q 16 17 16 19 H 8" />
            </svg>
        </button>
        </li>`
        $('.playlist').append(content)
    });
}
refreshPlaylist()

$('#addSong').click(function () {
    var url = document.getElementById('song').value
    getSongDetails(url)
    document.getElementById('song').value = ""
})

function DeleteMusic(url, index) {
    if (index > -1) {
        playlist.splice(index, 1);
        refreshPlaylist()
        $.post(`https://${GetParentResourceName()}/delSong`, JSON.stringify({ url }))
    }
}

function PlayMusic(url, index) {
    getNameFile(url)
    currentSong = index
    $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
        action: 'seturl',
        link: url,
    }));
}


window.addEventListener('message', function (event) {

    switch (event.data.action) {
        case 'showRadio':
            $('#main').show();
            break
        case 'hideRadio':
            $('#main').hide();
            break
        case 'isLooping':
            if (event.data.text == 'false') {
                document.getElementById("loop").style.backgroundImage = `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='white' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' class='feather feather-repeat' width='24' height='24' viewBox='0 0 24 24'%3E%3Cdefs/%3E%3Cpath d='M17 1l4 4-4 4'/%3E%3Cpath d='M3 11V9a4 4 0 014-4h14M7 23l-4-4 4-4'/%3E%3Cpath d='M21 13v2a4 4 0 01-4 4H3'/%3E%3C/svg%3E")`
            } else {
                document.getElementById("loop").style.backgroundImage = `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' stroke='%236343e4' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' class='feather feather-repeat' width='24' height='24' viewBox='0 0 24 24'%3E%3Cdefs/%3E%3Cpath d='M17 1l4 4-4 4'/%3E%3Cpath d='M3 11V9a4 4 0 014-4h14M7 23l-4-4 4-4'/%3E%3Cpath d='M21 13v2a4 4 0 01-4 4H3'/%3E%3C/svg%3E")`
            }
            break
        case 'changevidname':
            getNameFile(event.data.text)
            break
        case 'TimeOfSong':
            getTime(event.data.total, event.data.played);
            break
    }
    if (event.data.userPlaylist != undefined) {
        let jsonData = JSON.parse(event.data.userPlaylist[0]).reverse()
        for (let i = 0; i < jsonData.length; i++) {
            let dbplaylist = {
                name: jsonData[i].songname,
                author: jsonData[i].author,
                image: jsonData[i].imageurl,
                url: jsonData[i].songurl
            }
            if (playlist.some(song => song.url === dbplaylist.url)) {
                refreshPlaylist()
            } else {
                playlist.push(dbplaylist)
                refreshPlaylist()
            }
        }
    }
});

function getTime(totaltime, timeplayed) {
    if (totaltime != undefined && timeplayed != undefined) {
        if (secondsToHms(timeplayed) > secondsToHms(totaltime)) {
            timeplayed = timeplayed - 1
        }
        $('.player').css('display', 'block')
        $("#startTime").html(secondsToHms(timeplayed))
        $("#endTime").html(secondsToHms(totaltime))
        $("#infoStartTime").html(secondsToHms(timeplayed))
        $("#infoEndTime").html(secondsToHms(totaltime))
        var percent = (timeplayed / totaltime) * 100;
        var progressBar = $('.progress')
        var progressBarLength = $('.progress').length
        for (let i = 0; i < progressBarLength; i++) {
            progressBar.css('width', percent + '%')
        }
    } else if (timeplayed == totaltime) {
        $('.player').css('display', 'none')
    } else {
        $('.player').css('display', 'none')
        $('#playerScreen').removeClass('active')
    }
}

function secondsToHms(d) {
    d = Number(d);
    var h = Math.floor(d / 3600);
    var m = Math.floor(d % 3600 / 60);
    var s = Math.floor(d % 3600 % 60);

    var hDisplay = h > 0 ? h + ":" : "";
    var mDisplay = m > 0 ? m + ":" : "0:";
    var sDisplay = "00"
    if (s > 0) {
        sDisplay = s
        if (s < 10) {
            sDisplay = "0" + s
        }
    }
    return (hDisplay + mDisplay + sDisplay);
}

function getNameFile(url) {
    if (url == undefined) {
        vidname = "Nothing";
        authorName = '';
        thumbUrl = '';
        document.getElementById("songTitle").innerHTML = vidname
    } else {
        $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: url }, function (data) {
            vidname = data.title;
            authorName = data.author_name;
            thumbUrl = data.thumbnail_url;
            whenDone(url);
        });
    }
}

var songName = ''
var author = ''
var image = ''
function getSongDetails(url) {
    if (url == undefined) {
        return null
    } else {
        $.getJSON('https://noembed.com/embed?url=', { format: 'json', url: url }, function (data) {
            songName = data.title;
            author = data.author_name;
            image = data.thumbnail_url;
            addToPlaylist(url)
        });
    }
}

var currentSong, totalSongs
totalSongs = playlist.length - 1

function addToPlaylist(url) {
    playlist.push({
        name: songName,
        author: author,
        image: image,
        url: url
    })
    refreshPlaylist()
    totalSongs = playlist.length - 1
    $.post(`https://${GetParentResourceName()}/addSong`, JSON.stringify({
        name: songName,
        author: author,
        image: image,
        url: url
    }));
}

$('#nextSong').click(function () {
    if (currentSong < totalSongs) {
        currentSong += 1
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    } else {
        currentSong = 0
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    }
})

$('#infoNext').click(function () {
    if (currentSong < totalSongs) {
        currentSong += 1
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    } else {
        currentSong = 0
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    }
})

$('#previousSong').click(function () {
    if (currentSong > 0) {
        currentSong -= 1
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    } else {
        currentSong = totalSongs
        url = playlist[currentSong].url
        PlayMusic(url, currentSong)
    }
})

const capitalize = (s) => {
    if (typeof s !== 'string') return ''
    return s.charAt(0).toUpperCase() + s.slice(1)
}

function whenDone(url) {
    if (vidname == undefined) {
        vidname = capitalize(GetFilename(url));
        if (vidname == "" || vidname == 'Www') {
            vidname = "Song not Found";
        }
    }
    document.getElementById("songTitle").innerHTML = vidname
    document.getElementById("infoTitle").innerHTML = vidname.substring(0, 20) + '...'
    document.getElementById("authorName").innerHTML = authorName
    document.getElementById("infoAutorName").innerHTML = authorName
    document.getElementById("songShadow").setAttribute("src", thumbUrl);
    document.getElementById("infoImage").setAttribute("src", thumbUrl);
    document.getElementById("songImage").setAttribute("src", thumbUrl);
}

function GetFilename(url) {
    if (url) {
        var m = url.toString().match(/.*\/(.+?)\./);
        if (m && m.length > 1) {
            return m[1];
        }
    }
    return "";
}

var doispontos = false

$(document).ready(function () {
    $('#main').hide();
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`https://${GetParentResourceName()}/action`, JSON.stringify({
                action: 'exit'
            }));
        }
    };
});