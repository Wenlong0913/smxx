note_id = 0;
win_height = 0;
music_player = null;
pop_up_note_mode = true;

text_prepared = false;
font_img = null;


// ---------------------------------------------------------------------
// sdk

function add_keyframes(name, cssbody)
{
    csstext = '@-webkit-keyframes ' + name + '{' + cssbody + '}';

    style = document.createElement('style');
    document.head.appendChild(style);
    sheet = style.sheet;
    sheet.insertRule(csstext, 0);
}

function create_imgdiv(url, idname, visible, x, y)
{
    imgdiv = document.createElement('div');
}

function objid(idname)
{
    return document.getElementById(idname);
}

function _kv(value)
{
    if(typeof(value) == 'undefined')
    {
        return false;
    }

    if(value == '')
    {
        return false;
    }

    if(value.charAt(0) == '#')
    {
        return false;
    }

    return true;
}

function _v(keyname)
{
    if(typeof(wedxt_data[keyname]) == 'undefined')
    {
        return '';
    }

    return wedxt_data[keyname];
}

// ---------------------------------------------------------------------
// text

function wedxt_init_async()
{
    read_base();
    create_textdiv();
    add_wedxt_icon();
    create_music();

}

function wedxt_init()
{
    document.body.style.margin = '0px';
    create_base();
    setTimeout("wedxt_init_async()", 500);
 }

function is_show_words()
{
    if(typeof(wedxt_data.show_words) == 'undefined')
    {
        return true;
    }

    if(wedxt_data.show_words != 'no')
    {
        return true;
    }

    return false;
}

function read_base()
{
    win_height = objid('basepoint').offsetTop;
}

function create_base()
{
    div = document.createElement('div');
    div.style.position = 'fixed';
    div.style.bottom = '0px';
    div.style.width = '1px';
    div.style.height = '1px';
    div.style.left = '-100px';
    div.id = 'basepoint';
    document.body.appendChild(div);
}

function make_text_animation()
{
    //if(!is_show_words())
    //    return;

    var mask = objid('textmask');
    var textdiv = objid('textdiv');

    if(wedxt_data.mode == 'up')
    {
        var keycss = 'from{-webkit-transform:translate(0px, ' + mask.offsetHeight + 'px);}' +
                 'to{-webkit-transform:translate(0px, -' + textdiv.offsetHeight + 'px);}' 

        add_keyframes('textdivani', keycss);

        var dt = (mask.offsetHeight + textdiv.offsetHeight) / wedxt_data.speed;

        textdiv.style.webkitAnimation = 'textdivani ' + dt + 's linear infinite';
    }
    else if(wedxt_data.mode == 'left')
    {
        var keycss = 'from{-webkit-transform:translate(' + mask.offsetWidth + 'px, 0px);}' +
                 'to{-webkit-transform:translate(-' + textdiv.offsetWidth + 'px, 0px);}' 

        add_keyframes('textdivani', keycss);

        var dt = (mask.offsetWidth + textdiv.offsetWidth) / wedxt_data.speed;

        textdiv.style.webkitAnimation = 'textdivani ' + dt + 's linear infinite';
    }
    else if (wedxt_data.mode == 'print')
    {
        onPrint();
        setTimeout("onPrintAni()", 1500);
    }
}
function onPrint()
{
    objid('textdiv').style.top = objid('textmask').offsetHeight;
    gPrText          = card_text();
    gOrgCardText       = card_text();

}

