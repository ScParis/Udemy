***Settings***

Documentation           Exemplo de uso de variáveis como argumentos em keywords
Library                 SeleniumLibrary

***Variables***
&{PESSOA}           nome=Barney Stinson         email=b.stinson@laysertag.com           idade=12            sexo=masculino

***Test Cases***

Caso de Teste de Exemplo 01

    # Uma keyword qualquer 01
    Uma subkeyword com argumentos      ${PESSOA.nome}         Martins

***Keywords***
Uma keyword qualquer 01
    Uma subkeyword com argumentos   ${PESSOA.nome}   ${PESSOA.email} 
    ${MENSAGEM_ALERTA}          Uma subkeyword com retorno          ${PESSOA.nome}          ${PESSOA.idade}
    Log             ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos

    [Arguments]         ${NOME_USUARIO}     ${EMAIL_USUARIO}    
    Log                 Nome Usuário:  ${NOME_USUARIO}
    Log                 Email:  ${EMAIL_USUARIO}

# Uma subkeyword com retorno

#     [Arguments]         ${NOME_USUARIO}     ${IDADE_USUARIO}

#     ${MENSAGEM}         Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
#     [Return]        ${MENSAGEM}