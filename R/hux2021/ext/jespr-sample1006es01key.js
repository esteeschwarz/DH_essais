/*
 * Title: jespr-sample1.js
 * Author: Ralph L. ROSE
 * E-mail address: rose@waseda.jp
 * Description: This file defines an experimental design to be used in a
 * JESPR experiment.
 * License: The MIT License (MIT)
 */


var jesprExperimentDesignForKey = { //actuel 11284///// items in: 2,5,6,10,11,12,18,26
    "title": "[ESTEE EXT.]",
    "investigators":[ {
        "primary": "[SPACE]"
    }, {
        "other": ""
    }],
    "font-name": "courier",
    "font-size": "14",
    "text-color": "black",
    "background-color": "lightgray",
    "display": "moving-window",
    "orientation": "vertical", //-horizontal
    "masking-character": "*",
    "fixation-character": "X",
    "min-instruction-time": "500",
    "show-progress-bar": "true",
    "input-method": "keyboard",
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
        "string": "...[SPACE]..."
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
                "string": "...[SPACE]...",
          
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
                                "order": "fixed",
                                "items": [
                     {
                                        "item": {
                                            "id": "EM001",
                                            "tags": [ "RUB", "1EM" ],
                                            "string": "ewig alles ablegen, das dich erinnern will.| so wirst du ins grosze fahrtenbuch der andern eingeschrieben,| auch wenn alles längst aus dir geht.| {aber halte die asche dieses lebens noch fest,} |die dir von ihnen geblieben.| nur entledige dich, wachse heran zu ihrem einzigen grund.",
                     
                                        } 
                                    },      
                                    
                            {
                                        "item": {
                                            "id": "EM002",
                                            "tags": [ "RUB", "2EM" ],
                                            "string": "das Wort ist nur Chirurg geblieben |so lange als ich ihm erlaubte| {die Hände warm zu halten}| vor dem Hirn dem ewig kalten Ort| da geht es hin |da bleibt es ungeglaubt| die Hände werden einmal steif und kalt uns abwehrn| unsere Hände die wir ewig lieben| nur das Wort bleibt uns erhalten Chirurgie| verlassen und die Wände die mich einsperrn| trösten wird die Elegie",
                     
                                        } 
                                    },      
                                    
                                    
                                 
                                         ]
                            }
                        },
                              {
                            "group": {        
                                "name": "SM",
                                "order": "fixed",
                                "items": [
                                    
                                    
                                    
                                    {
                                        "item": {
                                            "id": "SM001",
                                            "tags": [ "RUB", "1SM" ],
                                            "string": "legen ab mit dem dampfer. |das land in front, wir fahren rückwärts?| weisz nicht, wie weit das zweite ufer noch weg, |irgend nebel liegt über dem meer. |{halte die asche dieses lebens noch fest,} |die ich lang gesammelt habe. |in berlin wächst der kompost auf dem brandplatz.",
                    
                                        }
                                    },
                                    
                                
                                    
                                 
                                           ]
                            }
                        },
                              {
                            "group": {        
                                "name": "LC",
                                "order": "fixed",
                                "items": [
                                    
                                    
                                        
    ///remove comment next line for revealing items                          
   
                                  
                                  
                                      {
                                        "item": {
                                            "id": "LC002",
                                            "tags": [ "RUB", "2LC" ],
                                            "string": "etwa aufgeworfene felder gegen das neue jahr;| also abgeerntet, gepflügt, |zarter grüner flaum darauf.| {man sieht die lange zeit noch dazwischen,}| den winter, der nochnicht ist.| es legen sich alle zur ruhe.",
                                         }
                                    }, 
                                      {
                                        "item": {
                                            "id": "LC001",
                                            "tags": [ "RUB", "1LC" ],
                                            "string": "ich stelle mir vor: |die weggegabelte entscheidung, |{ca. der reine bezug. }|am andern ende die verkabelung ist ausgelöst, |weil import  des datamaterial lange verschoben. |hier nurkreisen von motten. |in merkwürdigen kreisen. |kann das nicht richtig sehen, |was sie ins holz schreiben, |aber ich bin mir sicher, |sie haben etwas zu sagen. |soll keine fehler schreiben. |soll keine gebärden mehr.",
                                         }
                                    }
                           
                                              
      
                                ]   //items                
                            }    // group LC
                        },     ///group
                        
                          
                        
