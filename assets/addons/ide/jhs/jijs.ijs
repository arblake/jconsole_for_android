NB. J HTTP Server - ijs app - textarea version

coclass'jijs'
coinsert'jhs'

HBS=: 0 : 0
'<script src="~addons/ide/jhs/js/codemirror/codemirror.js"></script>'
'<link rel="stylesheet" href="~addons/ide/jhs/js/codemirror/codemirror.css">'
'<link rel="stylesheet" href="~addons/ide/jhs/js/codemirror/j/jtheme.css">'
'<script src="~addons/ide/jhs/js/codemirror/j/j.js"></script>'
jhma''
jhjmlink''
'action'    jhmg'action';1;10
 'runw'     jhmab'run         r^'
 'runwd'    jhmab'run display'
 'save'     jhmab'save        s^'
 'saveas'   jhmab'save as...'
 'undo'     jhmab'undo        z^'
 'redo'     jhmab'redo        y^'
'option'    jhmg'option';1;8
 'ro'       jhmab'readonly    t^'
 'numbers'  jhmab'numbers'
jhmz''

'saveasdlg'    jhdivadlg''
 'saveasdo'    jhb'save as'
 'saveasx'     jhtext'';10
  'saveasclose'jhb'X'
'<hr></div>'

'rep'         jhdiv'<REP>'

'filename'    jhhidden'<FILENAME>'
'filenamed'   jhdiv'<FILENAME>'

jhresize''

'ijs'         jhtextarea'<DATA>';20;10

'textarea'    jhhidden''
)

NB. y file
create=: 3 : 0
rep=.''
try.
 d=. (1!:1<y) rplc '&';'&amp;';'<';'&lt;'
catch.
 d=. ''
 rep=. 'WARNING: file read failed!'
end.
(jgetfile y) jhr 'FILENAME REP DATA';y;rep;d
)

jev_get=: 3 : 0
if. 'open'-:getv'mid' do.
 create getv'path' 
else.
 create jnew''
end.
)

save=: 3 : 0
if. #USERNAME do.
 fu=. jpath'~user'
 'save only allowed to ~user paths' assert fu-:(#fu){.y
end.
new=. toHOST getv'textarea'
old=. fread y
if. -._1-:old do. old=. toHOST old end.
if. new-:old do.
 smoutput'jijs not saved (unchanged): ',y
else.
 smoutput'jijs saved: ',y
end. 
new  fwrite y
)

ev_save_click=: 3 : 0
f=. jpath getv'filename'
try.
 save f
 jhrajax 'saved without error'
catch.
 jhrajax 'save failed'
end.
)

ev_runw_click=: 3 : 0
f=. jpath getv'filename'
try.
 save f
 if. 'runw'-:getv'jmid' do.
  load__ f
 else.
  loadd__ f
 end.
 smoutput'ran without error'  
 jhrajax 'ran without error'
catch.
 smoutput 'ran with error:',LF,13!:12''
 jhrajax 13!:12''
end.
)

ev_runwd_click=: ev_runw_click

ev_saveasdo_click=:ev_saveasx_enter

NB. should have replace/cancel option if file exists
ev_saveasx_enter=: 3 : 0
f=. getv'filename'
n=. getv'saveasx'
if. n-:n-.'~/' do.
 new=. (jgetpath f),n
else.
 new=. jpath n
end.
if. fexist new do. jhrajax 'file already exists' return. end.
try.
 save new
 jhrajax ('saved as ',n),JASEP,new
catch.
 jhrajax 'save failed'
end.
)

NB. new ijs temp filename
jnew=: 3 : 0
d=. 1!:0 jpath '~temp\*.ijs'
a=. 0, {.@:(0&".)@> _4 }. each {."1 d
a=. ": {. (i. >: #a) -. a
f=. <jpath'~temp\',a,'.ijs'
'' 1!:2 f
>f
)

NB. p{} klduge because IE inserts <p> instead of <br> for enter
NB. codemirror needs jresizeb without scroll
CSS=: 0 : 0
#rep{color:red}
#filenamed{color:blue;}
*{font-family:"courier new","courier","monospace";font-size:<PC_FONTSIZE>;}
p{margin:0;}
#jresizeb{overflow:visible;border:solid;border-width:1px;clear:left;}
)

JS=: 0 : 0
var ta,rep,readonly,saveasx,cm,dirty=false;

function ev_body_load()
{
 ce= jbyid("ijs");
 rep= jbyid("rep");
 ta= jbyid("textarea");
 saveasx=jbyid("saveasx");

 //! dresize();
 ce.focus();

 cm = CodeMirror.fromTextArea(ce,
  {lineNumbers: true,
   mode:  "j",
   tabSize: 1,
   gutter: false,
   onChange: setdirty,
   extraKeys: {
    "Ctrl-S": function(instance) { jscdo("save"); },
    "Ctrl-R": function(instance) { jscdo("runw"); }
   }
  }
 );
 ro(0!=ce.innerHTML.length);
 dresize();
}

window.onresize= dresize;

function dresize()
{
 // IE resize multiple frames sometimes gets id as null
 if(jbyid("jresizea")==null||jbyid("jresizeb")==null)return;
 var a= jgpwindowh(); // window height
 a-= jgpbodymh();     // body margin h (top+bottom)
 a-= jgpdivh("jresizea"); // header height
 a-= 5               // fudge extra
 a=  a<0?0:a;        // negative causes problems
 cm.setSize(jgpwindoww()-10,a);
}

//! should be in utiljs.ijs
function jgpwindoww()
{
 if(window.innerWidth)
  return window.innerWidth; // not IE
 else
  return document.documentElement.clientWidth;
}

window.onbeforeunload = confirmExit;
function setdirty(){dirty=true;}
function confirmExit(){return dirty?"Page has unsaved changes.":null;}

function setnamed()
{
  jbyid("filenamed").innerHTML=jbyid("filename").value;
}

function ro(only)
{
 readonly= only;
 cm.setOption('readOnly', readonly?true:false)
 cm.getWrapperElement().style.background= readonly?"#ddd":"#fff";
 cm.focus();
}

function click(){ta.value= cm.getValue().replace(/\t/g,' ');jdoajax(["filename","textarea","saveasx"]);dirty=false;}
function ev_save_click() {click();}
function ev_runw_click() {click();}
function ev_runwd_click(){click();}

function ev_undo_click(){cm.undo();}
function ev_redo_click(){cm.redo();}

function ev_saveasdo_click(){click();}
function ev_saveasx_enter() {click();}

function ev_saveas_click()     {jdlgshow("saveasdlg","saveasx");}
function ev_saveasclose_click(){jhide("saveasdlg");}

function ev_ro_click(){ro(readonly= !readonly);}
function ev_numbers_click()
{
 cm.setOption('lineNumbers',cm.getOption('lineNumbers')?false:true);
}

// called with ajax response
function ajax(ts)
{
 rep.innerHTML= ts[0];
 if(2==ts.length&&(jform.jmid.value=="saveasx"||jform.jmid.value=="saveasdo"))
 {
  jhide("saveasdlg");
  jbyid("filename").value=ts[1];
  setnamed();
  document.title=ts[0].substring(9);
 }
}

function ev_ijs_enter(){return true;}

function ev_z_shortcut(){cm.undo();}
function ev_y_shortcut(){cm.redo();}

function ev_t_shortcut(){jscdo("ro");}
function ev_r_shortcut(){jscdo("runw");}
function ev_s_shortcut(){jscdo("save");}
function ev_2_shortcut(){ce.focus();}
)
