***Settings***
Documentation               Access at http://robotframework.org/robotframework/latest/libraries/Process.html

Library                     Process


***Test Cases***

Exemple 01: Open Program
    Open and close "Editor de Texto (Gedit)"

Exemple 02: Running and waiting for scripts/programs
    Run a script and wait until it finished with success
    Run the process and wait for it to finish with failure

Exemple 03: Running prompt commands
    Running miscellaneous commands at the prompt


***Keywords***
Open and close "Editor de Texto (Gedit)"
    ## Starts a process and doesn't wait for its response
    ## Reminder: To open the process on Windows you must use double slashes

    ${MEU_PROCESSO}     Start Process           gedit
    Sleep       3s
    Terminate Process       ${MEU_PROCESSO}         kill=True

Verify success in process execution

    # [Arguments]         ${PROCESSO}
    # ## RC igual a zero indica SUCESSO na execução do processo
    # Run Keyword And Continue On Failure         Should Be Equal As Integers         ${PROCESSO.rc}   0
    # ...     msg=ATENÇÃO!! O seu processo não executou com sucesso
    # ## Se ocorreu falha, valor logar ele.
    # Run Keyword If      ${PROCESSO.rc}!=0       Log         FALHA OCORRIDA: "${PROCESSO.stderr}"

    [Arguments]      ${PROCESSO}
    ## RC igual a zero indica SUCESSO na execução do processo
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${PROCESSO.rc}    0
    ...   msg=ATENÇÃO! O seu processo não executou com sucesso
    ## Se ocorreu erro, vamos logar ele
    Run Keyword If   ${PROCESSO.rc}!=0   Log   FALHA OCORRIDA: "${PROCESSO.stderr}"


Run a script and wait until it finished with success
    ## Start the process and wait for it to finish
    ${MEU_PROCESSO}     Run Process         python3         expert/process/hello_world.py
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc}
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Verify success in process execution      ${MEU_PROCESSO}

Run the process and wait for it to finish with failure
    ## Start the process and wait for it to finish
    ${MEU_PROCESSO}     Run Process     python3   expert/process/hello_world.py
    Log    Resultado da execução (sucesso/falha): ${MEU_PROCESSO.rc}
    Log    Saída da execução: ${MEU_PROCESSO.stdout}
    Log    Falha da execução: ${MEU_PROCESSO.stderr}
    Verify success in process execution      ${MEU_PROCESSO}

Running miscellaneous commands at the prompt
    ## Use shell=True attribute to enable shell functions.
    ## how to create a directory, for example

    Run Process     mkdir Robot_Folder      cwd=${CURDIR}       shell=True