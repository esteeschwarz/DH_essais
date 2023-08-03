
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
        /////////////////////////////////////////////////////////11272.///////////////////////////////////////////////////////////////////////////////////////////////////////////// filler: filler[em01 lc03 em04 lc07 sm08 em09 lc13 em14 lc16 em17 em19 em20 lc21 em22 lc23 sm25   fix
////// items: 2 5 6 10 11 12 18 26      rekursiv alternierend
   
  //  let itemchoice = (id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM2" || id=="SM5" || id=="LC6" || id=="MM10"|| id=="EM11" || id=="SM12"|| id=="LC18" || id=="MM26") ? 1:0;   //here to include items einfügen
 
 //let itemchoice = (id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM5" || id=="SM6" || id=="LC10" || id=="MM11"|| id=="EM12" || id=="SM18"|| id=="LC26" || id=="MM2") ? 1:0;   //here to include items einfügen

//let itemchoice = (id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM6" || id=="SM10" || id=="LC11" || id=="MM12"|| id=="EM18" || id=="SM26"|| id=="LC2" || id=="MM5") ? 1:0;   //here to include items einfügen

 // let itemchoice = (id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM10" || id=="SM11" || id=="LC12" || id=="MM18"|| id=="EM26" || id=="SM2"|| id=="LC5" || id=="MM6") ? 1:0;   //here to include items einfügen


 //let itemchoice =(id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM11" || id=="SM12" || id=="LC18" || id=="MM26"|| id=="EM2" || id=="SM5"|| id=="LC6" || id=="MM10") ? 1:0;   //here to include items einfügen

let itemchoice =(id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM12" || id=="SM18" || id=="LC26" || id=="MM2"|| id=="EM5" || id=="SM6"|| id=="LC10" || id=="MM11") ? 1:0;   //here to include items einfügen


//let itemchoice =(id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM18" || id=="SM26" || id=="LC2" || id=="MM5"|| id=="EM6" || id=="SM10"|| id=="LC11" || id=="MM12") ? 1:0;   //here to include items einfügen


//let itemchoice =(id=="fillerem01"||id=="fillerlc03"||id=="fillerem04"||id=="fillerlc07"||id=="fillersm08"||id=="fillerem09"||id=="fillerlc13"||id=="fillerem14"||id=="fillerlc16"||id=="fillerem17"||id=="fillerem19"||id=="fillerem20"||id=="fillerlc21"||id=="fillerem22"||id=="fillerlc23"||id=="fillersm25"||id=="practice01"||id=="practice02"||id=="practice03"||id =="EM26" || id=="SM2" || id=="LC5" || id=="MM6"|| id=="EM10" || id=="SM11"|| id=="LC12" || id=="MM18") ? 1:0;   //here to include items einfügen



///////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       if (itemchoice == 1) { //include items
        var item = new Item(id, text, this.orientation, this.fixationchar, this.maskchar, this.display, prompt, options, this.feedbackOptions, setName, groupName, tags, this);
        // Create the Screen object and push it to the sceens array

        var screen = new Screen("stimuli", item); //  } ///essai
        screens.push(screen);
    }
   } //ausschlieszen items essai, funktioniert nur mit einem stimulus
    if (order === "random") {
        shuffle(screens);
    }
    return screens;
}