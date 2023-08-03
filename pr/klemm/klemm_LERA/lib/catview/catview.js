/*
 The MIT License (MIT)

 Copyright (c) 2015-2021 Marcus Pöckelmann

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

// CATview - the Colored & Aligned Texts view
// version 2.1
const CATview = new function() {
  this.debug = false;

  // initialize attributes
  this.initialize = function(_orientation, _x_inverted, _y_inverted){
    if(CATview.debug)
      console.log('CATview.initialize');

    CATview.version = '2.1';

    // id of the parent container that will include CATview
    CATview.parent_id = 'CATview';

    // function that will be called when a rectangle was clicked (wit, edge passed as argument)
    CATview.click_on_edge_callback = null;

    // basic svg settings
    CATview.svg = null;
    CATview.width_svg = document.getElementById('CATview').offsetWidth;
    CATview.height_svg = document.getElementById('CATview').offsetHeight;

    // CATviews orientation
    CATview.orientation = ['left', 'right', 'bottom'].indexOf(_orientation) == -1 ? 'top' : _orientation;
    CATview.vertical = (CATview.orientation == 'left' || CATview.orientation == 'right');
    CATview.x_inverted = (typeof _x_inverted === 'undefined') ? false : _x_inverted;  // setting: default order of edges (false → left/top, true → right/bottom)
    CATview.y_inverted = (typeof _y_inverted === 'undefined') ? false : _y_inverted;  // setting: default order of witnesses (false → top/left, true → bottom/right)

    // content settings
    CATview.content = null;
    CATview.space_for_egdes_axis = 24;   // reserved drawing size of the edges axis
    CATview.space_for_names_axis = 4;    // reserved drawing size of the name axis (more size is in respect to the actual names is added in .draw_svg)
    CATview.space_for_tool_icons = 22;   // reserved drawing size for tool icons
    CATview.space_for_other = 2;         // reserved size opposite to the edges axis
    CATview.margin = {left: 0, top: 0, right: 0, bottom: 0};
    CATview.width_content = null;
    CATview.height_content = null;
    CATview.edgesAxis = null;
    CATview.edge_name = null;
    CATview.font_size_x = 10;
    CATview.font_size_y = 14;
    CATview.rect_width = null;
    CATview.rect_height = null;
    CATview.rect_h_margin = null;
    CATview.rect_v_margin = null;
    CATview.rect_stroke = null;
    CATview.rect_border = "stroke: #2f2f86;";
    CATview.scroll_spy_pos = 1;   // default position of the scroll spy
    CATview.display_remaining_edges = false;    // setting: should remaining alignment edges be displayed
    CATview.threshold = 50;                     // setting: for which degree of difference remaining alignment edges should be displayed
    CATview.display_extra_segments = true;      // setting: should extra_segments be displayed
    CATview.search_mode = 'seg';       // setting: highlight search results for full columns ('col' )or individual segments ('seg')
    CATview.tools = [];                         // pairs of font-awesome-unicodes and callbacks

    CATview.brush = null;
    CATview.display_brush = false;
    CATview.brush_from_edge = -1;
    CATview.brush_to_edge = -1;
    CATview.brush_from_name = -1;
    CATview.brush_to_name = -1;
    CATview.brush_callback = null;

    // zooming parameters
    CATview.zoom = null;    // the d3 object for zooming
    CATview.from = 1;      // positions of edges to display
    CATview.to = 1;
    CATview.from_pixel = 0;      // pixel-position in scale_edges_original of edges to display
    CATview.to_pixel = 0;
    CATview.scale = 1;     // current zooming factor
    CATview.translate = 0; // current translation for zoomed-in excerpt

    // data
    CATview.names = [];     // array with witnesses names (number of rows)
    CATview.edges = [];     // array with alignment edges (number of columns) - contains arrays with one entry for each row
    CATview.search_results = [];  // array with column ids to be highlighted as search results
    CATview.remaining_edges = []; // array with supposed edges that could not be aligned - entries: [distance, [ [[row, col], [row, col]]+ ]]
    CATview.extra_segments = [];  // same structure as edges - will be displayed faded out (gray dotted without filling)
    CATview.edge_names = [];      // array of the edges' names, displayed on mouse over

    // scales to map the elements to the available pixels
    CATview.scale_edges = null;   // map [from, to]
    CATview.scale_names = null;   // map the names
    CATview.scale_edges_original = null;  // map [0, n-1]
    // a scale for the color
    CATview.scale_color = d3.scaleLinear().domain([0, 1]).range(["#C1C1E9", "#0000A3"]);
    CATview.equality_color = '#d9d9d9';
    CATview.use_equality_color = true;
    //CATview.color = d3.scaleLinear().domain([0, 1]).range(["#b8b8b8", "#000"]);
    //CATview.color = d3.scaleLinear().domain([0, 1]).range(["#7CCF7C", "c0c"]);
  };

  // method to set margins and content width/height according to the current orientation of CATview and its axis
  this.set_margins = function(){
    if(CATview.debug)
      console.log('CATview.set_margins');

    if(CATview.vertical){
      // handle place of names axis and tool icons in respect to the edges axis direction for vertical orientation of CATview
      CATview.margin.top = CATview.x_inverted ? CATview.space_for_tool_icons : CATview.space_for_names_axis;
      CATview.margin.bottom = CATview.x_inverted ? CATview.space_for_names_axis : CATview.space_for_tool_icons;
      // handle place of the edges axis according to the (left or right) orientation of CATview
      CATview.margin.left = CATview.orientation == 'left' ? CATview.space_for_other : CATview.space_for_egdes_axis;
      CATview.margin.right = CATview.orientation == 'left' ? CATview.space_for_egdes_axis : CATview.space_for_other;
    } else {
      // handle place of the edges axis according to the (top or bottom) orientation of CATview
      CATview.margin.top = CATview.orientation == 'top' ? CATview.space_for_other : CATview.space_for_egdes_axis;
      CATview.margin.bottom = CATview.orientation == 'top' ? CATview.space_for_egdes_axis : CATview.space_for_other;
      // handle place of names axis and tool icons in respect to the edges axis direction for horizontal orientation of CATview
      CATview.margin.left = CATview.x_inverted ? CATview.space_for_tool_icons : CATview.space_for_names_axis;
      CATview.margin.right = CATview.x_inverted ? CATview.space_for_names_axis : CATview.space_for_tool_icons;
    }

    // set the available width and height for the content in respect to the margin
    CATview.width_content   = CATview.width_svg - CATview.margin.left - CATview.margin.right;
    CATview.height_content  = CATview.height_svg - CATview.margin.top - CATview.margin.bottom;
  };
  // method to set scales according to the current orientation of CATview and its axis
  this.set_scale_x = function(_from, _to){
    if(CATview.debug)
      console.log('CATview.set_scale_y');

    if(CATview.vertical){
      // vertical orientation (left, right)
      if(CATview.x_inverted){
        // inverted egdes axis (starting bottom)
        CATview.scale_edges = d3.scaleLinear().domain([_from, _to]).range([CATview.height_content, 0]);
      } else {
        // normal edges axis (starting top)
        CATview.scale_edges = d3.scaleLinear().domain([_from, _to]).range([0, CATview.height_content]);
      }
    } else {
      // horizontal orientation (top, bottom)
      if(CATview.x_inverted){
        // inverted egdes axis (starting right)
        CATview.scale_edges = d3.scaleLinear().domain([_from, _to]).range([CATview.width_content, 0]);
      } else {
        // normal edges axis (starting left)
        CATview.scale_edges = d3.scaleLinear().domain([_from, _to]).range([0, CATview.width_content]);
      }
    }
  };
  this.set_scale_y = function(){
    if(CATview.debug)
      console.log('CATview.set_scale_y');

    if(CATview.vertical){
      // vertical orientation (left, right)
      if(CATview.y_inverted){
        // inverted names axis (starting right)
        CATview.scale_names = d3.scaleLinear().domain([-0.5, CATview.names.length - 0.5]).range([CATview.width_content, 0]);
      } else {
        // normal names axis (starting left)
        CATview.scale_names = d3.scaleLinear().domain([-0.5, CATview.names.length - 0.5]).range([0, CATview.width_content]);
      }
    } else {
      // horizontal orientation (top, bottom)
      if(CATview.y_inverted){
        // inverted names axis (starting bottom)
        CATview.scale_names = d3.scaleLinear().domain([-0.5, CATview.names.length - 0.5]).range([CATview.height_content, 0]);
      } else {
        // normal names axis (starting top)
        CATview.scale_names = d3.scaleLinear().domain([-0.5, CATview.names.length - 0.5]).range([0, CATview.height_content]);
      }
    }
  };

  // query new data from the server and call draw_svg
  // this requires jQuery
  this.server_update = function (url, callback){
    if(CATview.debug)
      console.log('CATview.server_update');

    $.ajax({type: 'get', url: url, dataType: 'json'}).done(function (data) {
      if(CATview.debug)
        console.log(data);
      CATview.names = data.names;
      CATview.edges = data.edges;
      CATview.remaining_edges = data.remaining_edges;
      CATview.extra_segments = data.extra_segments;
      CATview.edge_names = data.edge_names;

    }).done(function() {
      // todo check whether the data is valid
      CATview.scale = 1;      // current zooming factor
      CATview.translate = 0;  // current translation for zoomed-in excerpt
      CATview.draw_svg();
      if (callback) {
        callback();
      }
    });
  };

  // slight change of the data
  this.data_change = function(changes){
    if(CATview.debug)
      console.log('CATview.data_change');

    if(CATview.content) {
      // changes should be an array with entries in the following form
      //  ['replace', col, edge]
      //  ['insert', col, edge]
      //  ['remove', col]
      // where 'col' is the index of the column and 'edge' the change information, i.e. an array with color values for each row at this col
      if (!(Object.prototype.toString.call( changes ) === '[object Array]'))    // changes could be a string if passed from Rails
        changes = eval(changes);
      if (Object.prototype.toString.call( changes ) === '[object Array]') {
        for (let i = 0; i < changes.length; i++) {
          // todo check the data types
          // todo search_results on replace (keyword needed)
          // todo remaining_edges (insert, remove)
          let type = changes[i][0];
          let col = changes[i][1];
          switch (type) {
            case 'replace':
              CATview.edges[col] = changes[i][2][0];
              break;
            case 'insert':
              CATview.edges.splice(col, 0, changes[i][2][0]);
              // update the search results
              for (let j = 0; j < CATview.search_results.length; j++) {
                if (CATview.search_results[j][0] > col)
                  CATview.search_results[j][0] += 1;
              }
              // update the brush if displayed
              // TODO
              break;
            case 'remove':
              CATview.edges.splice(col, 1);
              // update the search results
              for (let j = CATview.search_results.length - 1; j >= 0; j--) {
                if (CATview.search_results[j][0] > col)
                  CATview.search_results[j][0] -= 1;
                else if (CATview.search_results[j][0] == col)
                  CATview.search_results.splice(j, 1);

              }
              // update the brush if displayed
              // TODO
              break;
            default:
              console.log('CATview.data_change: unknown kind of change (' + changes[i][0] + ')');
              break;
          }
        }

        CATview.set_scale_x(0, CATview.edges.length + 1)
        CATview.scale_edges_original = CATview.scale_edges.copy();
        CATview.refresh_content(CATview.from, CATview.to);
        return true;
      }
      else
        return false;
    }
    else
      return false;
  };

  // draw the initial svg that contains CATview and call refresh_content
  this.draw_svg = function () {
    if(CATview.debug)
      console.log('CATview.draw_svg');

    // remove previous content and add the svg-element to the parent
    document.getElementById(CATview.parent_id).innerHTML = '';
    CATview.svg = d3.select('#' + CATview.parent_id).insert("svg", ":first-child").attr('width', CATview.width_svg).attr('height', CATview.height_svg);

    // determine the necessary padding before the names-axis in respect to the names
    let names_offset = 0;
    if(CATview.names.length > 0){
      CATview.svg.append("g")
      .attr('id', 'CATview_prerendered_names')
      .selectAll("text")
      .data(CATview.names)
      .enter().append("text")
      .text(function (d) {return d})
      .attr('font-size', CATview.font_size_y);
      // get the dimension of the longest text and add 2 pixels padding
      let names = document.querySelectorAll('#CATview_prerendered_names text');
      for(let i = 0; i < names.length; i++){
        if(names_offset < names[i].getComputedTextLength())
          names_offset = names[i].getComputedTextLength();
      }
      CATview.space_for_names_axis += names_offset;
      //// than remove this temporary elements
      let element = document.getElementById('CATview_prerendered_names');
      element.parentNode.removeChild(element);
    }

    // initialize margins as well as width and height for the content
    CATview.set_margins();

    // initialize the scales
    CATview.set_scale_x(0, CATview.edges.length + 1)
    CATview.scale_edges_original = CATview.scale_edges.copy();
    CATview.set_scale_y()

    // add some zebra stripes
    CATview.svg.append("g").attr("class", "zebra");
    CATview.draw_zebra_stripes();

    // add the names-axis
    CATview.svg.append("g").attr("class", "axis names-axis");
    CATview.draw_names_axis();

    // add the group of tool icons
    CATview.svg.append("g").attr("class", "tool-icons");
    CATview.draw_tool_icons();

    // add a group for the content and its zoom behavior
    CATview.content = CATview.svg.append("g")
    .attr("class", "content")
    .attr("transform", "translate(" + CATview.margin.left + "," + CATview.margin.top + ")");

    // add the zooming behavior
    CATview.zoom = d3.zoom().on("zoom", CATview.zooming);
    CATview.set_max_zoom();
    CATview.content.call(CATview.zoom);

    // the zoom needs an element over the contents' complete size
    CATview.content.append('rect')
    .attr('width', CATview.width_content)
    .attr('height', CATview.height_content)
    .attr('style', 'fill-opacity: 0.0;');

    // add the edges-axis
    CATview.content.append("g").attr("class", "axis edges-axis");
    CATview.draw_edges_axis();

    // add containers for different groups of content
    CATview.content.append("g").attr("class", "search_results_background");
    CATview.content.append("g").attr("class", "alignment");
    CATview.content.append("g").attr("class", "search_results_foreground");
    CATview.content.append("g").attr("class", "remaining_edges");
    //CATview.content.append("g").attr("class", "brush");

    // set default interval of data to be shown and draw the content
    CATview.from_pixel = 0;
    CATview.to_pixel = CATview.vertical == true ? CATview.height_content : CATview.width_content;
    CATview.refresh_content(1, CATview.edges.length);

    // append the brush, if it was enabled prior the call of draw_svg
    CATview.draw_brush();
    // todo may also draw search result here

    // append box to display an edges name on hover
    CATview.edge_name = d3.select("#CATview").append("div").attr("class", "edge-name" + " edge-name-" + CATview.orientation);
  };

  // define the interval of edges and refresh the content afterwards
  this.refresh_content = function(from, to){
    if(CATview.debug)
      console.log('CATview.refresh_content');

    if(CATview.content){
      if (from != null) CATview.from = from;
      if (from == 0) CATview.from = 1;
      if (to != null)   CATview.to = to;
      // refresh the edges-scale (with one bin offset)
      CATview.set_scale_x(Math.max(CATview.from - 1, 0), Math.min(CATview.to + 1, CATview.edges.length + 1))

      CATview.draw_alignment();
      CATview.draw_extra_segments();
      CATview.draw_search_results();
      CATview.draw_scroll_spy();
      CATview.draw_remaining_edges();
    }
    else
      return false;
  };

  // draw the axis
  this.draw_edges_axis = function(){
    if(CATview.debug)
      console.log('CATview.draw_edges_axis');

    let edges_axis = CATview.svg.select(".edges-axis");
    edges_axis.selectAll('*').remove(); // remove the current content

    let pos_x = 0;
    let pos_y = 0;
    switch(CATview.orientation) {
      case 'left':
        CATview.edgesAxis = d3.axisRight(CATview.scale_edges);
        pos_x = CATview.width_content;
        break;
      case 'right':
        CATview.edgesAxis = d3.axisLeft(CATview.scale_edges);
        break;
      case 'bottom':
        CATview.edgesAxis = d3.axisTop(CATview.scale_edges);
        break;
      default:
        // numbers of edges at the bottom for top orientation of CATview
        CATview.edgesAxis = d3.axisBottom(CATview.scale_edges);
        pos_y = CATview.height_content;
    }
    edges_axis
    .attr("transform", "translate(" + pos_x + "," + pos_y + ")")
    .call(CATview.edgesAxis);
  };
  this.draw_names_axis = function(){
    if(CATview.debug)
      console.log('CATview.draw_names_axis')

    let names_axis = CATview.svg.select(".names-axis");
    names_axis.selectAll('*').remove(); // remove the current content

    // place the names axis
    if(CATview.x_inverted)
      if(CATview.vertical)
        names_axis.attr("transform", "translate(" + CATview.margin.left + ", " + (CATview.height_svg - CATview.margin.bottom) + ")");
      else
        names_axis.attr("transform", "translate(" + (CATview.width_svg - CATview.margin.right) + ", " + CATview.margin.top + ")");
    else
      names_axis.attr("transform", "translate(" + CATview.margin.left + ", " + CATview.margin.top + ")");

    // add the names
    let anchor = 'end';
    if(CATview.vertical){
      if((CATview.orientation == 'left' && CATview.x_inverted) || (CATview.orientation == 'right' && CATview.x_inverted == false))
        anchor = 'start';

      names_axis.selectAll("text")
        .data(CATview.names)
        .enter().append("text")
        .text(function (d) {return d})
        .attr("x", function(d, i) {return CATview.scale_names(i)})
        .attr("style", "text-anchor: " + anchor + ";")
        .attr('font-size', CATview.font_size_y)
        .attr("transform", function(d, i) {
          // rotate for 90 degrees than move the names a bit to the right to make them centered
          return 'rotate(' + (CATview.orientation == 'left' ? 90 : -90) + ', ' + CATview.scale_names(i) + ', 0)translate(0,' + (CATview.font_size_y/2) + ')';
        });
    } else {
      if(CATview.x_inverted)
        anchor = 'start';
      names_axis.selectAll("text")
        .data(CATview.names)
        .enter().append("text")
        .text(function (d) {return d})
        .attr("y", function(d, i) {return CATview.scale_names(i) + 5 }) // a little offset due to font size
        .attr("style", "text-anchor: " + anchor + ";")
        .attr('font-size', CATview.font_size_y);
    }
  };

  // draws the zebra stripes (gray lines in the background for every second text)
  this.draw_zebra_stripes = function(){
    if(CATview.debug)
      console.log('CATview.draw_zebra_lines')

    let zebra = CATview.svg.select(".zebra");
    zebra.selectAll('*').remove();  // remove the current content

    let width, height;
    if(CATview.vertical){
      height = CATview.height_svg - CATview.space_for_tool_icons;
      width = Math.floor(CATview.width_content / CATview.names.length * 0.5)

    } else {
      width = CATview.width_svg - CATview.space_for_tool_icons;
      height = Math.floor(CATview.height_content / CATview.names.length * 0.5);
    }

    let offset = CATview.x_inverted ? CATview.space_for_tool_icons : 0

    zebra.selectAll("rect")
      .data(CATview.names)
      .enter().append("rect")
      .attr("class", "rect-zebra")
      .attr("width", width )
      .attr("height", height)
      .attr('x', CATview.vertical == true ? function(d, i) {return CATview.scale_names(i) - width / 2.0 + CATview.margin.left} : offset)
      .attr('y', CATview.vertical == true ? offset : function(d, i) {return CATview.scale_names(i) - height / 2.0 + CATview.margin.top})
      .attr("fill", function(d,i) { return i%2==1 ? "#e8e8e8":"transparent";})
  };

  // draws the icons for tools included in CATview.tools
  this.draw_tool_icons = function(){
    if(CATview.debug)
      console.log('CATview.draw_tool_icons')

    let toolicons = CATview.svg.select(".tool-icons");
    toolicons.selectAll('*').remove();  // remove the current content

    let margin = 3;     // extra margin around the tool icon conatiner
    let width, height;  // available space for the tool icon container

    // place the container for the tool icons
    if(CATview.vertical == true){
      width = CATview.width_svg - CATview.margin.left - CATview.margin.right - 2 * margin;
      height = CATview.space_for_tool_icons - 2 * margin;
      if(CATview.x_inverted)
        toolicons.attr("transform", "translate(" + (CATview.margin.left + margin) + ", " + margin + ")");
      else
        toolicons.attr("transform", "translate(" + (CATview.margin.left + margin) +  ", " + (CATview.height_svg - CATview.margin.bottom + margin) + ")");
    } else {
      width = CATview.space_for_tool_icons - 2 * margin;
      height = CATview.height_svg - CATview.margin.top - CATview.margin.bottom - 2 * margin;
      if(CATview.x_inverted)
        toolicons.attr("transform", "translate(" + margin + ", " + (CATview.margin.top + margin) + ")");
      else
        toolicons.attr("transform", "translate(" + (CATview.width_svg - CATview.margin.right + margin) +  ", " + (CATview.margin.top + margin) + ")");
    }
    /*toolicons.append('rect')
      .attr("x", -margin)
      .attr("y", -margin)
      .attr("width", width + 2 * margin)
      .attr("height", height + 2 * margin)
      .attr('fill', '#ccccff');
    toolicons.append('rect')
      .attr("x", 0)
      .attr("y", 0)
      .attr("width", width)
      .attr("height", height)
      .attr('fill', '#8888ff');*/

    let n = CATview.tools.length;  // number of tool icons to be placed
    if(n > 0) {
      let padding = 12;
      let fontsize;
      if(CATview.vertical){
        fontsize = (width - (n-1)*padding) / n;
        if(height < fontsize){
          fontsize = height;
          padding = (width - n * fontsize) / (n-1)
        }
      } else {
        fontsize = (height - (n-1)*padding) / n;
        if(width < fontsize){
          fontsize = width;
          padding = (height - n * fontsize) / (n-1)
        }
      }

      for(let i = 0; i < CATview.tools.length; i++){
        let x, y;
        if(CATview.vertical == true){
          x =  i * (fontsize + padding) + fontsize/2;
          y = fontsize/2;
        } else {
          x = fontsize/2;
          y =  i * (fontsize + padding) + fontsize/2;
        }

        toolicons.append('text')
        .attr("class", "tool-icon")
        .attr("x", x)
        .attr("y", y)
        .attr("style", "text-anchor: middle; dominant-baseline: middle;")
        .attr("font-family","FontAwesome")
        //.attr("textLength", fontsize)
        //.attr("lengthAdjust","spacingAndGlyphs")
        .text(String.fromCharCode(parseInt(CATview.tools[i][0], 16)))
        .attr('font-size', fontsize - 4)
        .attr("transform", (function(){ return 'rotate(' + CATview.tools[i][2] + ' ' + x + ' ' + y + ')' }))
        .on("click", CATview.tools[i][1]);
      }
    }
  };

  // draws the alignment as colored rectangles as well as the edges-axis
  this.draw_alignment = function (){
    if(CATview.debug)
      console.log('CATview.draw_alignment: ' + CATview.from + " - " + CATview.to );

    if(CATview.content){
      // remove the edges of the previous visualization
      CATview.content.select(".alignment").selectAll("g.row_witness").remove();
      // get all edges within the given interval
      let edges_temp = CATview.edges.map(function(d, i) { return [d, i + 1];}).filter(function(d) { return CATview.from <= d[1] && d[1] <= CATview.to; });

      // get the max. width and height that is available for a segment
      let segment_width = Math.floor(CATview.width_content/(CATview.vertical == true ? CATview.names.length : edges_temp.length));
      if(segment_width < 1) segment_width = 1;
      let segment_height = Math.floor(CATview.height_content/(CATview.vertical == true ? edges_temp.length : CATview.names.length));
      if(segment_height < 1) segment_height = 1;

      // set width, height, margin and stroke for a rectangle
      CATview.rect_h_margin = Math.floor(segment_width/5);
      CATview.rect_width = segment_width - CATview.rect_h_margin;
      CATview.rect_v_margin = Math.floor(segment_height/5);
      CATview.rect_height = segment_height - CATview.rect_v_margin;
      CATview.rect_stroke = "stroke-width: " + ((segment_width >= 15 && segment_height >= 15) ? ((segment_width >= 30 && segment_height >= 30) ? 2 : 1) : 0) + ";";

      // create a grouping row for each edge
      let rows = CATview.content.select(".alignment").selectAll("g.row_witness")
      .data(edges_temp)
      .enter().append("g")
      .attr("class", "row_witness")
      .attr("transform", function(d) { return "translate(" +
        (CATview.vertical == true ? (-CATview.rect_width/2 + ", " + (CATview.scale_edges(parseInt(d[1]))-(CATview.rect_height/2))) :
        (CATview.scale_edges(parseInt(d[1]))-(CATview.rect_width/2)) + ", " + (-CATview.rect_height/2))
        + ")"; })
      .on('mouseenter', function(d, i){CATview.show_edge_name(i)})
      .on('mouseleave', function(){ CATview.hide_edge_name()});

      // draw the rects for the witnesses in each row
      rows.selectAll("rect")
      .data(function(d) { return d[0].map(function(d2, j) {return [j, (d[1] - 1), d2];}).filter( function(d2) { return d2[2] != "-1"; } ); })
      .enter().append("rect")
      .attr("class", "rect-segment")
      .on("click", function(d){
        CATview.click_on_edge_callback(d[0], d[1]);
       })
      .attr('cursor', 'pointer')
      .attr("width", CATview.rect_width)
      .attr("height", CATview.rect_height)
      //.attr("ry", rect_corner)      // rounded Corners
      .attr(CATview.vertical == true ? "x" : "y", function(d) { return CATview.scale_names(d[0])})
      .attr("style", function(d) {
        return CATview.rect_stroke + CATview.rect_border + "fill: " +
          (parseFloat(d[2]) == 0.0 && CATview.use_equality_color ? CATview.equality_color : CATview.scale_color(parseFloat(d[2])));
      });
      // update the edges-axis
      CATview.edgesAxis.scale(CATview.scale_edges);
      CATview.content.select(".edges-axis").call(CATview.edgesAxis);
      CATview.content.select(".edges-axis").selectAll("text")
      .attr("style", "text-anchor: middle;")
      .attr("transform", function() {
        // rotate for 90 degrees than move the positions a bit to make them centered
        let transform = '';
        switch (CATview.orientation)
        {
          case "left": transform = 'translate(3, 0)'; break;
          case "right": transform = 'translate(-3, 0)'; break;
          default: break;
        }
        return transform;
      })
      .attr('font-size', CATview.font_size_x);
    }
    else
      return false;
  };

  this.set_edge_names = function(_names){
    if(CATview.debug)
      console.log('CATview.set_edge_names');
    if(_names == null)
      return false;
    CATview.edge_names = _names;
    return true;
  };
  this.show_edge_name = function (_pos) {
    if(CATview.debug)
      console.log('CATview.show_edge_name: ' + _pos);

    // respect current zooming
    _pos += CATview.from - 1;

    CATview.edge_name.transition()
      .duration(200)
      .style("opacity", 1.0);

    if(CATview.edge_names[_pos] !== null && CATview.edge_names[_pos] !== undefined && CATview.edge_names[_pos] !== '')
      name = (_pos + 1).toString() + ' • ' + CATview.edge_names[_pos];
    else
      name = 'Position: ' + (_pos + 1).toString();

    // place the edge name central in respect to CATviews orientation
    let anchor_x = "left";
    let offset_x = "50%";
    let anchor_y = "top";
    let offset_y = document.getElementById("CATview").offsetTop + CATview.height_svg + 'px';
    let transform = "translate(-50%, 0)"
    switch(CATview.orientation) {
      case 'left':
        offset_x = CATview.width_svg + 'px';
        offset_y = "50%"
        transform = "translate(0, -50%)"
        break;
      case 'bottom':
        anchor_y = "bottom";
        // CATviews height + the distance to the bottom of the window
        offset_y = CATview.height_svg + window.innerHeight - document.getElementById("CATview").getBoundingClientRect().bottom + 'px';
        break;
      case 'right':
        anchor_x = "right";
        offset_x = CATview.width_svg + 'px';
        offset_y = "50%"
        transform = "translate(0, -50%)"
        break;
      default: // top
    }
    CATview.edge_name.html(name)
      .style(anchor_x, offset_x)
      .style(anchor_y, offset_y)
      .style("transform", transform);
  };
  this.hide_edge_name = function () {
    if(CATview.debug)
      console.log('CATview.hide_edge_name');
    CATview.edge_name.transition()
    .duration(200)
    .style("opacity", 0);
  };

  // draws the scroll spy as orange bar
  this.draw_scroll_spy = function(index){
    if(CATview.debug)
      console.log('CATview.draw_scroll_spy: ' + index);

    if (arguments.length == 1) CATview.scroll_spy_pos = parseInt(index) + 1;

    if(CATview.content){
      CATview.content.selectAll("rect.scroll_spy").remove();
      if(CATview.from <= CATview.scroll_spy_pos && CATview.scroll_spy_pos <= CATview.to)
      {
        if(CATview.vertical == true){
          let height = CATview.rect_height + 2 * (CATview.rect_v_margin/2);
          CATview.content.insert("rect", ".edges-axis")
          .attr("class", "scroll_spy")
          .attr("width", CATview.width_content)
          .attr("height", height)
          .attr("x", 0)
          .attr("y", CATview.scale_edges(CATview.scroll_spy_pos) - (height/2));
        }
        else{
          let width = CATview.rect_width + 2 * (CATview.rect_h_margin/2);
          CATview.content.insert("rect", ".edges-axis")
          .attr("class", "scroll_spy")
          .attr("width", width)
          .attr("height", CATview.height_content)
          .attr("x", CATview.scale_edges(CATview.scroll_spy_pos) - (width/2))
          .attr("y", "0");
        }
      }
    }
    else
      return false;
  };

  // todo deprecated: draws remaining edges as orange lines between the rectangles
  this.set_remaining_edges = function(remaining_edges){
    if(remaining_edges == null)
      return false;

    CATview.remaining_edges = remaining_edges;
    return true;
  };
  this.draw_remaining_edges = function(){
    if(CATview.debug)
      console.log('CATview.draw_remaining_edges');

    if(CATview.content) {
      CATview.content.select(".remaining_edges").selectAll("line.remaining").remove();
      if (CATview.remaining_edges == null)
        return false;
      if (CATview.display_remaining_edges) {
        CATview.remaining_edges.every(function (edges) {
          // stop drawing when the distance of the remaining edges exceed the threshold
          if (edges[0] > CATview.threshold) {
            return false;
          }

          edges[1].forEach(function (edge) {
            if (CATview.from <= edge[0][1] + 1 && edge[0][1] + 1 <= CATview.to && CATview.from <= edge[1][1] + 1 && edge[1][1] + 1 <= CATview.to) {
              CATview.content.select(".remaining_edges").append('line')
              .attr("class", "remaining")
              .attr('x1', CATview.scale_edges(edge[0][1] + 1))
              .attr('y1', CATview.scale_names(edge[0][0]))
              .attr('x2', CATview.scale_edges(edge[1][1] + 1))
              .attr('y2', CATview.scale_names(edge[1][0]));
            }
          });

          return true;
        });
      }
    }
    else
      return false;
  };

  // draws extra segments
  this.set_extra_segments = function(_segments){
    if(_segments == null)
      return false;

    // todo validate data
    CATview.extra_segments = _segments;
    return true;
  };
  this.toggle_display_extra_segments = function(_toggle){
    if(_toggle != null && typeof(_toggle) == "boolean")
      CATview.display_extra_segments = !_toggle;
    CATview.display_extra_segments = !CATview.display_extra_segments;

    return CATview.draw_extra_segments();
  };
  this.draw_extra_segments = function(){
    if(CATview.debug)
      console.log('CATview.draw_extra_segments');

    if(CATview.content) {
      CATview.content.select(".alignment").selectAll("rect.extra").remove();
      if (CATview.extra_segments == null)
        return false;

      if (CATview.display_extra_segments) {
        let rows = CATview.content.select(".alignment").selectAll("g.row_witness");

        CATview.extra_segments.forEach(function (segment) {
          let row = rows.filter(function (d, i) { return (i + CATview.from) === segment[0] + 1 });
          row.append('rect')
            .attr("class", "rect-segment extra")
            .on("click", function(d){CATview.click_on_edge_callback(segment[1], segment[0]);} )
            .attr('cursor', 'pointer')
            .attr("width", CATview.rect_width - 1)
            .attr("height", CATview.rect_height - 2)
            .attr(CATview.vertical == true ? "x" : "y", function(d) { return CATview.scale_names(segment[1]) + 1})
            .attr("style", function(d) {
              return 'fill:transparent; stroke-width:2; stroke-dasharray:3,1; stroke:' +
                (parseFloat(segment[2]) == 0.0 && CATview.use_equality_color ? CATview.equality_color : CATview.scale_color(parseFloat(segment[2])));
            });
        });
      }
    }
    else
      return false;
  };

  // set the search results
  this.set_search_results = function(search_results){
    if(search_results == null)
      return false;

    CATview.search_results = search_results;
    return true;
  };

  // draws the search results by highlighting rectangles with yellow bars
  this.draw_search_results = function(){
    if(CATview.debug)
      console.log('CATview.draw_search_results');

    if(CATview.content){
      CATview.content.select(".search_results_background").selectAll('rect').remove();
      CATview.content.select(".search_results_foreground").selectAll('rect').remove();

      if(CATview.search_results){

        if(CATview.search_mode == 'seg'){
          // draw highlight-rectangles over the segment-rectangles
          // first filter the hits according to the zoom
          let hits = CATview.search_results.filter(function(d){return (CATview.from <= d[0] + 1 && d[0] +1 <= CATview.to)});
          if(hits.length > 0) {
            // reformat the hits into pairs (wit, edge)
            hits = hits.map(function (d) { return d[1].map(
              function (d2) { return [d[0] + 1, d2]}) }).reduce(
              function (a, b) { return a.concat(b);});

            CATview.content.select(".search_results_foreground").selectAll("rect")
            .data(hits)
            .enter().append("rect")
            .attr('class', 'search_result')
            .on("click", function (d) {CATview.click_on_edge_callback(d[1], d[0] - 1);})
            .attr('cursor', 'pointer')
            .attr("width", CATview.rect_width)
            .attr("height", CATview.rect_height)
            .attr("x", function (d) {return CATview.vertical == true ?
              (CATview.scale_names(d[1]) - CATview.rect_width / 2) : (CATview.scale_edges(d[0]) - CATview.rect_width / 2);
            })
            .attr("y", function (d) {return CATview.vertical == true ?
              (CATview.scale_edges(d[0]) - CATview.rect_height / 2) : (CATview.scale_names(d[1]) - CATview.rect_height / 2);
            });
          }
        }
        else{
          // draw full columns in the background of edges that include a search hit
          for (let i = 0; i < CATview.search_results.length; i++){
            let edge = CATview.search_results[i][0] + 1;
            // test whether the search hit is within the currently shown excerpt of the alignment
            if(CATview.from <= edge && edge <= CATview.to){
              if(CATview.vertical == true){
                let height = CATview.rect_height + 2;
                CATview.content.select(".search_results_background").append('rect')
                .attr('class', 'search_result')
                .attr("width", CATview.width_content - 4)
                .attr("height", height)
                .attr("x", 2)
                .attr("y", CATview.scale_edges(edge) - (height/2));

              }
              else{
                let width = CATview.rect_width + 2;
                CATview.content.select(".search_results_background").append('rect')
                .attr('class', 'search_result')
                .attr("width", width)
                .attr("height", CATview.height_content - 4)
                .attr("x", CATview.scale_edges(edge) - (width/2))
                .attr("y", 2);
              }
            }
          }
        }
      }
      return true;
    }
    else
      return false;
  };

  // callback to switch the order of edges
  this.invert_edges_axis = function(){
    if(CATview.debug)
      console.log('CATview.invert_edges_axis');

    CATview.x_inverted = !CATview.x_inverted;

    if(CATview.content){
      CATview.set_margins();
      CATview.set_scale_x(0, CATview.edges.length + 1);
      CATview.scale_edges_original = CATview.scale_edges.copy();
      // relocate the content container
      CATview.svg.select(".content").attr("transform", "translate(" + CATview.margin.left + "," + CATview.margin.top + ")");
      CATview.draw_zebra_stripes();
      CATview.draw_edges_axis();
      CATview.draw_names_axis();
      CATview.draw_tool_icons();
      CATview.refresh_content();
    }
    else
      return false;
  };

  // callback to switch the order of text witnesses
  this.invert_names_axis = function(){
    if(CATview.debug)
      console.log('CATview.invert_names_axis');

    CATview.y_inverted = !CATview.y_inverted;

    if(CATview.content){
      CATview.set_scale_y();
      CATview.draw_names_axis();
      CATview.refresh_content();
    }
    else
      return false;
  };

  // set the maximum zooming level (enable or disable zooming)
  this.set_max_zoom = function(max){
    max = parseFloat(Number(max));
    if(isNaN(max)){
      // the default value will allow to increase the size of edges as far as only ten of them can be displayed
      max = CATview.edges.length / 10;
    }
    else if (max < 1 ) {
      // setting the maximum scale to 1 will disable the zoom
      max = 1.0;
    }

    CATview.zoom.scaleExtent([1, max]);

    // todo react if current zoom bigger than max?

    return true;
  };

  // callback with functionality for scaling and translation of the content
  this.zooming = function () {
    if(CATview.debug)
      console.log('CATview.zooming');

    let new_scale = d3.event.transform.k;
    let new_translate = CATview.vertical == true ? (d3.event.transform.y/new_scale) : (d3.event.transform.x/new_scale);

    if(CATview.content){

      let delta_translate = 0;
      let scale_from = 0;
      let scale_to = 0;
      let current_size = CATview.vertical == true ? CATview.height_content : CATview.width_content;
      // if the scale factor has changed
      if (new_scale != CATview.scale) {
        // calculate the change of the size
        let delta_size = (current_size / new_scale) - (current_size / CATview.scale);
        // distribute the change of the size among the left/top and right/bottom site due to the relative mouse center
        scale_from = delta_size * ((CATview.vertical == true ? d3.mouse(this)[1] : d3.mouse(this)[0]) / current_size);
        scale_to = delta_size - scale_from;
      }
      else if(CATview.display_brush == false){
        // calculate the relative translation (only if the brush function is disabled)
        delta_translate = CATview.translate - new_translate;
      }

      // calculate the new left and right position in the original scale (0 upto size)
      let offset = 0;     // if the limit of one site is reached, add the remaining pixels to the other site
      let new_from_pixel = CATview.from_pixel - scale_from + delta_translate;
      if (new_from_pixel < 0)       // the limit of the left site was reached
      {
        offset = -new_from_pixel;
        new_from_pixel = 0;
      }
      let new_to_pixel = CATview.to_pixel + scale_to + delta_translate + offset;
      if (new_to_pixel > current_size)  // the limit of the right site was reached
      {
        offset =  new_to_pixel - current_size;
        new_to_pixel = current_size;
        new_from_pixel -= offset;
      }

      // return when one of the new interval borders is not legit (e.g. by double clicking a rectangle)
      if(isNaN(new_from_pixel) || isNaN(new_to_pixel))
        return false;

      // save the parameters of this call
      CATview.from_pixel = new_from_pixel;
      CATview.to_pixel = new_to_pixel;
      CATview.translate = new_translate;
      CATview.scale = new_scale;

      // calculate the edges within this new zoom
      let new_from = Math.ceil(CATview.scale_edges_original.invert(new_from_pixel));
      let new_to = Math.floor(CATview.scale_edges_original.invert(new_to_pixel));
      if(CATview.x_inverted){
        let swap = new_from;
        new_from = new_to;
        new_to = swap;
      }
      if(new_from != CATview.from || new_to != CATview.to) {
        // refresh the content only if edges within the new zoom have changed
        CATview.refresh_content(new_from, new_to);
      }

      // refresh the brush
      if(CATview.brush) {
        // remember the current extent
        //let extent = CATview.brush.extent();
        // update the scale
       // if(CATview.vertical == true)
       // todo   CATview.brush.y(CATview.scale_edges);
       // else
        // todo   CATview.brush.x(CATview.scale_edges);
        // restore the extent
        //CATview.brush.extent(extent);
        // redraw the brush
        //CATview.content.select(".brush").call(CATview.brush);
      }
    }
    else
      return false;
  };

  // set the callback after a click on a rectangle (will receive: (wit, edge))
  this.set_click_on_edge_callback = function(click_on_edge_callback) {
    CATview.click_on_edge_callback = click_on_edge_callback;

    return true;
  };

  // enable the brush functionality and pass a callback function to the brush (will receive: from_edge, to_edge, from_name, to_name)
  this.enable_brush = function(brush_callback){
    if(CATview.debug)
      console.log('CATview.enable_brush');

    if(CATview.display_brush == false){
      CATview.display_brush = true;
      // add the brush to CATview
      if(CATview.content)
        CATview.draw_brush();
    }
    if(brush_callback != null)
      CATview.brush_callback = brush_callback;

    return true;
  };

  // disable the brush functionality and set the attributes back in default state
  this.disable_brush = function(){
    if(CATview.debug)
      console.log('CATview.disable_brush');

    if(CATview.display_brush == true) {
      // reset the brush's attributes
      CATview.display_brush = false;
      CATview.brush_from_edge = -1;
      CATview.brush_to_edge = -1;
      CATview.brush_from_name = -1;
      CATview.brush_to_name = -1;
      // CATview.brush_callback = null;
      // remove the brush from CATview
      if (CATview.content)
        CATview.content.select(".brush").remove();
      // pass the full interval to the callback on remove
      if(CATview.brush_callback != null && CATview.edges.length > 0){
        CATview.brush_callback(0, CATview.edges.length - 1, 0, CATview.names.length - 1);
      }
    }
  };

  // add the brush element to the svg
  this.draw_brush = function(){
    if(CATview.debug)
      console.log('CATview.draw_brush');

    if(CATview.content){
      if(CATview.display_brush == true){
        // remove previous brush
        CATview.content.select(".brush").remove();
        // add the brush to CATview

        if(CATview.vertical == true) {
          CATview.brush = d3.brushY()
          .on("brush", CATview.brushing);

          if(CATview.x_inverted)
            CATview.brush.extent([[CATview.scale_names.range()[0], CATview.scale_edges.range()[1]], [CATview.scale_names.range()[1], CATview.scale_edges.range()[0]]])
          else
            CATview.brush.extent([[CATview.scale_names.range()[0], CATview.scale_edges.range()[0]], [CATview.scale_names.range()[1], CATview.scale_edges.range()[1]]])
        } else {
          CATview.brush = d3.brushX()
            .on("brush", CATview.brushing);

          if(CATview.x_inverted)
            CATview.brush.extent([[CATview.scale_edges.range()[1], CATview.scale_names.range()[0]], [CATview.scale_edges.range()[0], CATview.scale_names.range()[1]]])
          else
            CATview.brush.extent([[CATview.scale_edges.range()[0], CATview.scale_names.range()[0]], [CATview.scale_edges.range()[1], CATview.scale_names.range()[1]]])
        }

        let brush = CATview.content.append("g")
        .attr("class", "brush")
        .call(CATview.brush);
      }
      return true;
    }
    else
      return false;
  };

  // set the callback after brushing
  this.set_brush_callback = function(brush_callback) {
    CATview.brush_callback = brush_callback;

    return true;
  };

  // react on changes of the brush
  this.brushing = function() {
    if(CATview.debug)
      console.log('CATview.brushing');

    // var edges_index = CATview.vertical == true ? 1 : 0;
    // var names_index = CATview.vertical == true ? 0 : 1;

    // get the interval as integers
    // var from_edge = Math.ceil(CATview.brush.extent()[0][edges_index]) - 1;
    let from_edge = Math.ceil(d3.event.selection.map(CATview.scale_edges.invert)[0]) - 1;
    if(from_edge < 0)
      from_edge = 0;
    // var to_edge = Math.floor(CATview.brush.extent()[1][edges_index]) - 1;
    let to_edge = Math.floor(d3.event.selection.map(CATview.scale_edges.invert)[1]) - 1;
    if(to_edge >= CATview.edges.length)
      to_edge = CATview.edges.length - 1;
    let from_name = null; // Math.ceil(CATview.brush.extent()[0][names_index]);
    let to_name = null; // Math.floor(CATview.brush.extent()[1][names_index]);

    if(CATview.x_inverted){
      let swap = from_edge;
      from_edge = to_edge;
      to_edge = swap;
    }

    if(to_edge - from_edge >= 0) {
      // check whether the interval has changed
      if (from_edge != CATview.brush_from_edge || to_edge != CATview.brush_to_edge || from_name != CATview.brush_from_name || to_name != CATview.brush_to_name) {
        // save the current interval
        CATview.brush_from_edge = from_edge;
        CATview.brush_to_edge = to_edge;
        CATview.brush_from_name = from_name;
        CATview.brush_to_name = to_name;
        // call the brush_callback as the interval has changed
        if (CATview.brush_callback != null) {
          CATview.brush_callback(from_edge, to_edge, from_name, to_name);
        }
        else {
          console.log('CATview brush edge from ' + from_edge + ' to ' + to_edge + ' and name from ' + from_name + ' to ' + to_name);
        }
      }
    }
  };

  // add a new tool icon and its behavior
  this.add_tool = function(_icon, _callback, _index, _rotation){
    let index = parseInt(_index);
    if (isNaN(index) || index < 0 || index > CATview.tools.length )
      index = CATview.tools.length;

    let rotation = (typeof _rotation === 'undefined') ? 0 : parseInt(_rotation);

    CATview.tools.splice(index, 0, [_icon, _callback, rotation]);

    return true;
  };
  // remove a tool
  this.remove_tool = function(index){
    index = parseInt(Number(index));
    if (isNaN(index) || index < 0 || index >= CATview.tools.length )
      return false;

    CATview.tools.splice(index, 1);

    return true;
  };
  // add the invert-x-axis tool
  this.add_tool_invert_edges_axis = function(index){
    return CATview.add_tool('f0dc',
      function(){CATview.invert_edges_axis();},
      index,
      CATview.vertical ? 0 : 90);
  };
  // add the invert-y-axis tool
  this.add_tool_invert_names_axis = function(index){
    return CATview.add_tool('f0dc',
      function(){CATview.invert_names_axis();},
      index,
      CATview.vertical ? 90 : 0);
  };
  // add the display-remaining-edges tool
  this.add_tool_display_remaining_edges = function(index){
    return CATview.add_tool('f074',
      function(){
        CATview.display_remaining_edges = !CATview.display_remaining_edges;
        CATview.draw_remaining_edges();},
      index,
      0);
  };
  // add the switch-highlight-mode-of-search-results tool
  this.add_tool_toggle_search_mode = function(index){
    return CATview.add_tool('f002',
      function(){
        CATview.search_mode = (CATview.search_mode == 'seg' ? 'col' : 'seg');
        CATview.draw_search_results();},
      index,
      0);
  };
  // add the enable/disable-brush tool
  this.add_tool_toggle_brush = function(index){
    return CATview.add_tool('f1fc', // f096
      function(){
        if(CATview.display_brush)
          CATview.disable_brush();
        else
          CATview.enable_brush();},
      index,
      0);
  };

  //todo remove and set the identifiers of the witnesses
  this.set_names = function(names){
    // todo add dummies or remove values in data structures
    CATview.names = names;
    return true;
  };
  //add a name
  this.add_name = function(name, index){
    if(CATview.names == null)
      return false;
    index = parseInt(Number(index));
    if (isNaN(index) || index < 0 || index > CATview.names.length )
      index = CATview.names.length;

    CATview.names.splice(index, 0, name);

    // todo set dummies at edges

    return true;
  };
  //remove a witness and its values in all data structures
  this.remove_name = function(index){
    index = parseInt(Number(index));
    if (isNaN(index) || CATview.names == null || index < 0 || index >= CATview.names.length )
      return false;

    CATview.names.splice(index, 1);

    // todo update edges

    return true;
  };
  // rename the witness at a specific index
  this.replace_name = function(name, index){
    index = parseInt(Number(index));
    if (isNaN(index) || CATview.names == null || index < 0 || index >= CATview.names.length )
      return false;

    CATview.names[index] = name;

    // todo update edges

    return true;
  };
  // overwrite the alignment edges
  this.set_edges = function(edges){
    CATview.edges = edges;
    return true;
  };
  // add a single edge
  this.add_edge = function(edge, index){
    if(CATview.edges == null)
      return false;

    index = parseInt(Number(index));
    if (isNaN(index) || index < 0 || index > CATview.edges.length )
      index = CATview.edges.length;

    CATview.edges.splice(index, 0, edge);
    // todo fill edge with -1 if not all names are covered

    return true;
  };
  // remove a single edge
  this.remove_edge = function(index){
    index = parseInt(Number(index));
    if (isNaN(index) || CATview.edges == null || index < 0 || index >= CATview.edges.length )
      return false;

    CATview.edges.splice(edge, 1);

    return true;
  };
  // replace a single edge
  this.replace_edge = function(edge, index, extra){
    index = parseInt(Number(index));
    if (isNaN(index) || CATview.edges == null || index < 0 || index >= CATview.edges.length )
      return false;

    CATview.edges[index] = edge;

    if (extra != null && !isNaN(index) && CATview.extra_segments != null && index > 0 && index < CATview.extra_segments.length )
      CATview.extra_segments[index] = extra;

    return true;
  };


  this.set_color_scale = function(from, to, border){

    if(from == null) from = "#c1c1e9";
    if(to == null) to = "#0000a3";
    if(border == null) border = "#2f2f86";

    CATview.scale_color = d3.scaleLinear().domain([0, 1]).range([from, to]);

    CATview.rect_border = "stroke: " + border + ";";

    return CATview.refresh_content();
  };
  this.set_background_color = function(color){
    if(color == null)
      return false;

    document.querySelector('#CATview svg').style.backgroundColor = color;
    document.querySelector('#CATview .edge-name').style.backgroundColor = color;
    return true;
  };

  // enable/disable console output to debug
  this.toggle_debug = function(debug){
    if(debug != null && typeof(debug) == "boolean")
        CATview.debug = !debug;

    CATview.debug = !CATview.debug;
    return true;
  };

  // todo
  // - may: method to set search_mode → toggle_search_mode(_mode)
  // - may: method to zoom → zoom_to(_factor)
  // - may: method for changing the border_color → set_border(_color, _width)
  // - adopt font size in respect to the number of witnesses
  // - method to reset all data → reset
};