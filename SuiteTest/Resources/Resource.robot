***Settings***
Documentation       Resources que será utilizado nas 2 suites de teste;
Library             SeleniumLibrary
#Library             Browser

***Variables***

${URL}              http://automationpractice.com/
${BROWSER}          chrome
#${PRODUTO}          Blouse


***Keywords***
#Setup e Teardown
Abrir navegador
    Open Browser            about:blank          ${BROWSER}


Fechar navegador
    Close Browser

### Açoes do teste  ###

Acessar a página home do site
    Go To                   ${URL}
    Title Should Be         My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text              id=search_query_top      ${PRODUTO}

Clicar no botão pesquisar
    Click Element           name=submit_search


### Conferência ###
Conferir se o procuto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible           css=#center_column > h1
    Title Should Be                         Search - My Store
    Page Should Contain Image               xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link                xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible           xpath=//p[@class="alert alert-warning"]
    Element Text Should Be                  xpath=//p[@class="alert alert-warning"]         ${MENSAGEM_ALERTA}


Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                              xpath=//a[@title="Women"]

Clicar na sub categoria "${SUB_CATEGORY}"
    Mouse Down                              xpath=//a[@title="Women"]
    Mouse Down                              xpath=//a[@title="Summer Dresses"]

Clicar no botão "${AddToCart}" do produto
    Click Link                           xpath=//a[@href="http://automationpractice.com/index.php?id_product=1&controller=product&search_query=t-shirt&results=1"]
    Wait Until Element Is Visible           xpath=//h1[contains(text(), "Faded Short Sleeve T-shirts")]
    Click Element                              name=Submit
    Wait Until Element Is Visible           xpath=//i[@class="icon-ok"]

Clicar no botão "${checkout}"
    Click Element                           xpath=//a[@href="http://automationpractice.com/index.php?controller=order"][@title="Proceed to checkout"]
    Sleep                                   10
    Wait Until Element Is Visible           xpath=//h1[contains(text(), "Shopping-cart summary")]
    Click Link                              xpath=//a[@href="http://automationpractice.com/index.php?controller=order&step=1"]

Clicar no ícone carrinho de compras no menu superior direito
    Click Link                              xpath=//a[@href="http://automationpractice.com/index.php?controller=order"][@title="View my shopping cart"]

Clicar no botão de remoção de produtos ${delete} no produto do carrinho
    Click Link                              xptah=//a[@href="http://automationpractice.com/index.php?controller=cart&delete=1&id_product=1&ipa=1&id_address_delivery=0&token=e817bb0705dd58da8db074c69f729fd8"][@title="Delete"]