function onPrintAni()
{
    pushText = '';
    
    var reachEnd = 0;
    
    if(gPrText.length <1)
    {
        reachEnd = 1;
    }
    
    var cutlen = 0;

    if(gPrText.length >= 4 && gPrText.substring(0, 4) == '<br>')
    {
        gPrText  = gPrText .substring(4);
        pushText = '<br>';
        cutlen = 4;
    }
    else if(gPrText.substring(0, 2) == '/:')
    {
        result = ConvFaceOnBegin(gPrText );
        cutlen = result[1];
        if(cutlen > 0)
        {
            gPrText  = gPrText .substring(cutlen);
            pushText = result[0];
        }
    }
    
    if(cutlen == 0 && gPrText.length >= 1)
    {
        pushText   = gPrText.substring(0, 1);
        gPrText  = gPrText.substring(1);
    }

    objid('textdiv').innerHTML = objid('textdiv').innerHTML + pushText;
    //alert(objid('textmask').offsetHeight);
    if((objid('textdiv').offsetTop + objid('textdiv').offsetHeight)> objid('textmask').offsetHeight)
    {
        trans = objid('textmask').offsetHeight - objid('textdiv').offsetHeight;
        objid('textdiv').style.top = trans+ 'px';
        //alert(objid('textdiv').style.top);
    }

    if(reachEnd == 1)
    {
        //setTimeout("", 2000); 
        setTimeout("pauseShow()",4000);
    }
    else
    {
        var gSpeed = wedxt_data.speed;
        setTimeout("onPrintAni()", gSpeed);
    }
}
function pauseShow()
{
    reachEnd=0;
    trans = 0;
    objid('textdiv').style.top =trans+'px';
    gPrText              = gOrgCardText;
    objid('textdiv').innerHTML = "";
    setTimeout("onPrintAni()",1000);
}
function initViewport()
{
    if(/Android (\d+\.\d+)/.test(navigator.userAgent))
    {
        var version = parseFloat(RegExp.$1);

        if(version>2.3)
        {
            var phoneScale = parseInt(window.screen.width)/640;
            document.write('<meta name="viewport" content="width=640, minimum-scale = '+ phoneScale +', maximum-scale = '+ phoneScale +', target-densitydpi=device-dpi">');

        }
        else
        {
            document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');    
        }
    }
    else 
    {
        //document.write('<meta name="viewport" content="width=500, user-scalable=no, target-densitydpi=device-dpi">');
        document.write('<meta name="viewport" content="width=640, height=960,initial-scale=0.64" /> ');

    }
    document.write('<style>@-webkit-keyframes rotatemusic {from {-webkit-transform: rotate(0deg);}to { -webkit-transform: rotate(360deg);}}::-webkit-input-placeholder {color: #000;}</style>');
    
}

function show_textdiv()
{
        var box = wedxt_data.text_box.split(' ');

        var mask = document.createElement('div');
        mask.id = 'textmask';
        mask.style.position = 'absolute';
        mask.style.left     = box[0] + 'px';
        mask.style.top      = box[1] + 'px';
        mask.style.width    = box[2] + 'px';
        mask.style.height   = box[3] + 'px';
        mask.style.overflow = 'hidden';

        var textdiv = document.createElement('div');
        textdiv.id = 'textdiv';
        textdiv.style.position = 'absolute';
        textdiv.style.color = wedxt_data.text_color;
        textdiv.style.fontSize  = wedxt_data.font_size;
        textdiv.style.lineHeight = wedxt_data.line_height;
    	textdiv.style.fontWeight = '600';		
    	textdiv.style.fontFamily = '微软雅黑';
        textdiv.style.zIndex = 50000;

        if(_kv(wedxt_data.text_align))
        {
            textdiv.style.textAlign = wedxt_data.text_align;
        }

        if(_kv(wedxt_data.font_weight))
        {
            textdiv.style.fontWeight = wedxt_data.font_weight;
        }

        if(wedxt_data.mode == 'left')
        {
            textdiv.style.float = 'left';
        }

        document.body.appendChild(mask);    
        mask.appendChild(textdiv);

        set_up_words();
}

function create_textdiv()
{
    if(is_show_words())
    {
        show_textdiv();
    }
}

function set_up_words()
{

    textdiv = objid('textdiv');
    if (wedxt_data.mode=='print')
        textdiv.innerHTML = '';
    else
        textdiv.innerHTML = card_text();
    make_text_animation();
    
}

function on_font_img_load()
{
    if(!text_prepared)
    {
        text_prepared = true;
        var textdiv = objid('textdiv');
        textdiv.appendChild(font_img);
        make_text_animation();
    }
}

