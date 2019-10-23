//
//  DesafioTests.swift
//  DesafioTests
//
//  Created by Pedro Alcaide on 15/10/2019.
//  Copyright © 2019 Pedro Alcaide. All rights reserved.
//

import XCTest
@testable import Desafio

class DesafioTests: XCTestCase {
    
    var sut: ViewController?
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
    }
    
    override func tearDown() {
        sut?.presentedViewController?.dismiss(animated: false, completion: nil)
        self.sut = nil
        super.tearDown()
    }
    
    //INFO: Eu tentei buscar como fazer um teste para uma função assincrona (para testar o serviço), pois nunca tinha feito antes.
    //Onde trabalho, utilizamos uma chave, diferenciando entre MockSample(Json) e API Externa, podendo assim, testar o serviço.
    //Reconheço que testes são minha maior falha, pois comecei a pouco tempo a aprender como fazer, e de fato, ser obrigatório na empresa. Peço desculpas por não conseguir testar da melhor maneira possivel, estou buscando melhorar essa minha parte.
    
    func testMockService() {
        let gitHubInfos = GHItem(fullName: "vsouza/awesome-ios", login: "vsouza", avatarUrl: "https://avatars2.githubusercontent.com/u/484656?v=4", starsCount: 33264)

        sut?.user = [gitHubInfos]
        
        assert(sut?.user[0].login == "vsouza")
        assert(sut?.user[0].fullName == "vsouza/awesome-ios")
        assert(sut?.user[0].avatarUrl == "https://avatars2.githubusercontent.com/u/484656?v=4")
        assert(sut?.user[0].starsCount == 33264)
    }
}