// hier comments end for testphase
                      
  {
                            "group": {
                                "name": "MM",
                                "order": "fixed",
                                "items": [
                                    
                                    {
                                        "item": {
                                            "id": "MM002",
                                            "tags": [ "RUB", "2FIL" ],
                                            "string": "zählen Sie uns zu den mandeln. |wie weit wir uns verausgaben..., |alle striche stets umsonst.| warum wir füllmaterial brauchen: |das geschäft mit dem humus vielleicht, |{darin ihr alle aufgehoben der auferstehung entgegen usw.,}| bis :namen: :orte: verschwimmen. |(land) überall.| eure scheisz heimat im geiste.| zählen Sie mich zur mandel hinzu.",
                    
                                        } 
                                    },   
                                    
                                    
 {
                                        "item": {
                                            "id": "MM001",
                                            "tags": [ "RUB", "1MM" ],
                                            "string": "mönch am meer,| der in den sand, der in die wiedergeborene linie am morgen |{seinen fusz setzt.}| wägt den tag ab: |eine neue aufgabe, |eine die wartet, |eine die jetzt schon vergangen.",
                    
                                        } 
                                    },  
                          
                                    
                                    
 
                                    /* filler
                                    {
                                        "item": {
                                            "id": "MM16",
                                            "tags": [ "RUB", "16MM" ],
                                            "string": "Martin war Gourmet.| Er ließ nichts anbrennen, wenn es um gutes Essen ging.| Auch vermeintliches 08/15 Essen| trifft bei seinen Sinnen ins Schwarze.| In Falafel z.B. könnte er baden.| Heute verputzte er schon 2x Falscher Hase vom Grill.| Er ist mit der Nase über den Laden gestolpert.| Er konnte schon von weitem den Braten riechen.| Das passiert ihm öfter,| wenn er durch die Stadt tigert| und seinen Rüssel ausstreckt.",
                                                "prompt": "Wie fassen Sie ‚den Braten riechen‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    },             
                                    
     
                                    
                                    
  {
                                        "item": {
                                            "id": "MM7",
                                            "tags": [ "RUB", "7MM" ],
                                            "string": "Ronja hatte schon vor Jahren das Junglefieber gepackt.| Wie nach einer Gehirnwäsche kam sie auf den Trichter,| bei einer Jungleexpedition aufzusatteln.| Ihre Eltern klopften auf Holz,| als Ronja das Nest verließ.| Als Talisman gaben sie ihr einen Wanderstab mit.| Er war aus demselben Holz geschnitzt| wie die Eingangstür ihres Hauses.| Ronja konnte sich auf die Aufregung ihrer Eltern keinen Reim machen.| Der Jungle ist kein Ponyhof, das war ihr klar.| Aber dass die Natur sie verschlucken würde, glaubte sie nicht.",
                                                "prompt": "Wie fassen Sie ‚aus dem selben Holz geschnitzt‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    },             

                                    
    
                                    
                                    
 {
                                        "item": {
                                            "id": "MM8",
                                            "tags": [ "RUB", "8MM" ],
                                            "string": "Silas versumpfte in letzter Zeit häufiger| in den schrägsten Ecken der Stadt.| Seine alte Stelle war ihm flötengegegangen.| Silas war sofort eine neue zugeflogen,| jedoch fehlte ihm gerade der Funken,| um wieder richtig Gas geben zu können.| Bevor er Makler wurde,| hüpfte Silas auf dem Bau herum,| bis er sich den Rücken zerschossen hatte.| Zumindest muss er sich jetzt| die Hände nicht mehr schmutzig machen,| sagt er immer. Silas gefällt es viel mehr,| butterweiche Hände zu haben, anstatt Reibeisen.",
                                                "prompt": "Wie fassen Sie ‚sich die Hände schmutzig machen‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    },             
                                    
                                    
     
                                    
                                    
 
 
                                     
                                    
 {
                                        "item": {
                                            "id": "MM9",
                                            "tags": [ "RUB", "9MM" ],
                                            "string": "Sören liebt es im Chaos zu baden.| Entsprechend sah es bei ihm auch aus| wie bei Hempels unterm Sofa.| Er sah sich jedoch eher| als Kurator eines Stilllebens.| Zumindest bis das bunte Rabenküken| auf seiner Fensterbank aufschlug und durch seine Galerie bretterte.| Sören musste seine künstlerischen Ausgeburten schließlich begraben| und der Rabe unterschrieb einen Mietvertrag.| Sören erkannte den Wink des Schicksals| und sieht den Raben jetzt als Sprungbrett in die Raben-Performancekunst.",
                                                "prompt": "Wie fassen Sie ‚es flog ihm zu‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }, 
                                    
                                    
 

 
                                    
 {
                                        "item": {
                                            "id": "MM10",
                                            "tags": [ "RUB", "10MM" ],
                                            "string": "Merve driftet häufig in komplett andere Sphären ab.| Dann scannt sie mit Laserblicken| die Umgebung nach magischen Ereignissen| und klebt förmlich an den Dingen.| Als Faultier und Elephant im Porzellanladen| lebt sie die meiste Zeit im Reich zwischen den Extremen,| außer bei Spezialmissionen.| Jedoch ist ihr dabei letztens eine Flasche mit lila Rauch| für ihren Djinn-Trick flöten gegangen, inklusive Monsterwolke.| Sie schwebte durch den Raum.| Eine Legende, die sich Abenteurer noch heute erzählen.",
                                                "prompt": "Wie fassen Sie ‚sie schwebt durch den Raum‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }, 
                                    
 
 
 
                                    
 {
                                        "item": {
                                            "id": "MM11",
                                            "tags": [ "RUB", "11MM" ],
                                            "string": "Petra war Richterin und konnte Argumente, scharf wie Messer, formulieren.| Zuletzt verknackte sie jemanden,| der nicht nur sein Auto tankte,| sondern sich vor dem Fahren auch gerne selber ordentlich die rostige Gurgel ölte.| Beim letzten Mal knutschte er dann den Asphalt.| Es war ein Rausch sondergleichen.| Solche Fälle stehlen Petra die Worte| und sie verdammt den Angeklagten vor der Urteilsverkündung| mit höllischem Schweigen.",
                                                "prompt": "Wie fassen Sie ‚es war ein Rausch sondergleichen‘ auf?",
                                              "options": [
                                          {
                                               "string": "wörtlich",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "figürlich",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }, 
                                    
 
                                    
 
 
                                    
 {
                                        "item": {
                                            "id": "MM12",
                                            "tags": [ "RUB", "12MM" ],
                                            "string": "Harry war ein Überflieger,| wenn es um Tetris ging.| Mit blitzgeölten Bewegungen ratterte er über die Tasten,| doch sonst sah man nur eine steinerne Statue vor dem Spielautomaten.| Seine Gedanken lebten in einer Art Blase| und waren immun gegen das schrille Geschnatter der zuschauenden Zaungäste.| Wie in einem Tornado gefangen| zwirbelte Harry die Tetris-Steine in die richtige Position,| bevor sie weiter fielen und aufschlugen.| Es war ein turbulenter Fall.| Harrys Highscore jedoch explodierte immer weiter nach oben.",
                                                "prompt": "1) Es geht darum, dass etwas hinabfällt. 2) Es geht um etwas wie den Verlust von Erfolg. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }, 
 
                                    

 

                                    
 {
                                        "item": {
                                            "id": "MM13",
                                            "tags": [ "RUB", "13MM" ],
                                            "string": "Peters Musik war ein Jungbrunnen für die Sinne.| Jeden Sonntag tigerte er durch die Stadt| und verzauberte sie mit seinen Beschwörungen.| Sein Instrument hatte er aus verschiedensten Trümmern zusammengegossen.| Es hatte eine gute Resonanz.| Äußerlich war es ein Monster.| Innerlich ein verspieltes Kätzchen.| Peter war ein Stern am Himmel dieser Stadt.| Er brachte Herzen zum Glühen und Berge zum Weinen.",
                                                "prompt": "1) Es geht um akutische bzw. klangliche Eigenschaften. 2) Es geht um die Wirkung die beim Hörer ausgelöst wird.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }   ///}]}}
        
                                     
                                    
 {
                                        "item": {
                                            "id": "MM17",
                                            "tags": [ "RUB", "17MM" ],
                                            "string": "Wir waren die Schüler des Films, der uns etwas über Phantastik beibrachte.| Identitäten von Tieren und Charakteren waren rostige Schrauben, die der Regisseur ständig austauschte.| Zum Beispiel fand sich Dr. Dings – eben noch in seiner New Yorker Kanzlei sitzend – plötzlich mitten im Meer wieder:| Der Anwalt war ein Hai. ",
                                                "prompt": "Warum taucht in der Geschichte ein Hai auf? 1) Es geht um die brutale Rhetorik des Rechtsvertreters. 2) Es geht um die Verwandlung eines Menschen in ein Tier.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }  , 
                        
                                            
                                    
 {
                                        "item": {
                                            "id": "MM18",
                                            "tags": [ "RUB", "18MM" ],
                                            "string": "Für Lars war das Aufstehen eine Zwangsarbeit.| Jeden Morgen weigerte er sich so lange, das Steuer seines Lebens zu übernehmen,| bis Ksenia ihn wachrüttelte.| Bis ins hohe Alter wuchs er aus seinen Kinderschuhen nie ganz heraus. ",
                                                "prompt": "Wie verstehen Sie die markierte Passage? 1) Es geht um das morgendliche Aufwachen aus seinem Schlaf. 2) Es geht um ein spirituelles, politisches, o.ä. Erwachen.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }   ,
                                    
                                                          
 {
                                        "item": {
                                            "id": "MM19",
                                            "tags": [ "RUB", "19MM" ],
                                            "string": "Wenn Hegel philosophierte, entriss er der Philosophie jeden Boden.| Manche sagen, er knipste ihr das Licht an, andere meinen, er versenkte sie im Meer.| Eines Tages war er bei seiner morgendlichen Kopfstandübung in dieser Position eingeschlafen!| Zum Glück wurde Hegel endlich durch Marx| vom Kopf auf die Füße gestellt.",
                                                "prompt": "Warum stellt Marx Hegel auf die Füße? 1) Er befreit Hegel aus einer schief gelaufenen gymnastischen Übung. 2) Es geht um Marx‘ Auseinandersetzung mit Hegels Philosophie.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    } 
                                    
                            /*                
                                                          
 {
                                        "item": {
                                            "id": "MM20",
                                            "tags": [ "RUB", "20MM" ],
                                            "string": "Eigentlich wollten wir die Nachteule im Regal längst durch einen neuen Staubfänger ersetzt haben,| weil sie uns nachts in unseren Träumen heimsuchte.| Weil Putzfee Erna jedoch besessen davon war,| entschieden wir uns dazu, dem ausgestopften Vogel| nur ein Auge zuzudrücken,| was bei Erna Luftsprünge auslöste.| Sie war froh, wenigstens ein wachsames Auge in der Wohnung zu wissen.",
                                                "prompt": "Warum wurden dem Vogel die Augen nicht einfach entfernt? 1) Weil Erna das nicht hätte durchgehen lassen. 2) Weil es besser ist, wenn einer nachts auf uns aufpasst.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    }   */
                        
                        
 
                                    
      
                                ]
                            }
                        } ,
                        
                        
