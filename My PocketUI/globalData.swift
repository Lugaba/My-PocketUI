//
//  globalData.swift
//  My PocketUI
//
//  Created by Luca Hummel on 20/07/21.
//

import Foundation

// MARK: - Swift Data

var swiftData = [try! CoreDataStackDocumentation.createDocumentation(title: "Transformar vetor em string", information: "Criamos uma váriavel ou constante que usará o nosso vetor, nesse vetor vamos aplicar o método 'joined(separator: )' que irá juntar todo o vetor em uma string de acordo com um separador, por exemplo, eu quero juntar um vetor em uma string separando os elementos a partir de vírgula:\n/**/let minhaString = meuVetor.joined(separator: ',')/*", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Passar dados entre Views", information: "Primeiro adicione o identifier 'transitionDiscover' na segue (conexão entre as duas ViewControllers)\nDepois insira esse código:\n/**/override func prepare(for segue: UIStoryboardSegue, sender: Any?) {\n        if segue.identifier == 'transitionDiscover {\n            let discoverViewController = segue.destination as? DiscoverViewController\n            discoverViewController?.card=indice\n        }\n}/*\nNesse código estamos transferindo o valor da variável indice da ViewController 'ViewController' para a variável card de 'DiscoverViewController'. No seu código você precisa ter cuidados com algumas coisas: alterar o segue.identifier para o identifier que vocÊ definiu e alterar a classe da View que você quer ser direcionado (No caso queremos a View 'DiscoverViewController').", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Sortear número inteiro", information: "Basta utilizarmos o método random(in:) do tipo de dado Int, por exemplo, quero sortear um número inteiro entre 0 e 2:\n/**/var number = Int.random(in: 0...2)/*\nReferência:/btnhttps://www.hackingwithswift.com/read/2/4/guess-which-flag-random-numbers/btn", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Embaralhar vetor", information: "Os dois métodos que mais utilizamos para fazer isso é o shuffle() e o shuffled(), o primeiro embaralha o vetor em si e o segundo cria um novo vetor igual ao escolhido e embaralha:\n/**/var strings = ['Oh', 'Hello', 'World', 'This', 'Is', 'An', 'Unsorted', 'Array']\n\nstrings.shuffle()\n\nlet sorted = strings.shuffled()/*\nReferência:/btnhttps://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift/btn", isEditable: false, myContent: "Swift"), try! CoreDataStackDocumentation.createDocumentation(title: "Deixar String maiúscula ou minúscula", information: "Precisamos apenas usar dois métodos que o tipo String possui: uppercased() para deixar tudo maiúsculo e lowercased() para deixar minúsculo:\n/**/minhaString.uppercased()\n\nminhaString.lowercased()/*\nReferências:/btnhttps://developer.apple.com/documentation/swift/string/1640996-uppercased/btn\n/btnhttps://developer.apple.com/documentation/swift/string/1641392-lowercased/btn", isEditable: false, myContent: "Swift")]

// MARK: - Navigation bar Data

var navigationBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma barra de navegação aparece na parte superior da tela do aplicativo, abaixo da barra de status, e permite a navegação por uma série de telas hierárquicas. Quando uma nova tela é exibida, um botão Voltar, geralmente rotulado com o título da tela anterior, aparece no lado esquerdo da barra.", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar título", information: "Precisamos apenas alterar o valor da váriavel 'title' dentro da viewDidLoad():\n/**/title = 'Storm Viewer'/*", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Deixar título grande", information: "Para realizar tal mudança precisamos alterar para 'true' o atributo 'prefersLargeTitles' da navigationBar:\n/**/navigationController?.navigationBar.prefersLargeTitles = true/*\nMas cuidado! Quando você altera esse atributo essa mudança é realizada em todas as outras views, para contornar esse problema precisamos colocar nas outras views que não queremos título grande o seguinte código:\n/**/navigationItem.largeTitleDisplayMode = .never/*\nReferência:/btnhttps://www.hackingwithswift.com/read/1/6/final-tweaks-hidesbarsontap-safe-area-margins/btn", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar cor", information: "Precisamos alterar a cor do atributo 'barTintColor' da navigationBar, por exemplo, quero deixar a NavigationBar branca:\n/**/navigationController?.navigationBar.barTintColor = .white/*\nReferência:/btnhttps://stackoverflow.com/questions/24687238/changing-navigation-bar-color-in-swift/btn", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Colocar imagem como título", information: "Primeiro precisamos criar uma nova imageView (precisa ser no código porque a NavigationBar não permite no storyboard):\n/**/var imageView: UIImageView = UIImageView()/*\nComo vamos usar uma imagem na NavigationBar precisamos setar isso com código, para isso vamos substituir o título por uma ImageView na viewDidLoad():\n/**/imageView.image = UIImage(named: 'imagesCoracoes')\nimageView.contentMode = .scaleAspectFit\nself.navigationItem.titleView = imageView/*\nMudamos o contentMode para .scaleAspectFit para deixar a imagem no tamanho e proporção corretos para o tamanho do título.", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Retornar 1 tela", information: "Precisamos apenas utilizar o método 'popViewController' da navigationController.\n/**/navigationController?.popViewController(animated: true)/*", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Retornar 2 telas ou mais", information: "Vamos criar uma função que retorna duas telas e quando precisar fazer essa ação basta chama-la. Primeiro precisamos criar um vetor com todas as viewControllers abertas, com isso nós sabemos quantas tem e quais suas posições, depois basta dar um popViewController para a View que nós queremos (você faz isso pelo indice do vetor, no caso para voltar duas é necessário subtrair por 3).\n/**/func backTwo() {\n        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]\n        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)\n    }/*", isEditable: false, myContent: "Navigation Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Esconder botão de Back", information: "Precisamos apenas definir o atributo 'setHidesBackButton' como true:\n/**/self.navigationItem.setHidesBackButton(true, animated: true)/*\nReferência:/btnhttps://stackoverflow.com/questions/27373812/swift-how-to-hide-back-button-in-navigation-item/btn", isEditable: false, myContent: "Navigation Bars")]

// MARK: - Search Bar Data

var searchBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma barra de pesquisa permite que as pessoas pesquisem em uma grande coleção de valores digitando texto em um campo. Uma barra de pesquisa pode ser exibida sozinha ou em uma barra de navegação ou visualização de conteúdo.", isEditable: false, myContent: "Search Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Inserir na NavigationController", information: "Primeiro implemente a NavigationController, quando esta for implementada vá no código da tela que você quer fazer uso da search bar e instancie sua classe:\n/**/let searchController = UISearchController(searchResultsController: nil)/*\nAgora na viewDidLoad nós atribuímos essa searchBar a nossa navigationController e definimos o delegate:\n/**/navigationItem.searchController = searchController\nsearchController.searchBar.delegate = self/*\nAgora basta utilizar suas funções e criar a lógica dentro delas para fazer a pesquisa, algumas das funções que existem:\n/**/func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { }\n\nfunc searchBarTextDidBeginEditing(_ searchBar: UISearchBar) { }\n\nfunc searchBarCancelButtonClicked(_ searchBar: UISearchBar) { }/*\nReferência:/btnhttps://www.youtube.com/watch?v=LlQGY6Iidoc/btn", isEditable: false, myContent: "Search Bars")]

// MARK: - SideBar Data

var sideBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma barra lateral fornece navegação no aplicativo e acesso rápido a coleções de conteúdo de nível superior em seu aplicativo. Selecionar um item na barra lateral permite que as pessoas naveguem para uma parte específica do conteúdo.", isEditable: false, myContent: "Sidebars")]

// MARK: - Status Bar Data

var statusBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "A barra de status aparece ao longo da borda superior da tela e exibe informações úteis sobre o estado atual do dispositivo, como a hora, operadora de celular e nível de bateria. As informações reais mostradas na barra de status variam dependendo do dispositivo e da configuração do sistema.", isEditable: false, myContent: "Status Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar cor", information: "Arquivo geral do app → Status bar Style\n\ninfo.plist → View controller-based status bar appearance = NO\n\nReferência:/btnhttps://www.youtube.com/watch?v=dbAUm4_J8SY/btn", isEditable: false, myContent: "Status Bars")]

// MARK: - Tab Bars Data

var tabBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma Tab Bar aparece na parte inferior da tela de um aplicativo e permite que as pessoas alternem rapidamente entre as diferentes seções de um aplicativo. As Tab Bars são translúcidas, podem ter uma tonalidade de fundo, mantêm a mesma altura em todas as orientações da tela e ficam ocultas quando um teclado é exibido.", isEditable: false, myContent: "Tab Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Como usar NavigationController e Tab Bar", information: "É recomendável fazer isso no início do projeto. No storyboard clique na única viewController, agora na barra superior do xcode vá em 'Editor' → 'Embed In' → 'Navigation Controller'.\nAcabamos de criar a NavigationController, agora com ela selecionada repita o mesmo processo: 'Editor' → 'Embed In' → 'Tab Bar Controller'.\n\nBoa! Agora temos 1 item na nossa Tab Bar, para colocar as outras telas faça o mesmo procedimento de adicionar NavigationController. Quando ela já estiver conectada a uma NavigationController, segure 'control', aperte na Tab Bar Controller e arraste até sua nova Navigation Controller, no menu selecione 'view controllers'.\n\nReferência:/btnhttps://stackoverflow.com/questions/27422054/how-to-implement-tab-bar-controller-with-navigation-controller-in-right-way/btn", isEditable: false, myContent: "Tab Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Esconder Tab Bar", information: "Só colocar esse código na viewDidLoad:\n/**/self.tabBarController?.tabBar.isHidden = true/*\nReferência:/btnhttps://stackoverflow.com/questions/28777943/hide-tab-bar-in-ios-swift-app/28778105/btn", isEditable: false, myContent: "Tab Bars"), try! CoreDataStackDocumentation.createDocumentation(title: "Mudar cor e imagem do item", information: "Para mudar a imagem ou texto do item é preciso ir no storyboard e clicar no item que quer alterar, agora basta mudar no canto direito os atributos 'Title' e 'Image'\n\nPara mudar a cor é preciso clicar na Tab Bar controller e alterar o atributo 'Image Tint'", isEditable: false, myContent: "Tab Bars")]

// MARK: - Tool Bars Data

var toolBarData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma Toolbar aparece na parte inferior da tela de um aplicativo e contém botões para realizar ações relevantes para a tela atual ou conteúdo dentro dela. As barras de ferramentas são translúcidas, podem ter uma tonalidade de fundo e muitas vezes se escondem quando é improvável que as pessoas precisem delas.", isEditable: false, myContent: "Toolbars"), try! CoreDataStackDocumentation.createDocumentation(title: "Implementar", information: "Primeiro criamos os seus botões, o primeiro botão carrega espaço em branco flexível, coloque ele entre os botões para deixar na mesma distância. Depois só precisamos colocar os botões no vetor da toolBar:\n/**/let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)\nlet refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))\nlet backButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))\nlet forwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))\nlet progressButton = UIBarButtonItem(customView: progressView)\n\ntoolbarItems = [backButton, forwardButton, spacer ,progressButton, spacer, refresh]/*\nTambém devemos lembrar de fazer ela aparecer, colocando como false seu atributo Hidden:\n/**/navigationController?.setToolbarHidden(false, animated: false)/*\nReferência:/btnhttps://www.hackingwithswift.com/example-code/uikit/how-to-show-and-hide-a-toolbar-inside-a-uinavigationcontroller/btn", isEditable: false, myContent: "Toolbars")]

// MARK: - Action Sheets Data

var actionSheetsData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma Action Sheet é um estilo específico de alerta que apresenta duas ou mais opções relacionadas ao contexto atual. Em telas menores, uma Action Sheet desliza da parte inferior da tela; em telas maiores, uma Action Sheet aparece de uma vez como um popover.", isEditable: false, myContent: "Action Sheets")]

// MARK: - Activity Views Data

var activityViewsData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma atividade é uma tarefa, como Copiar, Favoritar ou Encontrar, que é útil no contexto atual. Uma vez iniciada, uma atividade pode executar uma tarefa imediatamente ou solicitar mais informações antes de prosseguir. As atividades são gerenciadas por uma Activity View, que aparece como uma folha ou popover, dependendo do dispositivo e da orientação. Use atividades para dar às pessoas acesso a serviços ou tarefas personalizados que seu aplicativo pode executar.", isEditable: false, myContent: "Activity Views")]

// MARK: - Alerts Data

var alertsData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Os alertas transmitem informações importantes relacionadas ao estado do seu aplicativo ou dispositivo e frequentemente solicitam feedback. Um alerta consiste em um título, uma mensagem opcional, um ou mais botões e campos de texto opcionais para coleta de entrada. Além desses elementos configuráveis, a aparência visual de um alerta é estática e não pode ser personalizada.", isEditable: false, myContent: "Alerts")]

// MARK: - Collections Data

var collectionsData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma coleção gerencia um conjunto ordenado de conteúdo, como um conjunto de fotos, e o apresenta em um layout personalizável e altamente visual. Como uma coleção não impõe um formato estritamente linear, ela é particularmente adequada para exibir itens que variam em tamanho.", isEditable: false, myContent: "Collections")]

// MARK: - Image Views Data

var imageViewsData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma Image View exibe uma única imagem ou uma sequência animada de imagens sobre um fundo transparente ou opaco. Em uma Image View, as imagens podem ser esticadas, dimensionadas, dimensionadas para caber ou fixadas em um local específico. As Image Views não são interativas por padrão.", isEditable: false, myContent: "Image Views")]

// MARK: - Pages Data

var pagesData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Um page view controller fornece uma maneira de implementar navegação linear entre páginas de conteúdo, como em um documento, livro, bloco de notas ou calendário. Um page view controller usa um de dois estilos para gerenciar as transições entre as páginas durante a navegação - rolagem ou ondulação da página.", isEditable: false, myContent: "Pages")]

// MARK: - Popovers Data

var popoverData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Um popover é uma exibição temporária que aparece acima de outro conteúdo na tela quando você toca em um controle ou em uma área. Normalmente, um popover inclui uma seta apontando para o local de onde surgiu. Popovers podem ser não modais ou modais. Um popover não modal é descartado tocando em outra parte da tela ou em um botão do popover. Um popover modal é dispensado ao tocar em um botão Cancelar ou outro botão no popover.\nPopovers são mais apropriados em telas maiores e podem conter qualquer variedade de elementos, incluindo navigation bars, toolbars, tab bars, tables, collections, images, maps, e custom views.", isEditable: false, myContent: "Popovers")]

// MARK: - Scroll Views Data

var scrollViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma scroll view permite que os usuários naveguem pelo conteúdo, como o texto em um documento ou uma coleção de imagens, que é maior do que a área visível. À medida que as pessoas deslizam, agitam, arrastam, tocam e beliscam, uma scroll view segue o gesto, revelando ou ampliando o conteúdo de uma forma que pareça natural. A própria scroll view não tem aparência, mas exibe indicadores de rolagem transitórios conforme as pessoas interagem com ela. Uma scroll view também pode ser configurada para operar no modo de paginação, em que a rolagem revela uma página de conteúdo totalmente nova em vez de mover-se pela página atual.", isEditable: false, myContent: "Scroll Views")]

// MARK: - Split Views Data

var splitViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma split view gerencia a apresentação do conteúdo hierárquico no nível superior do seu aplicativo.\nUma split view consiste em uma interface de duas ou três colunas mostrando uma coluna primária, uma coluna suplementar opcional e um painel secundário de conteúdo. As alterações na coluna primária geram alterações na coluna suplementar opcional, que afetam o próprio conteúdo.", isEditable: false, myContent: "Split Views")]

// MARK: - Tables Data

var tablesData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma table apresenta os dados como uma lista de linhas com rolagem e uma única coluna que pode ser dividida em seções ou grupos. Use uma table para exibir grandes ou pequenas quantidades de informações de forma limpa e eficiente na forma de uma lista. De um modo geral, as tables são ideais para conteúdo baseado em texto e geralmente aparecem como um meio de navegação em um lado de uma split view, com o conteúdo relacionado mostrado no lado oposto.", isEditable: false, myContent: "Tables")]

// MARK: - Text Views Data

var textViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma Text View exibe conteúdo de texto estilizado com várias linhas. As Text Views podem ter qualquer altura e permitir a rolagem quando o conteúdo se estender para fora da visualização. Por padrão, o conteúdo em uma Text View é alinhado à esquerda e usa a fonte do sistema em preto. Se uma Text View for editável, um teclado aparecerá quando você tocar dentro da view.", isEditable: false, myContent: "Text Views"), try! CoreDataStackDocumentation.createDocumentation(title: "Desabilitar edição do usuário", information: "Mudamos o valor de seu atributo 'isEditable':\n/**/texto1.isEditable = false/*", isEditable: false, myContent: "Text Views")]

// MARK: - Web Views Data

var webViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "O que é?", information: "Uma Web View carrega e exibe um conteúdo da web, como HTML incorporado e sites, diretamente no seu aplicativo.", isEditable: false, myContent: "Web Views")]

// MARK: - Buttons Data

var buttonsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Os botões iniciam ações específicas do aplicativo, têm planos de fundo personalizáveis e podem incluir um título ou ícone. O sistema fornece vários estilos de botão predefinidos para a maioria dos casos de uso. Você também pode criar botões totalmente personalizados.", isEditable: false, myContent: "Buttons")]

// MARK: - Color Wells Data

var colorWellsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Quando tocado, uma color well exibe o color picker fornecido pelo sistema. As pessoas podem usar o color picker para escolher uma cor para texto, formas, ferramentas de marcação e outros elementos.\nA interface com guias do color picker permite que as pessoas escolham cores em uma grade ou espectro, ou selecionando valores RGB. As pessoas também podem selecionar uma cor tocando no botão do conta-gotas e usando a lupa para isolar uma cor que aparece em qualquer lugar da tela.", isEditable: false, myContent: "Color Wells")]

// MARK: - Context Menus Data

var contextMenusData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "No iOS 13 e posterior, você pode usar Context Menu para dar às pessoas acesso a funcionalidades adicionais relacionadas a itens na tela sem bagunçar a interface.\nPara revelar um Context Menu, as pessoas podem usar o gesto de tocar e segurar definido pelo sistema ou 3D Touch (o 3D Touch pode fazer os Context Menus aparecerem mais rapidamente). Quando aberto, um Context Menu exibe uma visualização do item e lista os comandos que atuam sobre ele. As pessoas podem escolher um comando ou arrastar o item para outra área, janela ou aplicativo.", isEditable: false, myContent: "Context Menus")]

// MARK: - Edit Menus Data

var editMenusData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "As pessoas podem tocar e segurar ou tocar duas vezes em um elemento em um text field, text view, web view, ou image view para selecionar o conteúdo e revelar opções de edição, como Copiar e Colar.", isEditable: false, myContent: "Edit Menus")]

// MARK: - Labels Data

var labelsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Uma label descreve um elemento de interface na tela ou fornece uma mensagem curta. Embora as pessoas não possam editar as labels, às vezes podem copiar o conteúdo das label. As labels podem exibir qualquer quantidade de texto estático, mas é melhor mantê-los curtos.", isEditable: false, myContent: "Labels"), try! CoreDataStackDocumentation.createDocumentation(title: "Implementar", information: "Para colocar um texto na tela nós precisamos utilizar a classe UILabel(), então primeiro criamos uma instância dela:\n/**/var texto = UILabel()/*\nAgora que temos uma instância, nós podemos modificar alguns atributos dessa variavel, como cor, conteúdo, tamanho da fonte e outros:\n/**/texto.font = UIFont(name: 'AppleColorEmoji', size: 50)\ntexto.textColor = .white\ntexto.text = ?'\ntexto.layer.cornerRadius = 80/*\nCom as configurações feitas nós devemos adicionar essa SubView em nossa View:\n/**/view.addSubview(texto)/*", isEditable: false, myContent: "Labels"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar texto", information: "Precisamos apenas alterar o valor do atributo text' da Label:\n/**/minhaLabel.text = 'Acabei de alterar o texto/*", isEditable: false, myContent: "Labels"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar fonte", information: "Devemos trocar o atributo 'font' da Label por uma valor do tipo UIFont, nesse caso eu quero deixar o texto com a fonte 'AppleColorEmoji' com tamanho 50:\n/**/minhaLabel.font = UIFont(name: 'AppleColorEmoji', size: 50)/*", isEditable: false, myContent: "Labels"), try! CoreDataStackDocumentation.createDocumentation(title: "Alterar cor do texto", information: "Precisamos apenas alterar a cor do atributo textColor' da Label, por exemplo, quero deixar o texto em branco:\n/**/minhaLabel.textColor = .white/*", isEditable: false, myContent: "Labels")]

// MARK: - Page Controls Data

var pageControlsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um Page Control exibe uma linha de imagens indicadoras, cada uma das quais representa uma página em uma lista plana. A linha de rolagem de indicadores ajuda as pessoas a navegar na lista para encontrar a página que desejam; os Page Controls não ajudam as pessoas a visualizar ou navegar nas páginas em uma hierarquia ou organização não linear. Os Page Controls podem lidar com qualquer número de páginas, tornando-os particularmente úteis em situações em que as pessoas podem criar listas personalizadas.", isEditable: false, myContent: "Page Controls")]

// MARK: - Pickers Data

var pickersData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um picker pode exibir uma ou mais listas roláveis de valores distintos que as pessoas podem escolher. No iOS 14 e posterior, um picker de data oferece suporte a maneiras adicionais de escolher valores, como selecionar um dia em uma exibição de calendário ou inserir datas e horas usando um teclado numérico. Ambos os tipos de pickers facilitam a inserção de informações por meio da escolha de valores únicos ou multiparte.", isEditable: false, myContent: "Pickers")]

// MARK: - Progress Indicators Data

var progressViewData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Não deixe as pessoas sentadas olhando para uma tela estática esperando que seu aplicativo carregue o conteúdo ou execute longas operações de processamento de dados. Use progress indicators e progress bars para que as pessoas saibam que seu aplicativo não está parado e para dar a elas uma ideia de quanto tempo elas estarão esperando.", isEditable: false, myContent: "Progress Indicators"), try! CoreDataStackDocumentation.createDocumentation(title: "Implementar", information: "1. Crie uma nova ProgressView no storyboard\n2. Conecte essa View no código\n/**/@IBOutlet weak var progressView: UIProgressView!/*\n3. Crie uma constante que guardará a quantidade de etapas que essa View vai ter\n/**/let progresso = Progress(totalUnitCount: 10)/*\n4. Crie um botão e conecte sua ação no código\n5. Nesta função toda vez que clicar no botão o progresso será acrescentado em 1, vamos transformar o progresso atual em um número Float e depois vamos setar o Progresso na View\n/**/@IBAction func didTapStartProgress(_ sender: Any) {\n        if progresso.isFinished {\nprogressView.progress = 0 \n            progresso = Progress(totalUnitCount: 10)\n        } else {\n            self.progresso.completedUnitCount += 1 // +1 etapa\nlet progressFloat = Float(self.progresso.fractionCompleted)\n            self.progressView.setProgress(progressFloat, animated: true)\n        }\n    }/*", isEditable: false, myContent: "Progress Indicators"), try! CoreDataStackDocumentation.createDocumentation(title: "Com tempo", information: "Caso queira fazer com tempo basta alterar a função do botão que dará início ao progresso da ProgressView:\n/**/@IBAction func didTapStartProgress(_ sender: Any) {\n       Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in\n            guard self.progresso.isFinished == false else {\n                timer.invalidate()\n                return\n            }\n            self.progresso.completedUnitCount += 1\n            let progressFloat = Float(self.progresso.fractionCompleted)\n            self.progressView.setProgress(progressFloat, animated: true)\n        }\n    }/*\nReferência:/btnhttps://www.youtube.com/watch?v=BEQTE5jnb8U/btn/btnhttps://developer.apple.com/documentation/uikit/uiprogressview/btn/btnhttps://github.com/Lugaba/POC-ProgressBar/blob/main/POC-ProgressBar/ViewController.swift/btn", isEditable: false, myContent: "Progress Indicators"), try! CoreDataStackDocumentation.createDocumentation(title: "Mudar o tamanho", information: "Precisamos alterar o atributo 'transform' da progressView, usados scaledBy que multiplicará o tamanho em X por um valor e o tamanho em Y por outro. Por exemplo, quero que o tamanho em X continue o mesmo (então multiplico por 1 para não alterar o valor) e quero deixar sua largura 5 vezes maior (multiplico 5 vezes o tamanho em Y):\n/**/progressView.transform = progressView.transform.scaledBy(x: 1, y: 5)/*\nReferência:/btnhttps://www.youtube.com/watch?v=BEQTE5jnb8U/btn", isEditable: false, myContent: "Progress Indicators")]

// MARK: - Pull-Down Menus Data

var pullDownData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "No iOS 14 e posterior, um botão pode exibir um menu suspenso que lista itens ou ações que as pessoas podem escolher. Você pode usar um menu suspenso para oferecer itens que estão diretamente relacionados à ação do botão ou para fornecer uma lista de ações que são úteis no contexto atual.", isEditable: false, myContent: "Pull-Down Menus")]

