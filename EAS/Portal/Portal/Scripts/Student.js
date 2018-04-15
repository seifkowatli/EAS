

$(document).ready(function(){



    for (var i = 0; i < 2; i++) {
        $('#contanier').append('\
        <div class="accordion">\
        <h3 class="inner-tittle two">'+ i + '</h3>\
        <div class="panel-group tool-tips graph-form" id="accordion" role="tablist" aria-multiselectable="true">\
            <div class="panel-default">\
                <div class="panel-heading" role="tab" id="headingOne">\
                    <h4 class="panel-title">\
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed">\
                            Algorithms and Data structures\
                        </a>\
                    </h4>\
                </div>\
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">\
                    <div class="panel-body">\
                        <div class="col-md-offset-3 col-md-6 inner-grid-button">\
                            <div class="inner-share">\
                                <div class="share share_size_large share_type_twitter">\
                                    <span class="share__count">30</span>\
                                    <a class="share__btn" href="#">Practical</a>\
                                </div>\
                                <div class="share share_size_large share_type_facebook">\
                                    <span class="share__count">20</span>\
                                    <a class="share__btn" href="#">MidTerm</a>\
                                </div>\
                                <div class="share share_size_large share_type_gplus">\
                                    <span class="share__count">45</span>\
                                    <a class="share__btn" href="#">Final</a>\
                                </div>\
                            </div>\
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div >')


    }
    
})