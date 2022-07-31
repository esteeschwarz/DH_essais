/*
 * Title: jespr-sample1.js
 * Author: Ralph L. ROSE
 * E-mail address: rose@waseda.jp
 * Description: This file defines an experimental design to be used in a
 * JESPR experiment.
 * License: The MIT License (MIT)
 */


var jesprExperimentDesignForButton = { //actuel 12432/////
    "title": "[ESTEE EXT.]",
    "investigators":[ {
        "primary": "[SPACE]"
    }, {
        "other": ""
    }],
    "font-name": "courier",
    "font-size": "13",
  //  "line-height": "0.9",
    "text-color": "black",
    "background-color": "lightgray",
    "display": "moving-window",
    "orientation": "vertical", //-horizontal
    "masking-character": ".",
    "fixation-character": "X",
    "min-instruction-time": "100",
    "show-progress-bar": "true",
    "input-method": "html-button",
    "quote-mark": "double_quote",
    "show-results-display": "true",
    "show-log-display": "true",
    "feedback-options":[ {
        "name": "correct",
        "string": "gut",
        "text-color": "green"
    }, {
        "name": "incorrect",
        "string": "naja",
        "text-color": "red"
    }],
    "instruction-screens":[ {
        "id": "instruction1",
        "string": "testrun 001"
    }, {
        "id": "instruction2",
        "string": "just check time count"
    }],
    "instruction-screens":[ {
        "id": "instruction1",
        "string": "...[SPACE]..."
    }, {
        "id": "instruction2",
        "string": "...[PRESS]..."
    }],
    "practice-stimuli": {
        "order": "fixed",
        "items":[ {
            "item": {
                "id": "practice01",
                "string": "...[SPACE]...",
            
            }
        }, {
            "item": {
                "id": "practice02",
                "string": "...[PRESS]...",
          
            }
            
          
            
        },   {
            "item": {
                "id": "practice03",
                "string": "...[SPACE]...",
             /*    "prompt": "Sind Sie schon gespannt, oder?", 
                "options":[ {
                    "string": "ja, sehr.",
                    "feedback": "okay. dann gehts gleich los."
                }, {
                    "string": "naja...",
                    "feedback": "fangen wir jetzt trotzdem mal an..."
                }]*/
            }
        
        }
        ]
    },
    "post-practice-instruction-screens":[ {
        "id": "instruction3",
        "string": "12431."
    }],    "experiment-stimuli": {    // endklammern begin of groups:  ] } } ] }
        "order": "fixed",
        "merge": "true",///-true
        "stimuli-sets": [             //   /
        {
                "stimuli-set": {
                    "name": "all",
                    "order": "random",   //-fixed  (mit random werden alle stimuli incl. filler global randomisiert)
                    "merge": "true", ///-true
                    "groups": [
                        {
                            "group": {
                                "name": "EM",
                                "order": "random",
                                "items": [
                     {
                                        "item": {
                                            "id": "EM001",
                                            "tags": [ "R-B", "1EM","down","tag4","tag5","tag6" ],
                                            "string": "Nach Marthas Meinung war Depression eine Kröte,| die schmierig auf deinem Kopf hocken konnte,| bis sie endlich die Energie aufbrachte, herunterzurutschen.| Die Traurigkeit aber, in  der sie die letzten zehn Tage verbracht hatte,| war eine andere.| Hektisch und aggressiv.|{ Mit scharfen Krallen.}| Sie hatte nicht auf ihr gesessen,| sondern sie überfallen.",
                     
                                        } 
                                    },      
                                    
                            {
                                        "item": {
                                            "id": "EM002",
                                            "tags": [ "R-B", "2EM","down" ,"tag4","tag5","tag6"],
                                            "string": "Johns Ehrgeiz im Büro war ein Rennwagen.| Er nutzte jede Gelegenheit, die sich ihm bot,| um seine RivalInnen zu überholen und seine TeamkollegInnen herauszufordern.| Auf der Rennstrecke kämpfte er Runde um Runde,| {bis von der Tribüne stehende Ovationen kamen.}| Johns Chef lobte ihn für seine Siege,| aber insgeheim fragte er sich,| ob John je die Ziellinie erreichen würde.",
                     
                                        } 
                                    },      
                                    
                                         
                                    
 {
                                        "item": {
                                            "id": "EM003",
                                            "tags": [ "R-B", "3EM","down","tag4","tag5","tag6" ],
                                            "string": "Helen sprach mit dem beruhigenden Tonfall einer erfahrenen Heilerin.| Wenn sie in der richtigen Stimmung war,| hatten ihre Worte eine weiche Schärfe,| die auf magische Weise von allen Beschwerden heilen konnte,| ganz ohne Medizin.| Wenn sie aber der Meinung war,| dass ihr Zuhörer eine Behandlung nötig hatte,| {setzte sie ihr Skalpell nah an dessen Herzen an,}| so dass er von der langen Klinge eines ‚Warum‘| oder der unheilbaren Stille eines Punktes verwundet würde.",
                    
                                        } 
                                    },  
                                 
                                         ]
                            }
                        },
                              {
                            "group": {        
                                "name": "SM",
                                "order": "random",
                                "items": [
                                    
                                    
                                    
                                    {
                                        "item": {
                                            "id": "SM001",
                                            "tags": [ "R-A", "1SM","down","tag4","tag5","tag6" ],
                                            "string": "Martha wußte, was Depression war.| Oft hatte sie schlechte Zeiten,| da sie nichts tun wollte und Probleme hatte,| aus dem Bett zu kommen.| Die Traurigkeit der letzten zehn Tage jedoch war sehr anders.| {Hatte scharfe Krallen.}| Es war klar,| daß Martha sich diesmal professionelle Hilfe suchen müßte.",
                    
                                        }
                                    },
                                    
                                  {
                                        "item": {
                                            "id": "SM002",
                                            "tags": [ "R-A", "2SM","down","tag4","tag5","tag6" ],
                                            "string": "John war im Büro grenzenlos ehrgeizig.| Alles, was er bei der Arbeit tat,| war Teil einer Strategie,| um eine weitere Beförderung zu bekommen.| Er war sehr wettbewerbsorientiert| und erwartete immer,| {dass von der Tribüne stehende Ovationen kamen.}| Sein Chef war mit Johns Arbeit zufrieden,| aber seine Kollegen waren seinen Ehrgeiz leid",
                    
                                        }
                                    },
                                    
                                 
                                           ]
                            }
                        },
                              {
                            "group": {        
                                "name": "LC",
                                "order": "random",
                                "items": [
                                    
                      
                                     {
                                        "item": {
                                            "id": "LC001",
                                            "tags": [ "R-C", "1LC","down","tag4","tag5","tag6" ],
                                            "string": "Martha bereute, die streunende Katze nach Hause mitgebracht zu haben,| die sie im Park gefunden hatte.| In den letzten zwei Tagen| hatte diese die Vorhänge des Wohnzimmers| und die vier Beine des Küchentischs zerstört.| {Sie hatte scharfe Krallen.}| Martha befürchtete,| es würde nicht gelingen,| eine Katze dieses Alters bei sich aufzunehmen.",
                                         }
                                    },
                                  
                                      {
                                        "item": {
                                            "id": "LC002",
                                            "tags": [ "R-C", "2LC","down","tag4","tag5","tag6" ],
                                            "string": "Johns Traum war es, Formel-1-Fahrer zu werden.| Er war fest entschlossen, hart dafür zu arbeiten| bis zu jenem Tag, an dem er endlich um die Formel-1-Rennstrecke rasen würde,| {bis von der Tribüne stehende Ovationen kamen.}| Aber im Moment ging es nur darum,| hart für seinen Traum zu arbeiten.",
                                         }
                                    }
                                   
                           
                                              
      
                                ]   //items                
                            }    // group LC
                        },     ///group
                        
                          
                      
  {
                            "group": {
                                "name": "FL",
                                "order": "random",
                                "items": [
                                    
                                    {
                                        "item": {
                                            "id": "FIL002",
                                            "tags": [ "R-D", "2FIL","down","tag4","tag5","tag6" ],
                                            "string": "Wenn Ginas Büroangestellte kooperativ waren,| konnten sie großartige Dinge zusammen erreichen.| Sie waren ein Chor in perfekter Harmonie;| die zarten Töne des Soprans| fügten sich perfekt ein in das mächtige Donnern der Bässe.| Nach der Performance musste Gina lediglich| {die Blumensträuße aufheben, die man auf die Bühne geworfen hatte.}| Wenn sie jedoch unkooperativ waren,| war die sich ergebende Kakophonie ein Angriff auf die Sinne.",
                    
                                        } 
                                    },   
                               
                          
                                    
                                    
      
                                ]
                            }
                        } ,
                        
                        

                            /// klammern schlieszen: ] } } ] }
                    ]
                }
            }
        ]
    },
    "ending-screens":[ {
        "id": "instruction4",
        "string": "[12431.fin v6.0]"
    }]
};