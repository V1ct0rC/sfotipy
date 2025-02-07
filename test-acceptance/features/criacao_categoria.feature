Feature: Criação de Categorias
    As um usuário com login e senha e tenho permissão para gerenciar a playlist
    I want to criar e gerenciar categorias de uma playlist 
    So that as categorias de uma playlist serão definidas

    Scenario: adicionando nova categoria a uma playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Melhores Pop" com id "1"
        And tenho permissão para gerenciar "Melhores Pop"
        And "POP" é uma categoria da playlist "Melhores Indie"
        When seleciono a opção de adicionar uma nova categoria
        And seleciono "ROCK" como uma nova categoria
        Then "ROCK" é uma nova categoria da playlist "Melhores Pop"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"

    Scenario: mudança de categoria de playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Melhores Indie" com id "2"
        And tenho permissão para gerenciar "Melhores Indie"
        And "INDIE" não é uma categoria da playlist "Melhores Indie"
        And "ELECTRONIC" é uma categoria da playlist "Melhores Indie"
        When seleciono a opção de adicionar uma nova categoria
        And seleciono "ELECTRONIC" para o remover das categorias
        And seleciono "INDIE" como uma nova categoria
        Then "INDIE" é uma nova categoria da playlist "Melhores Indie"
        And "ELECTRONIC" não é mais uma categoria da playlist "Melhores Indie"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"
    
    Scenario: remover uma categoria de uma playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Para Você" com id "3"
        And tenho permissão para gerenciar "Para Você"
        And "ROCK" é uma categoria da playlist "Para Você"
        When seleciono a opção de adicionar uma nova categoria
        And seleciono "ROCK" para o remover das categorias
        Then "ROCK" não é mais uma categoria da playlist "Para Você"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"

    Scenario: tentando adicionando categoria já existente na playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Para Dormir" com id "4"
        And tenho permissão para gerenciar "Para Dormir"
        And "HIP-HOP" é uma categoria da playlist "Para Dormir"
        When seleciono a opção de adicionar uma nova categoria
        Then não consigo ver "HIP-HOP" como uma categoria para ser selecionada
        And "Para Dormir" continua tendo somente uma categoria, que é "HIP-HOP"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"

    Scenario: mais de duas categorias para playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Melhores Rock" com id "5"
        And "ROCK" é uma categoria da playlist "Melhores Rock"
        And "HIP-HOP" é uma categoria da playlist "Melhores Rock"
        When não consigo encontrar a opção de adicionar uma nova categoria
        Then "ROCK" é uma categoria da playlist "Melhores Rock"
        And "HIP-HOP" é uma categoria da playlist "Melhores Rock"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"

    Scenario: removendo todas as categorias de uma playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Rocking with Imagine Dragons" com id "6"
        And "KPOP" é uma categoria da playlist "Rocking with Imagine Dragons"
        And "ELECTRONIC" é uma categoria da playlist "Rocking with Imagine Dragons"
        When seleciono "ELECTRONIC" para o remover das categorias
        And seleciono "KPOP" para o remover das categorias
        Then "ELECTRONIC" e "KPOP" não são mais categorias da playlist "Rocking with Imagine Dragons"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"
    
    Scenario: adicionando duas categorias para a playlist
        Given possuo login "jsa2@cin.ufpe.br" e senha "senha123"
        And estou na página da playlist "Eminem's Greatest Hits" com id "7"
        And "Eminem's Greatest Hits" não possui nenhuma categoria cadastrada
        When seleciono a opção de adicionar uma nova categoria
        And seleciono "ELECTRONIC" como uma nova categoria
        And seleciono "KPOP" como uma nova categoria
        Then "ELECTRONIC" é uma nova categoria da playlist "Eminem's Greatest Hits"
        And "KPOP" é uma nova categoria da playlist "Eminem's Greatest Hits"
        And não estou mais logado com login "jsa2@cin.ufpe.br" e senha "senha123"