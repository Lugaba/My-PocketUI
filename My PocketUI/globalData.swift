//
//  globalData.swift
//  My PocketUI
//
//  Created by Luca Hummel on 20/07/21.
//

import Foundation

var swiftData = [try! CoreDataStackDocumentation.createDocumentation(title: "Transformar vetor em string", information: "Criamos uma váriavel ou constante que usará o nosso vetor, nesse vetor vamos aplicar o método 'joined(separator: )' que irá juntar todo o vetor em uma string de acordo com um separador, por exemplo, eu quero juntar um vetor em uma string separando os elementos a partir de vírgula:\n/codelet minhaString = meuVetor.joined(separator: ',')", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Passar dados entre Views", information: "Primeiro adicione o identifier 'transitionDiscover' na segue (conexão entre as duas ViewControllers)\nDepois insira esse código:\n/codeoverride func prepare(for segue: UIStoryboardSegue, sender: Any?) {\\n        if segue.identifier == 'transitionDiscover {\\n            let discoverViewController = segue.destination as? DiscoverViewController\\n            discoverViewController?.card=indice\\n        }\\n}\nNesse código estamos transferindo o valor da variável indice da ViewController 'ViewController' para a variável card de 'DiscoverViewController'. No seu código você precisa ter cuidados com algumas coisas: alterar o segue.identifier para o identifier que vocÊ definiu e alterar a classe da View que você quer ser direcionado (No caso queremos a View 'DiscoverViewController').", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Sortear número inteiro", information: "Basta utilizarmos o método random(in:) do tipo de dado Int, por exemplo, quero sortear um número inteiro entre 0 e 2:\n/codevar number = Int.random(in: 0...2)\nReferência:\nhttps://www.hackingwithswift.com/read/2/4/guess-which-flag-random-numbers", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Embaralhar vetor", information: "Os dois métodos que mais utilizamos para fazer isso é o shuffle() e o shuffled(), o primeiro embaralha o vetor em si e o segundo cria um novo vetor igual ao escolhido e embaralha:\n/codevar strings = ['Oh', 'Hello', 'World', 'This', 'Is', 'An', 'Unsorted', 'Array']\\n\\nstrings.shuffle()\\n\\nlet sorted = strings.shuffled()\nReferência:\nhttps://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Deixar String maiúscula ou minúscula", information: "Precisamos apenas usar dois métodos que o tipo String possui: uppercased() para deixar tudo maiúsculo e lowercased() para deixar minúsculo:\n/**/minhaString.uppercased()\n\nminhaString.lowercased()/*\nReferências:\n/btnhttps://developer.apple.com/documentation/swift/string/1640996-uppercased/btn\n/btnhttps://developer.apple.com/documentation/swift/string/1641392-lowercased/btn", isEditable: false, myContent: "Swift")]

var statusBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Alterar cor", information: "Arquivo geral do app → Status bar Style\ninfo.plist → View controller-based status bar appearance = NO\nReferência:\n/btnhttps://www.youtube.com/watch?v=dbAUm4_J8SY/btn", isEditable: false, myContent: "Status Bars")]

var textViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "Desabilitar edição do usuário", information: "Mudamos o valor de seu atributo 'isEditable':\n/**/texto1.isEditable = false/*", isEditable: false, myContent: "Text Views")]

var createData = [statusBarData, textViewData, swiftData]
