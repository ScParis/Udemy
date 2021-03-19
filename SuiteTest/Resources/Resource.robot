***Settings***
Documentation       Resources que será utilizado nas 2 suites de teste;
Library             SeleniumLibrary
Library             Browser

***Variables***

${URL}              http://automationpractice.com/
${BROWSER}          chrome
#${PRODUTO}          Blouse


***Keywords***
#Setup e Teardown
Abrir navegador
    SeleniumLibrary.Open Browser            about:blank          ${BROWSER}


Fechar navegador
    SeleniumLibrary.Close Browser

### Açoes do teste  ###

Acessar a página home do site
    SeleniumLibrary.Go To                   ${URL}
    SeleniumLibrary.Title Should Be         My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    SeleniumLibrary.Input Text              id=search_query_top      ${PRODUTO}

Clicar no botão pesquisar
    SeleniumLibrary.Click Element           name=submit_search


### Conferência ###
Conferir se o procuto "${PRODUTO}" foi listado no site
    SeleniumLibrary.Wait Until Element Is Visible           css=#center_column > h1
    SeleniumLibrary.Title Should Be                         Search - My Store
    SeleniumLibrary.Page Should Contain Image               xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    SeleniumLibrary.Page Should Contain Link                xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    SeleniumLibrary.Wait Until Element Is Visible           xpath=//p[@class="alert alert-warning"]
    SeleniumLibrary.Element Text Should Be                  xpath=//p[@class="alert alert-warning"]         ${MENSAGEM_ALERTA}


Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    SeleniumLibrary.Mouse Over                              xpath=//a[@title="Women"]

Clicar na sub categoria "${SUB_CATEGORY}"
    SeleniumLibrary.Mouse Down                              xpath=//a[@title="Women"]
    SeleniumLibrary.Mouse Down                              xpath=//a[@title="Summer Dresses"]

Clicar no botão "${AddToCart}" do produto
    Browser.Click                                   xpath=//span[contains(text(), "Quick view")]/..


Clicar no botão "${checkout}"
    SeleniumLibrary.Mouse Down                              xpath=//a[@title="Proceed to checkout"]   

