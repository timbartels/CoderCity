//
//  Checkpoint.swift
//  codeKlojo
//
//  Created by Robin Woudstra on 07-12-16.
//  Copyright © 2016 Tim Bartels. All rights reserved.
//

import Foundation
import SpriteKit


struct Mission {
    let title: String
    let explanation: String
    let setup: String
    let answer: String
}

class Checkpoint: SKSpriteNode{
    var missions: [Mission] = [
        //Park
        Mission(
            title: "Voorbeeldopdracht: Rekenen",
            explanation: "Met een programmeertaal kun je heel gemakkelijk de moeilijkste rekensommen oplossen. \nZorg dat de uitkomst 10 is.",
            setup: "var plus = 4+3 \nconsole.log(plus)", answer: "10"
        ),
        //Fontein
        Mission(
            title: "Voorbeeldopdracht: Rekenen",
            explanation: "Met een programmeertaal kun je heel gemakkelijk de moeilijkste rekensommen oplossen. \nZorg dat de uitkomst 15 is.",
            setup: "var min = 23-5 \nconsole.log(min)", answer: "15"
        ),
        //Achterstandswijk
        Mission(
            title: "Voorbeeldopdracht: Rekenen",
            explanation: "Met een programmeertaal kun je heel gemakkelijk de moeilijkste rekensommen oplossen. \nZorg dat de uitkomst 15 is.",
            setup: "var delen = 10/2 \nconsole.log(delen)", answer: "15"
        ),
        Mission(
            title: "Voorbeeldopdracht: Rekenen",
            explanation: "Met een programmeertaal kun je heel gemakkelijk de moeilijkste rekensommen oplossen. \nZorg dat de uitkomst 4 is.",
            setup: "var keer = 5*5 \nconsole.log(keer)", answer: "4"
        ),
        //Supermarkt
        Mission(
            title: "Opdracht 1 (Supermarkt) - Rekenen/Variabelen",
            explanation: "Door Blackhat werken onze kassa's niet meer. Maak een variabele totaalprijs die de prijs van de banaan en appel bij elkaar op telt.",
            setup: "var ananas = 0.60 \nvar aardbei = 1.20 \nvar totaalprijs = aardbei + ananas \n// Maak totaalprijs naar 1.50 \nconsole.log(totaalprijs)",
            answer: "1.5"
        ),
        //Kledingwinkel
        Mission(
            title: "Opdracht 2 (Kledingwinkel) - Rekenen/Variabelen",
            explanation: "Door Blackhat werken onze kassa's niet meer. Maak een variabele totaalprijs die de prijs van de broek en trui bij elkaar op telt.",
            setup: "var trui = 6.60 \nvar broek = 7.40 \n// Hier moet een variabele \nconsole.log(totaalprijs)",
            answer: "14"
        ),
        //Restaurant
        Mission(
            title: "Opdracht 2 (Restaurant) - Rekenen/Variabelen",
            explanation: "Door Blackhat werken onze kassa's niet meer en kunnen de pizza's niet goed afrekenen. Zorg dat de pizza's met de door ons berekende prijs overeenkomt",
            setup: "var pizza1 = 6.60 \nvar pizza2 = 10.40 \nvar pizza3 = 7.30 \nvar pizza4 = 13.10 \nvar totaalprijs = 41.00 \ntotaalprijs == pizza1 + pizza2 + pizza3 + pizza4",
            answer: "1"
        ),
        //School
        Mission(
            title: "Opdracht 2 (School) - If/Else",
            explanation: "Blackhat heeft de tijden van de schoolbel aangepast. Pas de tijd aan naar 15:00.",
            setup: "var huidige_tijd = '15:00'; \nvar begintijd = '8:30'; \nvar eindtijd = '17:00'; \nif(huidige_tijd == eindtijd){ \n    schoolBel(); \n}",
            answer: "15:00"
        )
    ]

    init() {
        let texture = SKTexture(imageNamed: "mission")
        super.init(texture: texture, color: UIColor.clear, size: CGSize.zero)
        animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        var scale = SKAction.scale(to: 1.0, duration: 1.0)
    
        if xScale > 0.5 {
             scale = SKAction.scale(to: 0.5, duration: 1.0)
        }
        let completion = SKAction.run(){
            self.animate()
        }
        let sequence = SKAction.sequence([scale, completion])
        run(sequence)
    }
    
    func check(scene: CityScreenScene, position: CGPoint) -> Bool {
        if(position.x > self.position.x && self.position.y-50 < position.y && position.y < self.position.y+50){
            Position.saved = CGPoint(x: self.position.x, y: self.position.y)
            return true
        }
        return false
    }
}