function on_check_font_img()
{
    if(!text_prepared)
    {
        var textdiv = objid('textdiv');
        text_prepared = true;
        textdiv.innerHTML = card_text();
        make_text_animation();
    }
}

function pure_card_text()
{
    text = wedxt_data.words;

    if(wedxt_data.replace_words != '#replace_words#')
    {
        text = wedxt_data.replace_words;
    }

    return text;
}

function card_text()
{
    text = pure_card_text();

    if((wedxt_data.mode == 'up')||(wedxt_data.mode == 'print'))
    {
        text = wrap_text(text);
    }
    else if(wedxt_data.mode == 'left')
    {
        text = '<nobr>' + text + '</nobr>';
    }

    return text;
}

function wrap_text(in_text)
{
    text = in_text.replace(/,/g, '<br>');
    text = text.replace(/，/g, '，<br>');
    text = text.replace(/\./g, '.<br>');
    text = text.replace(/。/g, '。<br>');
    text = text.replace(/;/g, ';<br>');
    text = text.replace(/；/g, '；<br>');
    text = text.replace(/!/g, '!<br>');
    text = text.replace(/！/g, '！<br>');
    text = text.replace(/～/g, '～<br>');
    text = text.replace(/：/g, '：<br>');
    text = text.replace(/:/g, ':<br>');
    return text;
}

// ---------------------------------------------------------------------
// wedxt icon

function add_wedxt_icon()
{
    url = 'http://www.wedxt.cn/templates/card/snow/images/bird.gif';

    div = document.createElement('div');
    img = document.createElement('img');
    img.src = url;
    div.appendChild(img);

    div.style.position = 'fixed';
    div.style.top = (win_height - 96) + 'px';
    //div.style.top = (700 - 20) + 'px';
    div.style.right = '0px';
    div.style.zIndex = '10000';
    //div.style.left = '10px';
    //alert('wedxt');
    div.onclick = goto_wedxt;

    document.body.appendChild(div);
}

function goto_wedxt()
{
    location.href = 'http://www.wedxt.com/?from=snow';
}

// ---------------------------------------------------------------------
// wedxt music

function startifsound(){
    au = music_player
    if(au.paused)
    {
        au.play();
    }
}

var bplay = 0;              //记录是否要播放音乐
function switchsound()
{
    
    au = music_player
    ai = objid('sound_image');
    if(au.paused)
    {
        bplay = 1;
        au.play();
        ai.src = "http://www.wedxt.cn/templates/card/snow/images/music_note_big.png";
        pop_up_note_mode = true;
        popup_note();
        objid("music_txt").innerHTML = "打开";
        objid("music_txt").style.visibility = "visible";
        setTimeout(function(){objid("music_txt").style.visibility="hidden"}, 2500);
    }
    else
    {
        bplay = 0;
        pop_up_note_mode = false;
        au.pause();
        ai.src = "http://www.wedxt.cn/templates/card/snow/images/music_note_big.png";
        objid("music_txt").innerHTML = "关闭";
        objid("music_txt").style.visibility = "visible";
        setTimeout(function(){objid("music_txt").style.visibility="hidden"}, 2500);
    }
}

function create_music()
{
    music = wedxt_data.music;

    if(wedxt_data.replace_music != '#replace_music#')
    {
        music = wedxt_data.replace_music;
    }

    music_player = document.createElement('audio');
    music_player.src = music;
    music_player.loop = 'loop';
    music_player.play();
    bplay = 1;

    sound_div = document.createElement("div");
    sound_div.setAttribute("ID", "cardsound");
    sound_div.style.cssText = "position:fixed;right:20px;top:25px;z-index:50000;visibility:visible;";
    sound_div.onclick = switchsound;
    bg_htm = "<img id='sound_image' src='http://www.wedxt.cn/templates/card/snow/images/music_note_big.png'>";
    box_htm = "<div id='note_box' style='height:100px;width:44px;position:absolute;left:0px;top:-80px'></div>";
    txt_htm = "<div id='music_txt' style='color:white;position:absolute;left:-40px;top:30px;width:60px'></div>"
    sound_div.innerHTML = bg_htm + box_htm + txt_htm;
    document.body.appendChild(sound_div);
    setTimeout("popup_note()", 100);
}   
function on_pop_note_end(event)
{
    note = event.target;
    
    if(note.parentNode == objid("note_box"))
    {
        objid("note_box").removeChild(note);
    }
}

