***Settings***
Documentation   Suíte para exemplificar o uso de LOGs nos testes
...             Os LOGs são de grande utilidade, faça LOGs para analisar como seu teste está sendo executado nas entrelinhas
...             Os LOGs te ajudam a achar falhas na automação dos seus testes
...             Use LOGs sem moderação!!
Library         SeleniumLibrary

***Variables***
@{FRUTAS}     maça     banana     uva     abacaxi

***Test Cases***
Caso de teste exemplo 01
    Usando Log para mensagens
    Usando log console
    Usando screen shots


***Keywords***
Usando Log para mensagens
    Log   Minha mensagem de LOG
    ${VAR}      Set Variable    variável qualquer
    Log         Posso logar em ${VAR} no meio de um log


Usando log console
    Log To Console          Posso logar na saída o console
    Log Many                Posso logar minha lista completa de @{FRUTAS}
    Log                     Posso logar somente irens da minha lista ${FRUTAS[0]} - ${FRUTAS[1]}


Usando screen shots

    Log                 Nos testes web, podemos logar screnshots com a SelenumLibrary
    Open Browser    http://www.robotizandotestes.blogspot.com.br    firefox
    Capture Page Screenshot             nome_do_meuscreenshot.png
    Close Browser

    # Log     Nos testes web, podemos logar Screenshot com a SeleniumLibrary
    # Open Browser    http://www.robotizandotestes.blogspot.com.br    firefox
    # Capture Page Screenshot      nome_do_meuscreenshot.png
    # Close Browser