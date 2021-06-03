***Settings***

# Library         ./libs/my_lib.py
Library         ../MyCustomLibraries/Libraries/HashLibrary/geradorHash.py


***Test Cases***
Teste de conversão de string para HASH sha256
    Converter "Estou ficando ninja em Robot Framework!!" para sha256

Teste de conversão de arquivo para HASH sha256
    Converter o arquivo "PDF_file.pdf" para sha256

***Keywords***
Converter "${CONTEUDO}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash    ${CONTEUDO}
    Log   ${CONTEUDO_HASH}

Converter o arquivo "${FILE}" para sha256
    ${CONTEUDO_HASH}   Gerar Hash Arquivo   expert/myLibs/${FILE}
    Log   ${CONTEUDO_HASH}