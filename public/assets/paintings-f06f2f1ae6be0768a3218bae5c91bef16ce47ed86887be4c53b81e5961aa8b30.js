!function(){"use strict";var t={ratio:1.38,init:function(t){var i=this;document.addEventListener&&(this.el=document.getElementById(t),this.resize(),this.plugins(),window.addEventListener("resize",function(){var t=i.resize();$(i.el).turn("size",t.width,t.height)}))},resize:function(){this.el.style.width="",this.el.style.height="";var t=this.el.clientWidth,i=Math.round(t/this.ratio),e=Math.round(.9*window.innerHeight);return i>e&&(i=e,t=Math.round(i*this.ratio)),this.el.style.width=t+"px",this.el.style.height=i+"px",{width:t,height:i}},plugins:function(){$(this.el).turn({gradients:!0,acceleration:!0})}};t.init("book")}();