// MARK: - Refresh Content Controls Data

var refreshContentData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um refresh control é iniciado manualmente para recarregar imediatamente o conteúdo, normalmente em uma visualização de tabela, sem esperar que a próxima atualização automática de conteúdo ocorra. Um refresh control é um tipo especializado de activity indicator, está oculto por padrão e se torna visível ao arrastar para baixo na tela a ser recarregada.", isEditable: false, myContent: "Refresh Content Controls")]

// MARK: - Segmented Controls Data

var segmentedControlsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um segmented control é um conjunto linear de dois ou mais segmentos, cada um dos quais funciona como um botão mutuamente exclusivo. Dentro do controle, todos os segmentos são iguais em largura. Como os botões, os segmentos podem conter texto ou imagens. Os segmented controls costumam ser usados para exibir visualizações diferentes.", isEditable: false, myContent: "Segmented Controls")]

// MARK: - Sliders Data

var slidersData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um slider é uma trilha horizontal com um controle chamado polegar, que você pode deslizar com o dedo para mover entre um valor mínimo e máximo, como nível de brilho da tela ou posição durante a reprodução de mídia. Conforme o valor de um slider muda, a parte da trilha entre o valor mínimo e o polegar é preenchida com a cor. Um slider pode, opcionalmente, exibir ícones à esquerda e à direita que ilustram o significado dos valores mínimo e máximo.", isEditable: false, myContent: "Sliders")]

