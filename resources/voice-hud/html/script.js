$(function() {
    let height = 25.5;
    window.addEventListener("message", function(event) {
        if (event.data.type == "updateStatusHud") {
    let voice = event.data.varSetVoice;
    $(".voice3").addClass("hidden");
    $(".voice2").addClass("hidden");
      $(".voice1").addClass("hidden");
      $(".dev").addClass("hidden");
      $(".devDebug").addClass("hidden");
      if (voice == 1) {
        $(".voice3").removeClass("hidden");
      }
      if (voice == 2) {
        $(".voice3").removeClass("hidden");
        $(".voice2").removeClass("hidden");
     }
      if (voice == 3) {
        $(".voice3").removeClass("hidden");
        $(".voice2").removeClass("hidden");
        $(".voice1").removeClass("hidden");
      }
        } else if (event.data.type == "talkingStatus") {
            if (event.data.is_talking) {
              $(".voice").addClass("talking");
            } else {
              $(".voice").removeClass("talking");
            }
          } else if (event.data.type == "transmittingStatus") {
            if (event.data.is_transmitting) {
              $(".voice").addClass("transmitting");
            } else {
              $(".voice").removeClass("transmitting");
            }
        }
    });

    function widthHeightSplit(value, ele) {
        let eleHeight = (value / 100) * height;
        let leftOverHeight = height - eleHeight;

        ele.attr(
            "style",
            "height: " + eleHeight + "px; top: " + leftOverHeight + "px;"
        );
    }

    function changeColor(ele, value, flip) {
        let add = false;
        if (flip) {
            if (value > 85) {
                add = true;
            }
        } else {
            if (value < 25) {
                add = true;
            }
        }
    }
});


function Progress(percent, element) {
    var circle = document.querySelector(element);
    var radius = circle.r.baseVal.value;
    var circumference = radius * 2 * Math.PI;
    var html = $(element).parent().parent().find("span");

    circle.style.strokeDasharray = `${circumference} ${circumference}`;
    circle.style.strokeDashoffset = `${circumference}`;

    const offset = circumference - ((-percent * 99) / 100 / 100) * circumference;
    circle.style.strokeDashoffset = -offset;

    html.text(Math.round(percent));
}