function popup_note()
{
    box = objid("note_box");
    
    note = document.createElement("span");
    note.style.cssText = "visibility:visible;position:absolute;background-image:url('http://www.wedxt.cn/templates/card/snow/images/music_note_small.png');width:15px;height:25px";
    note.style.left = Math.random() * 20 + 20;
    note.style.top = "75px";
    this_node = "music_note_" + note_id;
    note.setAttribute("ID", this_node);
    note_id += 1;
    scale = Math.random() * 0.4 + 0.4;
    note.style.webkitTransform = "rotate(" + Math.floor(360 * Math.random()) + "deg) scale(" + scale + "," + scale + ")";
    note.style.webkitTransition = "top 2s ease-in, opacity 2s ease-in, left 2s ease-in";
    note.addEventListener("webkitTransitionEnd", on_pop_note_end);
    box.appendChild(note);

    setTimeout("document.getElementById('" + this_node + "').style.left = '0px';", 100);
    setTimeout("document.getElementById('" + this_node + "').style.top = '0px';", 100);
    setTimeout("document.getElementById('" + this_node + "').style.opacity = '0';", 100);
    
    if(pop_up_note_mode)
    {
        setTimeout("popup_note()", 600);
    }   
}

// ---------------------------------------------------------------------
// weixin

// function get_host()
// {
//    return 'wedxt.com';
// }

// function share_url()
// {
//     var url = "http://www.wedxt.com"
//     return url;
// }

// function share_data()
// {
// var desc = '';

//     if(_v('user_desc') != '')
//     {
//         desc = _v('user_desc');
//     }
//     else
//     {
//         desc = wedxt_data.desc;

//         if(wedxt_data.replace_words != '#replace_words#')
//         {
//             desc = wedxt_data.replace_words;
//         }        
//     }


//     return{
//         'img_url'    : wedxt_data.icon,
//         'img_width'  : '640',
//         'img_height' : '640',
//         'link'       : share_url(),
//         'desc'       : desc,
//         'title'      : wedxt_data.title
//     }
// }

// function share_data_timeline()
// {
// 	var desc = '';

//     if(_v('user_desc') != '')
//     {
//         desc = _v('user_desc');
//     }
//     else
//     {
// 	    desc = wedxt_data.desc;
// 	    if(wedxt_data.replace_words != '#replace_words#')
// 	    {
// 	        desc = wedxt_data.replace_words;	    
// 		}
//     }

//     return{
//         'img_url'    : wedxt_data.icon,
//         'img_width'  : '640',
//         'img_height' : '640',
//         'link'       : share_url(),
//         'desc'       : desc,
//         'title'      : desc
//     }
// }

// function on_weixin_reply(res)
// {
//     switch(res.err_msg)
//     {
//         case "share_timeline:confirm":
//         case "share_timeline:ok":
//         case "send_app_msg:confirm":
//         case "send_app_msg:ok":
//             location.href="http://www.wedxt.com"
//             break;
//     }
// }

// function on_weixin_ready()
// {
//         WeixinJSBridge.on('menu:share:appmessage', function(argv){
//             WeixinJSBridge.invoke('sendAppMessage', share_data(), on_weixin_reply);
//         });

//         WeixinJSBridge.on('menu:share:timeline', function(argv){
//             WeixinJSBridge.invoke('shareTimeline', share_data_timeline(), on_weixin_reply);
//         });

// }

// document.addEventListener('WeixinJSBridgeReady', on_weixin_ready, false);

// ---------------------------------------------------------------------
// modify