// MARK: - Steppers Data

var steppersData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um stepper é um controle de dois segmentos usado para aumentar ou diminuir um valor incremental. Por padrão, um segmento de um stepper exibe um símbolo de mais e o outro exibe um símbolo de menos. Esses símbolos podem ser substituídos por imagens personalizadas, se desejado.", isEditable: false, myContent: "Steppers")]

// MARK: - Switches Data

var switchesData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um switch é uma alternância visual entre dois estados mutuamente exclusivos - ligado e desligado.", isEditable: false, myContent: "Switches")]

// MARK: - Text Fields Data

var textFieldsData = [try! CoreDataStackDocumentation.createDocumentation(title: "Sua função", information: "Um text field é um campo de linha única e altura fixa, geralmente com cantos arredondados, que abre automaticamente um teclado quando o usuário toca nele. Use um text field para solicitar uma pequena quantidade de informações, como um endereço de e-mail.", isEditable: false, myContent: "Text Fields")]

var createData = [navigationBarData, searchBarData, sideBarData, statusBarData, tabBarData, toolBarData, actionSheetsData, activityViewsData, alertsData, collectionsData, imageViewsData, pagesData, popoverData, scrollViewData, splitViewData, tablesData, textViewData, webViewData, buttonsData, colorWellsData, contextMenusData, editMenusData, labelsData, pagesData, pickersData, progressViewData, pullDownData, refreshContentData, segmentedControlsData, slidersData, steppersData, switchesData, textFieldsData, swiftData]
