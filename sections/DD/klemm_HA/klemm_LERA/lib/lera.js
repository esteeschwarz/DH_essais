window.onload = function () {
      // handle collapse buttons
      var coll = document.getElementsByClassName("btn-ml-menu");
      var i;

      for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
          //this.classList.toggle("active");
          var content = this.previousElementSibling;
          if (content.style.maxHeight){
            content.style.maxHeight = null;
            this.innerHTML = "⮟";
          } else {
            content.style.maxHeight = content.scrollHeight + "px";
            this.innerHTML = "⮝";
          }
        });
      }

  // initialize CATview
  CATview.initialize();
  CATview.names = catview_data.names;
  CATview.edges = catview_data.edges;
  CATview.extra_segments = catview_data.extra_segments;
  CATview.set_edge_names(catview_data.edge_names);
  CATview.set_click_on_edge_callback(function(_wit, _edge){
    const element = document.querySelectorAll('.micro_level')[_edge]
    const y = element.getBoundingClientRect().top + window.pageYOffset - 250;
    window.scrollTo({top: y, behavior: 'smooth'});
  });

  // add the scroll spy
  // remember the last edge and the position of the scroll bar
  var scroll_pos = 0;
  var last_offset_top = 0;
  // react on scrolling
  window.onscroll = function(){
    // get all edges and do nothing if there are non
    var edges = document.querySelectorAll('.micro_level');
    if(edges.length < 0)
      return false;

    // get the current position of the scrollbar
    var offset_top = window.pageYOffset;

    // calculate the offset between the last edge and the scroll bar
    var offset_pos = Math.abs(edges[scroll_pos].offsetTop - offset_top);

    // get the next edge in scrolling direction and break if there is non
    var edge = offset_top > last_offset_top ? scroll_pos + 1 : scroll_pos - 1;
    if(edge < 0 || edge >= edges.length)
      return true;

    // calculate the offset between the this edge and the scroll bar
    var offset_edge = Math.abs(edges[edge].offsetTop - offset_top);

    // while finding edges with less offset, repeat the code above
    while(offset_edge < offset_pos){
      scroll_pos = edge;
      offset_pos = Math.abs(edges[scroll_pos].offsetTop - offset_top);
      edge = offset_top > last_offset_top ? scroll_pos + 1 : scroll_pos - 1;
      if(edge < 0 || edge >= edges.length)
        break;
      offset_edge = Math.abs(edges[edge].offsetTop - offset_top);
    }
    // remember the current position of the scroll bar
    last_offset_top = offset_top;
    // refresh the scroll spy in CATview
    CATview.draw_scroll_spy(parseInt(scroll_pos));
    return true;
  }; 

  CATview.draw_svg();

};

