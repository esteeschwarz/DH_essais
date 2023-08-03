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
                                            "string": "ewig alles ablegen, das dich erinnern will.| so wirst du ins grosze fahrtenbuch der andern eingeschrieben,| auch wenn alles längst aus dir geht.| {aber halte die asche dieses lebens noch fest,} |die dir von ihnen geblieben.| nur entledige dich, wachse heran zu ihrem einzigen grund.",
                     
                                        } 
                                    },      
                                    
                            {
                                        "item": {
                                            "id": "EM002",
                                            "tags": [ "R-B", "2EM","down" ,"tag4","tag5","tag6"],
                                            "string": "das Wort ist nur Chirurg geblieben |so lange als ich ihm erlaubte| {die Hände warm zu halten}| vor dem Hirn dem ewig kalten Ort| da geht es hin |da bleibt es ungeglaubt| die Hände werden einmal steif und kalt uns abwehrn| unsere Hände die wir ewig lieben| nur das Wort bleibt uns erhalten Chirurgie| verlassen und die Wände die mich einsperrn| trösten wird die Elegie",
                     
                                        } 
                                    },      
                                    
                                         
                                    
 {
                                        "item": {
                                            "id": "EM003",
                                            "tags": [ "R-B", "3EM","down","tag4","tag5","tag6" ],
                                            "string": "mönch am meer,| der in den sand, der in die wiedergeborene linie am morgen |{seinen fusz setzt.}| wägt den tag ab: |eine neue aufgabe, |eine die wartet, |eine die jetzt schon vergangen.",
                    
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
                                            "string": "legen ab mit dem dampfer. |das land in front, wir fahren rückwärts?| weisz nicht, wie weit das zweite ufer noch weg, |irgend nebel liegt über dem meer. |{halte die asche dieses lebens noch fest,} |die ich lang gesammelt habe. |in berlin wächst der kompost auf dem brandplatz.",
                    
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
                                            "string": "ich stelle mir vor: |die weggegabelte entscheidung, |{ca. der reine bezug. }|am andern ende die verkabelung ist ausgelöst, |weil import  des datamaterial lange verschoben. |hier nurkreisen von motten. |in merkwürdigen kreisen. |kann das nicht richtig sehen, |was sie ins holz schreiben, |aber ich bin mir sicher, |sie haben etwas zu sagen. |soll keine fehler schreiben. |soll keine gebärden mehr.",
                                         }
                                    },
                                  
                                      {
                                        "item": {
                                            "id": "LC002",
                                            "tags": [ "R-C", "2LC","down","tag4","tag5","tag6" ],
                                            "string": "etwa aufgeworfene felder gegen das neue jahr;| also abgeerntet, gepflügt, |zarter grüner flaum darauf.| {man sieht die lange zeit noch dazwischen,}| den winter, der nochnicht ist.| es legen sich alle zur ruhe.",
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
                                            "string": "zählen Sie uns zu den mandeln. |wie weit wir uns verausgaben..., |alle striche stets umsonst.| warum wir füllmaterial brauchen: |das geschäft mit dem humus vielleicht, |{darin ihr alle aufgehoben der auferstehung entgegen usw.,}| bis :namen: :orte: verschwimmen. |(land) überall.| eure scheisz heimat im geiste.| zählen Sie mich zur mandel hinzu.",
                    
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