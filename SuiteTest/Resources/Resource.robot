***Settings***
Documentation       Resources que será utilizado nas 2 suites de teste;
Library             SeleniumLibrary
Library             FakerLibrary    locale=en_US


***Variables***

${url}                          http://automationpractice.com/
${browser}                      chrome


***Keywords***

#Setup e Teardown
Abrir navegador
    Open Browser            about:blank          ${browser}


Fechar navegador
    Close Browser

### Açoes do teste  ###

Acessar a página home do site
    Go To                                   ${url}
    Title Should Be                         My Store

Digitar o nome do produto "${produto}" no campo de pesquisa
    Input Text                              id=search_query_top      ${produto}

Clicar no botão pesquisar
    Click Element                           name=submit_search
    Wait Until Element Is Visible           xpath=//span[contains(text(), "Search")]/..//i[@class="icon-home"]

### Conferência ###
Conferir se o procuto "${produto}" foi listado no site
    Wait Until Element Is Visible           css=#center_column > h1
    Title Should Be                         Search - My Store
    Page Should Contain Image               xpath=//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link                xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Conferir mensagem de erro "${mensagem_alerta}"
    Wait Until Element Is Visible           xpath=//p[@class="alert alert-warning"]
    Element Text Should Be                  xpath=//p[@class="alert alert-warning"]         ${mensagem_alerta}

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Mouse Over                              xpath=//a[@title="Women"]

Clicar na sub categoria "${sub_category}"
    Mouse Down                              xpath=//a[@title="Women"]
    Mouse Down                              xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "${AddToCart}" do produto
    Click Link                              xpath=//a[@href="http://automationpractice.com/index.php?id_product=1&controller=product&search_query=t-shirt&results=1"]
    Wait Until Element Is Visible           xpath=//h1[contains(text(), "Faded Short Sleeve T-shirts")]
    Click Element                           name=Submit
    Wait Until Element Is Visible           xpath=//i[@class="icon-ok"]

Clicar no botão "${checkout}"
    Click Element                           xpath=//a[@href="http://automationpractice.com/index.php?controller=order"][@title="Proceed to checkout"]
    Wait Until Element Is Visible           xpath=//h1[contains(text(), "Shopping-cart summary")]
    Click Link                              xpath=//a[@href="http://automationpractice.com/index.php?controller=order&step=1"]

Clicar no ícone carrinho de compras no menu superior direito
    Click Link                              xpath=//a[@href="http://automationpractice.com/index.php?controller=order"][@title="View my shopping cart"]


O sistema deve exibir a mensagem "${shopping_cart_empty}"
    Element Text Should Be                  xpath=//p[@class="alert alert-warning"]         ${shopping_cart_empty}


Clicar no botão superior direito “${Sign_in}”
    Click Element                           xpath=//a[@href="http://automationpractice.com/index.php?controller=my-account"][@title="Log in to your customer account"]
    Wait Until Element Is Visible           xpath=//h3[contains(text(), "Create an account")]
    Wait Until Element Is Visible           xpath=//button[@name="SubmitLogin"]

Inserir um e-mail válido
    ${Email} =  Email    
    Log    ${Email}
    Set Suite Variable    ${Email}
    Input Text              xpath=//input[@name="email_create"]                 ${Email}             

Clicar no botão "Create an account"
   Click Element                            xpath=//button[@name="SubmitCreate"]
   Wait Until Element Is Visible            xpath=//h3[contains(text(), "Your personal information")]

Preencher os campos obrigatórios
    ${customer_firstname} =  First Name    
    Log    ${customer_firstname}
    Set Suite Variable    ${customer_firstname}
    Input Text                              xpath=//input[@name="customer_firstname"]           ${customer_firstname}


    ${customer_lastname} =  Last Name  
    Log    ${customer_lastname}
    Set Suite Variable    ${customer_lastname}
    Input Text                              xpath=//input[@name="customer_lastname"]            ${customer_lastname}

    
    ${passwd} =   Password           10            #special_chars=True
    Log    ${passwd}
    Set Suite Variable    ${passwd}
    Input Password                          xpath=//input[@name="passwd"]                       ${passwd}


#Your Address

    ${address1} =  Street Address  
    Log    ${address1}
    Set Suite Variable    ${address1}
    Input Text                              xpath=//input[@name="address1"]                     ${address1}


    ${city} =  City  
    Log    ${city}
    Set Suite Variable    ${city}
    Input Text                              xpath=//input[@name="city"]                         ${city}


    Click Element                           xpath=//select[@name="id_state"]//option[@value="1"]


    ${postcode} =   Postcode
    Log    ${postcode}
    Set Suite Variable    ${postcode}
    Input Text                              xpath=//input[@name="postcode"]                     ${postcode}


    ${phone_mobile} =  Phone Number  
    Log    ${phone_mobile}
    Set Suite Variable    ${phone_mobile}
    Input Text                              xpath=//input[@name="phone_mobile"]                 ${phone_mobile}


Clicar em "${Register}" para finalizar o cadastro
    Click Element                           xpath=//button[@name="submitAccount"]
    Wait Until Element Is Visible           xpath=//p[contains(text(), "Welcome to your account. Here you can manage all of your personal information and orders.")]