// hier comments end for testphase
                      
  {
                            "group": {
                                "name": "filleritems",
                                "order": "random",
                                "items": [
                                    {
                                        "item": {
                                            "id": "filler01",
                                            "string": "Ronja war in etwa so beweglich wie ein Baum.| Der Apfel fällt nicht weit vom Stamm| und Ronjas Schwester war aus demselben Holz geschnitzt| wie Ronja und ihr Vater.| Nur ihre Mutter war eher ein Springkraut:| flexibel, beweglich, kann in kürzester Zeit ganze Flächen besiedeln.| Ronja musste trotzdem am Sportunterricht teilnehmen.| Und obwohl sie wie ein Felsen dastand,| hatte sie mehr Spaß am Sport als alle anderen zusammen.",
                                     /*             "prompt": "Ergibt das Sinn?",
                                              "options": [
                                          {
                                               "string": "ja",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "nein",
                                               "feedback": "okay."
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerem01",
                                            "string": "Nach Martas Meinung war Depression eine Kröte,| die schmierig auf deinem Kopf hocken konnte,| bis sie endlich doch noch herunterrutschte.| Die Traurigkeit aber, in  der sie die letzten zehn Tage verbracht hatte,| war eine andere.| Hektisch und aggressiv.| {Mit scharfen Krallen.}| Sie hatte nicht auf Marta gesessen,| sondern sie richtig überfallen.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerlc03",
                                            "string": "Helen hatte acht Jahre an der medizinischen Fakultät verbracht| und weitere vier Jahre mit der Ausbildung zur Herzchirurgin,| bevor sie ihren ersten Job bekam.| Trotz dieser langen Zeit hat sie ihre Entscheidungen nie in Frage gestellt.| Schon als Kind wollte sie Ärztin werden.| Am stärksten fühlte Helen sich immer zu Beginn einer Operation,| {wenn sie ihr Skalpell nahe am Herzen ansetzte,}| das Leben ihrer PatientInnen in ihren Händen.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                         {
                                        "item": {
                                            "id": "fillerem04",
                                            "string": "Wenn Ginas Büroangestellte kooperativ waren,| konnten sie großartige Dinge zusammen erreichen.| Sie waren ein Chor in perfekter Harmonie;| die zarten Töne des Soprans| fügten sich perfekt ein in das mächtige Donnern der Bässe.| Nach der Performance musste Gina lediglich| {die Blumensträuße aufheben, die man auf die Bühne geworfen hatte.}| Wenn sie jedoch unkooperativ waren,| war die sich ergebende Kakophonie ein Angriff auf die Sinne.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "fillerlc07",
                                            "string": "Ronja ist in den Bergen aufgewachsen| und an ein naturnahes und körperlich anspruchsvolles Leben gewöhnt.| Abends, nach einem langen Tag,| beschäftigt sie sich auch gerne künstlerisch,| stellt Figuren her.| Zuletzt hat sie einen Luchs gemacht.| {Der ist aus demselben Holz geschnitzt}| wie das Nachtkästchen, dass sie sich gebaut hat.| Ronja hat über die Jahre vielerlei Fertigkeiten erlernt.| Sie sehnt sich jedoch auch nach Neuem.| Ihr großes Ziel ist eine Reise durch die Mongolei.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillersm08",
                                            "string": "Silas ist Kriminologe und interessiert sich schon seit seiner Kindheit für Kriminalfälle.| Da Silas parallel ein Interesse in Naturwissenschaften entwickelte, war Kriminologie das Beste, was er studieren konnte.| Er hatte schon immer wissen wollen, wie es dazu kommt, dass sich Menschen| {die Hände schmutzig machen.}| Die Motive, die inneren Konflikte, und natürlich mit welcher Technik die Täter gefasst werden.| Am meisten fasziniert ihn noch immer die DNA,| und wie so etwas Kleines so deutliche Spuren hinterlässt.",
                       /* 
                        
                                                  "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerem09",
                                            "string": "Sören hatte viel Glück im Leben.| Sein Reichtum war regelrecht vom Himmel gefallen und wenn er Probleme hatte, wurden sie ohne großen Wirbel einfach weggeweht.| Alles fiel ihm in den Schoß.| Und all das, ohne dass er dem Glück je entgegenfliegen musste.| Sören lebte mit den Winden, sagen einige,| manche nannten ihn einen Luftikus.| Doch verflogen hatte er sich im Leben nie.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                    
                                     {
                                        "item": {
                                            "id": "fillerlc13",
                                            "string": "Peter kaufte sich vor kurzem eine Ukulele.| Es war schon immer sein Wunsch gewesen, noch ein Instrument zu lernen.| Sogar den Nachbarn gefiel die Idee.| Er verbrachte ohne Mühe viel Zeit beim Spielen| und der Klang im Wohnzimmer war sehr gut.| {Dieses hatte eine tolle Resonanz.}| Seither veranstaltet er kleine Konzerte,| was den Zusammenhalt unter den Nachbarn stärkt.| Die Ukulele hat Peter zu ganz neuen Ausdrucksmöglichkeiten und FreundInnen verholfen.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                     {
                                        "item": {
                                            "id": "fillerem14",
                                            "string": "Lea hatte sich angewöhnt,| ihren Bruder Matti nur noch als das Grab der Familie vorzustellen,| seit dieser immer mehr in den dunklen Machenschaften einer Bande Kleinkrimineller aufging.| Er empfand sein neues Leben hingegen durchaus als Bereicherung| und hatte keine Ahnung,| warum sie ihm vorwarf,| {er würde das Gold der Familie versilbern.}| Er dachte immer, mit ihr auf einer Wellenlänge gewesen zu sein.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerlc16",
                                            "string": "Martin ist Autor von Kochbüchern.| Er kocht nicht nur aus Leidenschaft,| sondern ist darin sogar etwas obsessiv.| Daher lebt er in einer großen Wohngemeinschaft,| damit er große Mengen für viele Menschen kochen kann.| Heute gibt es Gans.| Schon an der geschlossenen Haustür kann man| {den Braten riechen.}| Martin erfindet täglich neue Rezepte und es kommt selten vor,| dass es jemanden nicht schmeckt.| Daher lädt er auch gerne Gourmets ein,| die spannend über Essen reden können.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerem17",
                                            "string": "Esra wollte ihren ehemaligen Arbeitgeber vor Gericht in Frikassee verwandeln.| Doch sie wusste nicht, dass die Firma sich von einem der gefährlichsten Raubtiere im Meer vertreten ließ.| Keines seiner Opfer war je von ihm verschont worden.| {Der Anwalt war ein Hai.}| Wen er zwischen die Zähne bekam, der konnte damit rechnen, im Gerichtssaal zerfetzt zu werden.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerem19",
                                            "string": "Hegels Vorstellung vom dialektischen Idealismus war eine Kopfgeburt gewesen.| Generationen von nachfolgenden PhilosophInnen bekamen Kopfschmerzen von einem derart schwindelerregenden Konstrukt.| Zum Glück wurde Hegel endlich durch Marx| {vom Kopf auf die Füße gestellt.}",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "fillerem20",
                                            "string": "Eigentlich sollten die Figuren im Regal dafür sorgen,| dass Erna stets alle Hände voll zu tun hatte, wenn sie staubwedelnd durch die Wohnung fegte.| Die Putzfee hatte jedoch ein Geistesblitz ereilt,| als sie einmal zufällig lange genug vor einem der Staubfänger verweilt war.| Man musste bei manchem Reinigungsakt einfach| {ein Auge zudrücken,}| dann säuberten sich die Regale wie von selbst.| Ihre Kinder waren ohnehin blind für den Schmutz.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                     {
                                        "item": {
                                            "id": "fillerlc21",
                                            "string": "Inge liebte es, |an den Wochenenden die Flohmärkte nach second hand Kleidung zu durchstöbern| und auf Schnäppchenjagd zu gehen.| Von der Verkäuferin| {wurde ihr der Spiegel vorgehalten,}| während sie geschickt mit ihr um den Preis feilschte. ",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "fillerem22",
                                            "string": "Anna und Luisa waren ein Herz und eine Seele.| Lange Zeit steuerten sie gemeinsam durch dick und dünn,| bis sie eines Tages vom Kurs abkamen |und ihre Freundschaft | {den Bach runter ging.}",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                         {
                                        "item": {
                                            "id": "fillerlc23",
                                            "string": "Endlich war es da -| das lang ersehnte Wochenende im Vergnügungspark.| Tom und seine FreundInnen reihten sich wieder und wieder in die Schlangen der Wartenden. | Sie ließen keines der Fahrgeschäfte aus. | Ihr Highlight war ein Ritt auf der Achterbahn.",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "fillersm25",
                                            "string": "Die Gefühle seiner Mitmenschen berührten Simon nicht.| Wenn jemand um ihn herum zu emotional war,| {wurde er zum Stein.}| Er war kein guter Zuhörer,| der durch seine bloße Anwesenheit Trost und Wärme gespendet hätte.| Vielmehr blieb er regungslos und ließ sein Gegenüber mit dessen Problemen allein. ",
                       /*                            "prompt": "Haben Sie den Text aufmerksam gelesen?",
                                              "options": [
                                          {
                                               "string": "Ja",
                                               "feedback": "Gut."
                        },
                        {
                                               "string": "Nein",
                                               "feedback": "Das sollten Sie aber bitte!"
                        }
                    ]*/
                                        }
                                    },
                                    
                                    
                                    
                                     {
                                        "item": {
                                            "id": "filler02",
                                            "string": "Silas war Börsenmakler in einem eher kriminellen Unternehmen.| Er war jemand speziell für die dreckigsten Tricks beim Kundenfang und Spekulieren.| Er konnte aus Müll Geld machen.| Es war für ihn kein Problem, sich die Hände schmutzig zu machen.| Er liebte das Schmutzige.| Erst die Finanzkrise setzte dem sudeligen Sumpf einer Firma ein Ende: Erst ging Silas Firma pleite, dann schließlich Silas.| Mittlerweile berät er die Börsenaufsicht und teilt seine schmutzigen Geheimnisse.",
                       /*                           "prompt": "1) Es geht eher darum, Dreck auf die Hände zu bekommen. 2) Es geht eher darum, unangenehme oder kriminelle Arbeit zu verrichten.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]*/
                                        }
                                    },
                                    
                                    
                                    
                                     {
                                        "item": {
                                            "id": "filler03",
                                            "string": "Sörens hatte viel Glück im Leben.| Sein Reichtum viel regelrecht vom Himmel und falls er Probleme hat, werden sie ohne großen Wirbel einfach weggeweht.| Alles fliegt ihm zu.| Und all das, ohne dass er dem Glück je entgegenfliegen musste.| Sören lebte mit den Winden sagen einige, manche nannten ihn Luftikus.| Verflogen hat er sich im Leben bisher noch nie.  ",
                       /*                           "prompt": "1) Es geht darum, dass alles in Sörens Richtung geflogen kommt. 2) Es geht eher darum, dass Sören etwas ohne Mühe zukommt und gelingt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]*/
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler04",
                                            "string": "Merve ist seit einigen Wochen verliebt und nur noch auf fernen Planeten anzutreffen.| Es geschah ohne Countdown ziemlich schnell vor zwei Wochen.| Sie sagte es dauerte etwa 3 Sekunden und sie hatte sofort die Umlaufbahn verlassen.| Sie schwebte durch den Raum.| Seither ist um sie herum alles wie voller Sternenstaub und Glitzer.| Dennoch hat Merve ein wenig Angst, was sie von Zeit zu Zeit doch dazu zwingt, auf Planeten zu landen, um sich ein wenig zu erden.",
                                                 "prompt": "1) Es geht eher um das Erleben von Gefühlen. 2) Es geht eher darum, dass sich jemand schwebend durch den Raum bewegt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler05",
                                            "string": "Petra verlor sich gerne in Träumen und Ideen.| Sie liebte die Trunkenheit während sie sich z.B. Geschichten ausdachte.| Dabei schunkelt sie so lange zwischen den möglichen Wendungen und Visionen, bis sie ein Ende findet.| Sie betrank sich richtig mit Geschichten und war danach wie verkatert.| Es waren heftige Räusche.| Sie war süchtig danach und schaffte es, trotz all der Torkelei auf dem Weg dorthin, Schriftstellerin zu werden.",
                                                 "prompt": "1) Es geht eher um die Wirkung von Alkohol. 2) Es geht eher um die Qualität eines Erlebnisses.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler06",
                                            "string": "Nach 10 Jahren im gleichen Beruf wagte Harry den Sprung in die Freiheit und breitete seine Flügel aus.| Endlich konnte er die Welt von oben sehen, in die Weite blicken und sich losreißen von seinem dunklen Tal aus Akten.| Doch Harry flog so weit in die Höhe, dass er die Kraft verlor.| Es war ein turbulenter Fall.| Harry ging pleite und musste wieder von neuem das Fliegen lernen.| Dennoch blieb er optimistisch und bereute seinen Sprung nicht. ",
                                                 "prompt": "1) Es geht um einen Fall im Raum, bzw. vom Himmel. 2) Es geht um etwas wie den Verlust von Erfolg.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                         {
                                        "item": {
                                            "id": "filler07",
                                            "string": "Peters Reiseberichte waren für die Zuhörer wie ein Gewitter aus Klang.| Mit jeder Wendung in den Erzählungen wurde sie in neue Symphonien gerissen.| Sein Erscheinungsbild war regelrecht explosiv und passte zu der Musik seiner Geschichten.| Es hatte eine gute Resonanz.| Verband sich gut und ergab zusammen eine ganze Oper, der man als Zuschauer beiwohnen konnten.| Man bekam das Gefühl der Korpus seiner Geschichten zu sein.",
                                                 "prompt": "1) Es geht um die Wirkung von Peters Erscheinungsbild. 2) Es geht darum, dass etwas gute akustische Eigenschaften hat.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler08",
                                            "string": "Silas ist Kriminologe und interessierte sich schon seit seiner Kindheit für Kriminalfälle.| Da Silas parallel ein Interesse in Naturwissenschaften entwickelt hat, war Kriminologie das Beste was er studieren konnte.| Er wollte schon immer wissen, wie es dazu kommt, dass sich Menschen die Hände schmutzig machen.| Das Motiv, die inneren Konflikte, und natürlich mit welcher Technik Täter gefasst werden.| Am meisten fasziniert ihn die DNA, und wie so etwas kleines so deutliche Spuren hinterlässt.",
                                                 "prompt": "1) Es geht eher darum, Dreck auf die Hände zu bekommen. 2) Es geht eher darum, unangenehme oder kriminelle Arbeit zu verrichten. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler09",
                                            "string": "Sören war eigen, aber in vielem sehr begabt.| Es war so, dass egal wie komplex die Aufgabe war und wie lange sie dauerte, Sören die Ruhe und die passenden Ideen dafür fand.| Es flog ihm zu.| Mit anderen Sachen hatte Sören wiederum Schwierigkeiten.| Seine Leidenschaften kann er nicht immer gut teilen.| Dennoch fand Sören immer wieder Gesellschaft, zB. über das Schachspielen. ",
                                                 "prompt": "1) Es geht darum, dass etwas zu Sören geflogen gekommen ist. 2) Es geht eher darum, dass Sören viel Glück hat oder ihm etwas ohne Mühe zukommt und gelingt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler10",
                                            "string": "Merve träumt davon Kostümdesignerin zu werden.| Sie konzipiert gerne Kleider für Menschen.| Sie liebt die Unterschiede der Menschen.| Es ergeben sich dadurch viel Design-Möglichkeiten.| Derzeit schneidert sie am liebsten Kleider für die Sängerin und langjährige Freundin Anna.| Sie hat ein sehr besonderes Auftreten, sagt Merve, und schwebe durch den Raum.| Merve gefallen solche Momente und genießt daher ihren Beruf sehr, auch wenn es nicht immer leicht ist in dem Bereich.",
                                                 "prompt": "1) Es geht eher um das Auftreten und Erscheinen einer Person. 2) Es geht eher darum, dass sich jemand schwebend durch den Raum bewegt.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler11",
                                            "string": "Petra besuchte letzte Woche ihr Lieblingsmuseum, in dem sie schon lange nicht mehr gewesen war.| Sie verbrachte Stunden damit sich die Bilder, Kunstwerke, Ausstellungstücke und Info-Texte durchzulesen und alles in Erfahrung zu bringen, was sie konnte.| Es war ein heftiger Rausch.| Petra vergaß schnell die Zeit und wurde fast im Museum eingeschlossen, doch der Hausmeister bemerkte sie zum Glück noch rechtzeitig.",
                                                 "prompt": "1) Es geht eher um die Wirkung von Substanzen. 2) Es geht eher um die Qualität eines Erlebnisses.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                         {
                                        "item": {
                                            "id": "filler12",
                                            "string": "Harry machte vor Jahren viel Geld mit Gewinnspielen und hatte ein sorgenfreies Leben: Alles lief super.| Doch dann machte Harry schwere Verluste.| Sehr schnell bekam Harry finanzielle Probleme, der Stress wurde zu viel und er konnte nicht mehr.| Es war ein turbulenter Fall.| Harry hatte sich übernommen und verlor alles.| Harry fand jedoch auch danach wieder einen Weg und sucht heutzutage den Spaß am Risiko vielleicht höchstens noch in Videospielen.",
                                                 "prompt": "1) Es geht um einen Fall im Raum. 2) Es geht um etwas wie den Verlust von Erfolg und Besitz.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler13",
                                            "string": "Peter beschäftigt sich viel mit bildender Kunst.| Er sucht gerne nach ganz besonderen Details in den Techniken der Künstler und stellt sich vor, wie es ist, ein großes Kunstwerk zu malen.| Besondere Kunst findet Peter aber auch an ganz unscheinbaren Orten.| Gestern ging Peter durch die Straße und begegnete einem tollen Werk.| Es hatte eine gute Resonanz.| Peter mochte solche Ereignisse im Alltag.| Kunst ist überall.",
                                                 "prompt": "1) Es geht um die Wirkung, die das Kunstwerk in Peter erzeugt. 2) Es geht um die akustischen Eigenschaften des Kunstwerks. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler14",
                                            "string": "Silas hat andere Interessen als seine Schwester.| Die will nichts lieber als im Dreck spielen und damit herumspritzen.| Silas hat hingegen andere Freizeitpläne.| Sich die Hände schmutzig machen, das war noch nie was für Silas.| Silas schaute lieber die Welt an, als sie anzufassen, und malte sie gerne.| Weil Hermine Silas oft mit Dreck ärgert, hat sich Silas daher entschieden ein großes Bild seiner Schwester zu malen, wie sie mit einem Traktor Gülle in ihrem Zimmer versprüht.| Sie liebt das Bild.",
                                                 "prompt": "1) Es geht eher darum, Dreck auf die Hände zu bekommen. 2) Es geht eher darum, unangenehme oder kriminelle Arbeit zu verrichten. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler15",
                                            "string": "Sören ist gerne mit sich alleine, dennoch mag er es, wenn es etwas lebendig um ihn herum ist.| Leider gibt es in seiner Gegend kaum interessante öffentliche Plätze, z.B. zum Lesen, und er fährt nur selten in die Stadt.| Seit kurzem lebt bei Sören jedoch ein kleines Vögelchen.| Es flog ihm zu.| Er muss es noch eine Weile pflegen, damit es bald wieder fliegen kann.| Sören vermisst jetzt schon die Zeit mit dem Vögelchen.",
                                                 "prompt": "1) Es geht darum, dass etwas zu Sören geflogen gekommen ist. 2) Es geht eher darum, dass jemand viel Glück hat oder ihm etwas ohne Mühe zukommt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler16",
                                            "string": "Merve ist Astronautin und liebt jeden Moment, den sie in der Umlaufbahn der Erde verbringen kann.| Gerade schickt sie ihren Freunden eine Videobotschaft und demonstriert ihren Freunden, die Schwerelosigkeit.| ‚Wie einfach man sich hier von A nach B bewegen kann!‘ Sie schwebt durch den Raum.| Dann macht sie noch ein paar Saltos.| Ihre Freunde sind total begeistert.| Ob sie wieder zurück möchte, wird sie gefragt. ‚Ja sagt sie, aber es wäre auch schön, wenn die Erde ins All kommen könnte.‘",
                                                 "prompt": "1) Es geht eher um das Auftreten und Erscheinen einer Person. 2) Es geht eher darum, dass sich jemand schwebend durch den Raum bewegt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                         {
                                        "item": {
                                            "id": "filler17",
                                            "string": "Petra besuchte vor einer Woche ihren alten Freund Miroslav.| Früher waren sie beste Freunde und hatten zusammen sogar eine Punk-Band.| Sie redeten bis spät in die Nacht über alte Zeiten und tranken Sterni.| Es war ein heftiger Rausch.| Petra hatte am nächsten Tag starke Kopfschmerzen.| Miroslav hat jedoch die besten Rezepte gegen Kopfschmerzen und so ging es Petra schnell wieder gut. ",
                                                 "prompt": "1) Es geht eher um die Wirkung von Alkohol. 2) Es geht eher um die Qualität eines Erlebnisses.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler18",
                                            "string": "Harry war sich sicher, dass er seinen ersten Fallschirmsprung gut meistern würde.| Es war sein größter Traum, wenn auch zugleich seine größte Angst, einmal mit dem Fallschirm aus einem Flugzeug zu springen.| Es war ein turbulenter Fall.| Harry hatte jedoch den Spaß seines Lebens.| Mächtig durchgeschüttelt kam er wieder heil am Boden an und sprang sofort nochmal. ",
                                                 "prompt": "1) Es geht um einen Fall im Raum. 2) Es geht um etwas wie bspw. einen Karriereabsturz.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler19",
                                            "string": "Peter kaufte sich vor kurzem eine Ukulele.| Es war schon immer sein Wunsch, noch ein Instrument zu lernen.| Sogar den Nachbarn gefiel die Idee.| Er verbrachte ohne Mühe viel Zeit und der Klang im Wohnzimmer war sehr gut.| Es hatte eine gute Resonanz.| Seither veranstaltet er kleine Konzerte, was den Zusammenhalt unter den Nachbarn stärkte.| Die Ukulele verhalf Peter zu ganz neuen Ausdrucksmöglichkeiten und Freunden.",
                                                 "prompt": "1) Es geht um die Raumakustik des Wohnzimmers. 2) Es geht um die Rezension von Peters Musik in einer Zeitung",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler20",
                                            "string": "Silas versumpfte in letzter Zeit häufiger in den schrägsten Ecken der Stadt.| Seine Stelle ging ihm flöten.| Silas ist sofort eine neue zugeflogen, jedoch fehlt ihm gerade der Funken, um wieder richtig Gas geben zu können.| Bevor er Makler wurde, hüpfte Silas auf dem Bau herum, bis er sich den Rücken zerschossen hat.| Zumindest muss er sich die Hände nicht mehr schmutzig machen, sagt er immer.| Silas gefällt ist viel mehr, butterweiche Hände zu haben, anstatt Reibeisen. ",
                                                 "prompt": "1) Es geht eher darum, Dreck auf die Hände zu bekommen. 2) Es geht eher darum, unangenehme oder kriminelle Arbeit zu verrichten. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler26",
                                            "string": "Sören liebt es im Chaos zu baden.| Seine Wohnung glich einem Testgelände für Bomben.| Er selbst sah sich eher als Kurator eines Stilllebens.| Zumindest bis das wackelige Rabenküken auf seiner Fensterbank aufschlug und durch seine Galerie bretterte.| Es flog ihm zu.| Nach zwei Tagen konnte Sörens neuer Kollege wieder auf Spur gebracht werden.| Seither besucht der Rabe Sören häufiger, um gemeinsam mit ihm im Chaos zu baden. ",
                                                 "prompt": "1) Es geht darum, dass etwas zu Sören geflogen gekommen ist. 2) Es geht eher darum, dass jemand viel Glück hat oder ihm etwas ohne Mühe zukommt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler21",
                                            "string": "Merves Theaterprojekt war ein Schiff ohne Kurs.| In der Organisation war der Wurm drin.| Auch ihre Freunde ließen sie am Ende fast in der Wüste stehen.| Sie stand vor einem Berg aus Trümmern, aber sie folgte weiter dem Ruf der Bühne und rettete ihr Baby: Sie sezierte das Skript, würzte ein paar Stellen und konnte mit der Bühnentechnik sogar eine bunte Monsterwolke züchten.| Sie schwebte durch den Raum während dem Finale.| Die Show wurde zum Feuerwerk für Sinne.",
                                                 "prompt": "1) Es geht eher um das Erleben von Gefühlen, oder die Wirkung einer Person auf andere. 2) Es geht eher darum, dass sich etwas schwebend durch den Raum bewegt. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler22",
                                            "string": "Petra ist Richterin.| Sie kann problemlos Argumente so tief wie Ozeane formulieren.| Zugleich klingen sie wie feine, scharfe Messer.| Sie behält immer die Fassung, aber selten bricht doch ein Damm in ihr.| Zuletzt tanke jemand vor der Fahrt sein Auto und sich selbst.| Der Fahrer knutschte schließlich den Asphalt.| Es war ein heftiger Rausch.| Das Auto war nur noch eine Flunder und es gab neben dem Fahrer zwei Verletzte.| In solch unverantwortlichen Fällen bricht in Petra ein Feuer aus und ihre Worte werden zu Raketen.",
                                                 "prompt": "1) Es geht eher um die Wirkung von Alkohol. 2) Es geht eher um die Qualität eines Erlebnisses oder einer Handlung.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler23",
                                            "string": "Harry war ein Überflieger, wenn es um Tetris ging.| Mit blitzgeölten Bewegungen rattern seine Hände über die Tasten, ansonst sah man nur eine steinerne Statue vor dem Spielautomaten.| Seine Gedanken lebten in einer Art Blase und waren immun gegen das schrille Geschnatter der zuschauenden Zaungäste.| Wie in einem Strudel gefangen schraubten sich die Tetris-Steine zu Boden.| Es war ein turbulenter Fall.| Harrys Highscore jedoch explodierte immer weiter nach oben. ",
                                                 "prompt": "1) Es geht darum, dass etwas hinabfällt. 2) Es geht um etwas wie den Verlust von Erfolg. ",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                        {
                                        "item": {
                                            "id": "filler24",
                                            "string": "Peters Musik war ein Jungbrunnen für die Sinne.| Jeden Sonntag tigerte er durch die Stadt und verzauberte sie mit seinen Beschwörungen.| Sein Instrument hatte er aus verschiedensten Trümmern zusammengegossen.| Es hatte eine gute Resonanz.| Äußerlich war es ein Monster.| Innerlich ein verspieltes Kätzchen.| Peter war ein Stern am Himmel dieser Stadt.| Er brachte Herzen zum Glühen und Berge zum Weinen.",
                                                 "prompt": "1) Es geht um akutische bzw. klangliche Eigenschaften. 2) Es geht um die Wirkung die beim Hörer ausgelöst wird.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                    {
                                        "item": {
                                            "id": "filler25",
                                            "string": "Ronja hatte schon vor Jahren das Junglefieber gepackt.| Wie nach einer Gehirnwäsche kam sie auf den Trichter,| bei einer Jungleexpedition aufzusatteln.| Ihre Eltern klopften auf Holz,| als Ronja das Nest verließ.| Als Talisman gaben sie ihr einen Wanderstab mit.| Er war aus demselben Holz geschnitzt| wie die Eingangstür ihres Hauses.| Ronja konnte sich auf die Aufregung ihrer Eltern keinen Reim machen.| Der Jungle ist kein Ponyhof, das war ihr klar.| Aber dass die Natur sie verschlucken würde, glaubte sie nicht.",
                                                 "prompt": "Ergibt das Sinn?",
                                              "options": [
                                          {
                                               "string": "ja",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "nein",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                    
                                    {
                                        "item": {
                                            "id": "filler27",
                                            "string": "Wenn Heinz Restaurants testete, verfuhr er wie ein Sieb.| Weniger gute landeten gleich auf seinem mentalen Müllhaufen.| Er wurde wütend, wenn Chocolatiers Verbrechen an einem Dessert begingen:| ‚Das ist keine Pralinenschachtel, sondern eine Portion Mensafraß.‘",
                                                 "prompt": "Wie verstehen Sie die markierte Passage? 1) Es geht um Heinz‘ Abneigung gegenüber Essen aus der Kantine. 2) Es geht um Heinz‘ allgemeine Unzufriedenheit.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler28",
                                            "string": "Die Gefahr, die von der Medusa ausging, war eine reißende Schlucht.| Denn ihr Blick gefror jeden, der ihm begegnete, in eine unbewegliche Puppe.| Auch als Simon sie ansah,| wurde er zum Stein.| Die Medusa war bekannt als der weiße Hai unter den Meeresgottheiten.",
                                                 "prompt": "Warum taucht hier ein Stein auf? 1) Es geht um die Verwandlung eines Menschen in ein Ding. 2) Es geht um Simons emotionale Distanziertheit.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                     {
                                        "item": {
                                            "id": "filler29",
                                            "string": "Das mobile Schulprojekt „Bücher auf Rädern“ goss Wissen wie durch Trichter in die Schüler ein.| Das Vorzeigekonzept war der glänzende Stern am Himmel des sozialen Engagements.| Schüler verschlangen nun Bücher, die in einem Bus zu ihnen kamen.| Es war eine wandelnde Bibliothek.",
                                                 "prompt": "Warum wird das Projekt als wandelnde Bibliothek bezeichnet? 1) Weil ein Bus Bücher zu den Schülern bringt. 2) Weil eine Bibliothek so umgebaut wurde, dass man sie nun als Fahrzeug benutzen kann.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                       {
                                        "item": {
                                            "id": "filler30",
                                            "string": "Das mobile Schulprojekt „Bücher auf Rädern“ sollte Wissen auch in die entlegensten Dörfer bringen.| Die Schüler vor Ort konnten für vier Wochen ein Buch aus dem Bus ausleihen| und wenn er abfuhr, erhielten die Schulen digitale Kopien.| Es war eine wandelnde Bibliothek.",
                                                 "prompt": "Warum wird das Projekt als wandelnde Bibliothek bezeichnet? 1) Weil ein Bus Bücher zu den Schülern bringt. 2) Weil eine Bibliothek so umgebaut wurde, dass man sie nun als Fahrzeug benutzen kann.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler31",
                                            "string": "Es schien, als könnte Erna sich alles merken.| Besonders in den Naturwissenschaften hatte sie ein beachtliches Wissen angesammelt.| Wenn es darauf ankam, konnte sie immer diejenige Information abrufen,| die im Moment entscheidend war.| Erna war eine wandelnde Bibliothek. ",
                                                 "prompt": "Warum wird Erna als wandelnde Bibliothek bezeichnet? 1) Weil sie viel weiß. 2) Weil sie viele Bücher hat.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                     {
                                        "item": {
                                            "id": "filler32",
                                            "string": "Jede neue Information wurde von Erna wie ein Buch in ihr mentales Bücherregal gestellt.| Die Abteilung für Naturwissenschaften war besonders gut sortiert.| Wenn es darauf ankam,| konnte sie immer auf dieses Archiv zurückgreifen.| Erna war eine wandelnde Bibliothek.",
                                                 "prompt": "Warum wird Erna als wandelnde Bibliothek bezeichnet? 1) Weil sie viel weiß. 2) Weil sie viele Bücher hat.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                      {
                                        "item": {
                                            "id": "filler33",
                                            "string": "Jeder wusste, dass es gefährlich war, der Medusa direkt in die Augen zu sehen.| Auch Simon hatte man gewarnt, doch es war schon zu spät| und so wurde er zum Stein.| Ihr Blick hatte ihn durchbohrt und verwandelte ihn in leblose Materie. ",
                                                 "prompt": "Warum taucht hier ein Stein auf? 1) Es geht um die Verwandlung eines Menschen in ein Ding. 2) Es geht um Simons emotionale Distanziertheit.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    },
                                    
                                           {
                                        "item": {
                                            "id": "filler35",

                                            "string": "Lea hatte sich angewöhnt,| ihren Bruder Matti nur noch als das Grab der Familie vorzustellen,| seit dieser immer mehr in den dunklen Machenschaften einer Bande Kleinkrimineller aufging.| Er empfand sein neues Leben hingegen durchaus als Bereicherung| und hatte keine Ahnung,| warum sie ihm vorwarf,| er würde das Gold der Familie versilbern.",
                                                "prompt": "Sind Sie auch der Meinung, das Familiengold sollte besser nicht versilbert werden? 1) Ja/Nein 2) Das ist egal, Lea geht es um etwas anderes.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    },      
                                    
                                     {
                                        "item": {
                                            "id": "filler36",

                                            "string": "Julie war nach Julians Aussage eine heiße Olle,| die er nicht, ohne sein Bein zu heben,| an der Ecke würde stehengelassen haben -| wenn sie einmal beim Sex auf ihn warten würde.| So aber wie die Dinge lagen,| konnte er stets nur zusehen,| wie sie schon den nächsten vernaschte, statt zu warten,| bis er denn endlich gekommen war.",
                                                  "prompt": "Finden Sie es schlimm, wenn jemand zu spät zu einem Date kommt? 1) Jein 2) Ich glaube, es geht hier um etwas anderes.",
  "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                        
                    ]
                                        }
                                        },
                                      
                                            {
                                        "item": {
                                            "id": "filler37",

                                            "string": "Eigentlich sollten die Figuren im Regal dafür sorgen,| dass Erna stets alle Hände voll zu tun hatte, wenn sie staubwedelnd durch die Wohnung fegte.| Die Putzfee hatte jedoch ein Geistesblitz ereilt,| als sie einmal zufällig lange genug vor einem der Staubfänger verweilt war.| Man musste bei manchem Reinigungsakt einfach| ein Auge zudrücken,| dann säuberten sich die Regale wie von sebst.| Ihre Kinder waren ohnehin blind für den Dreck.",
                                                "prompt": "Versuchen Sie, zu beantworten, warum <ein Auge zugedrückt> werden soll: 1) Damit man den Dreck nicht sieht. 2) Weil man nicht immer alles perfekt machen muss.",
                                              "options": [
                                          {
                                               "string": "(1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "(2)",
                                               "feedback": "okay."
                        }
                    ]
                                        } 
                                    },  
                                    
                                      {
                                        "item": {
                                            "id": "filler34",
                                            "string": "Privat und beruflich langweilte Heinz sich schon lange.| Er glaubte nicht mehr an Überraschungen,| sondern fühlte nur noch Stagnation.| Er mochte sein Leben nicht und sagte:| ‚Das ist keine Pralinenschachtel, sondern eine Portion Mensafraß.‘",
                                                 "prompt": "Wie verstehen Sie die markierte Passage? 1)Es geht um Heinz‘ Abneigung gegenüber Essen aus der Kantine. 2) Es geht um Heinz‘ allgemeine Unzufriedenheit.",
                                              "options": [
                                          {
                                               "string": "1)",
                                               "feedback": "okay."
                        },
                        {
                                               "string": "2)",
                                               "feedback": "okay."
                        }
                    ]
                                        }
                                    }
                                    
                                    
                                    
                                ]
                            }
                        }                         ///end filler group

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