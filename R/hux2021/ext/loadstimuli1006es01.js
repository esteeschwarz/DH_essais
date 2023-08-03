
Experiment.prototype.loadStimuliGroup = function (design, setName, ord) {
    var screens =[];
    var groupName = typeof design[ "name"] !== 'undefined' ? design[ "name"]: "NA";
    var order = this.getOrder(design[ "order"], ord);
    // go through items array and create screenInfo object for each item
    for (var i = 0; i < design[ "items"].length; i++) {
        var item = design[ "items"][i][ "item"];
        var id = item[ "id"];
        var tags = typeof item[ "tags"] !== 'undefined' ? item[ "tags"]:[];
        if (tags.length > this.maxTags) {
            this.maxTags = tags.length;
        }
        // update maxTags, if necessary
        var text = item[ "string"];
        //        var orientation = typeof item["orientation"] !== 'undefined' ? design["items"][i]["item"]["orientation"] : this.orientation;
        var prompt = item[ "prompt"];
        var options = item[ "options"];

//////////////////////12374.bugfinding fast runthrough test
let itemchoice =(id=="practice03"|| id=="SM001"||  id=="LC001" || id=="LC002" || id=="EM003"|| id=="FIL002"||id=="EM002"||id=="EM001") ? 1:0;   //here to include items einfügen

       
     /////jeweils auf unterschiedliche bögen (lib mod libraries) verteilen und von verschiedenen index im frame aufrufen lassen  
       
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       if (itemchoice == 1) { //include items
        var item = new Item(id, text, this.orientation, this.fixationchar, this.maskchar, this.display, prompt, options, this.feedbackOptions, setName, groupName, tags, this);
        // Create the Screen object and push it to the sceens array

        var screen = new Screen("stimuli", item); //  } ///essai
        screens.push(screen);
    }
   } //ausschlieszen items essai, funktioniert nur mit einem stimulus
    if (order == "random") {
        shuffle(screens);
    }
    return screens;
}