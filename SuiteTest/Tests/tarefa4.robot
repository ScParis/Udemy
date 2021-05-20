***Settings***

Documentation               Tarefa 4: Vamos praticar keywords com argumentos e retornos!

Library             SeleniumLibrary

***Variables***
&{PESSOA}               nome=Barney             sobrenome=Stinson

***Test Cases***
Email Fake

    Email Customizado


***Keywords***

Email Customizado
   Informação customizada           ${PESSOA.nome}          ${PESSOA.sobrenome}
   ${EMAIL}  Customizando e-mail   ${PESSOA.nome}          ${PESSOA.sobrenome}

   Log                              ${EMAIL}


Informação customizada
    [Arguments]         ${NOME_USUARIO}         ${SOBRENOME_USUARIO}
    Log                 Nome usuário: ${NOME_USUARIO}
    Log                 email: ${SOBRENOME_USUARIO}


Customizando e-mail
    [Arguments]             ${NOME_USUARIO}             ${IDADE_USUARIO}
    ${EMAIL_USUARIO}  Generate Random String
    [Return]                ${NOME_USUARIO}${SOBRENOME_USUARIO}${EMAIL_USUARIO}@testerobot.com